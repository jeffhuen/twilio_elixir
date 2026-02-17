# Telemetry

The library emits `:telemetry` events for every Twilio API request, giving
you observability into latency, error rates, retry behavior, and more.

## Events

| Event | Measurements | Metadata |
|-------|-------------|----------|
| `[:twilio, :request, :start]` | `system_time` | `method`, `path`, `product` |
| `[:twilio, :request, :stop]` | `duration` | `method`, `path`, `product`, `status`, `retries`, `request_id`, `error` |
| `[:twilio, :request, :exception]` | `duration` | `method`, `path`, `product`, `kind`, `reason` |
| `[:twilio, :request, :retry]` | `attempt`, `wait_ms` | `method`, `path`, `product`, `status`, `reason` |

### Metadata Fields

| Field | Type | Description |
|-------|------|-------------|
| `method` | `atom` | HTTP method (`:get`, `:post`, `:delete`) |
| `path` | `String.t()` | Request path (e.g. `"/2010-04-01/Accounts/ACxxx/Messages.json"`) |
| `product` | `String.t()` | Twilio product domain (e.g. `"api"`, `"messaging"`, `"verify"`, `"conversations"`) |
| `status` | `integer \| nil` | HTTP status code (`nil` on connection errors) |
| `retries` | `integer` | Number of retries before final response (0 = first attempt succeeded) |
| `request_id` | `String.t() \| nil` | Twilio's server-side request ID from the `x-twilio-request-id` response header — useful for support tickets |
| `error` | `Twilio.Error.t() \| nil` | Error struct on failure, `nil` on success |
| `kind` | `atom` | Exception kind (`:error`, `:throw`, `:exit`) |
| `reason` | `term` | Exception reason or retry reason (`:rate_limited`, `:server_error`, `:connection_error`) |
| `attempt` | `integer` | Current retry attempt number |
| `wait_ms` | `integer` | Milliseconds to wait before retrying |

### Measurements

- `system_time` — wall-clock time at `:start` (from `System.system_time()`)
- `duration` — elapsed time in native units (use `System.convert_time_unit/3`)
- `attempt` — retry attempt counter (1 = first retry, 2 = second retry, etc.)
- `wait_ms` — backoff wait time in milliseconds

## Logging

Attach a handler to log every Twilio request:

```elixir
# lib/my_app/telemetry.ex
defmodule MyApp.Telemetry do
  require Logger

  def setup do
    :telemetry.attach_many("twilio-logger",
      [
        [:twilio, :request, :stop],
        [:twilio, :request, :exception],
        [:twilio, :request, :retry]
      ],
      &handle_event/4,
      nil
    )
  end

  defp handle_event([:twilio, :request, :stop], %{duration: duration}, meta, _config) do
    ms = System.convert_time_unit(duration, :native, :millisecond)
    retries = if meta.retries > 0, do: " (#{meta.retries} retries)", else: ""
    req_id = if meta.request_id, do: " [#{meta.request_id}]", else: ""

    if meta.error do
      Logger.error("Twilio #{meta.product} #{meta.method} #{meta.path} -> #{meta.status} in #{ms}ms#{retries}#{req_id}: #{meta.error.message}")
    else
      Logger.info("Twilio #{meta.product} #{meta.method} #{meta.path} -> #{meta.status} in #{ms}ms#{retries}#{req_id}")
    end
  end

  defp handle_event([:twilio, :request, :exception], %{duration: duration}, meta, _config) do
    ms = System.convert_time_unit(duration, :native, :millisecond)

    Logger.error("Twilio #{meta.product} #{meta.method} #{meta.path} raised #{inspect(meta.reason)} in #{ms}ms")
  end

  defp handle_event([:twilio, :request, :retry], %{attempt: attempt, wait_ms: wait}, meta, _config) do
    Logger.warning(
      "Twilio #{meta.product} #{meta.method} #{meta.path} retry ##{attempt} " <>
      "(#{meta.reason}, status: #{inspect(meta.status)}, waiting #{wait}ms)"
    )
  end
end
```

Call `MyApp.Telemetry.setup()` in your application's `start/2`:

```elixir
def start(_type, _args) do
  MyApp.Telemetry.setup()

  children = [
    # ...
  ]

  Supervisor.start_link(children, strategy: :one_for_one)
end
```

## StatsD / Prometheus

Route telemetry to your metrics backend:

```elixir
:telemetry.attach("twilio-metrics", [:twilio, :request, :stop], fn
  _event, %{duration: duration}, meta, _config ->
    ms = System.convert_time_unit(duration, :native, :millisecond)

    # Normalize high-cardinality path segments (SIDs)
    resource =
      meta.path
      |> String.split("/")
      |> Enum.map(fn seg ->
        if String.match?(seg, ~r/^(AC|SM|CA|MM|CF|PN|SK|US)[0-9a-f]{32}$/i) do
          ":sid"
        else
          seg
        end
      end)
      |> Enum.join("/")

    :telemetry.execute([:my_app, :twilio, :request], %{duration_ms: ms}, %{
      method: meta.method,
      product: meta.product,
      resource: resource,
      status: meta.status,
      retries: meta.retries,
      request_id: meta.request_id
    })
end, nil)
```

The SID pattern matching replaces 34-character Twilio SIDs (`SM` + 32 hex
chars) with `:sid` to keep metric cardinality low.

## Dashboard Queries

Common things to track:

- **P99 latency** by endpoint — group by `product` + `resource`, measure `duration_ms`
- **Error rate** — count events where `status >= 400` or `error != nil`
- **Retry rate** — count events where `retries > 0`
- **Rate limit hits** — count `:retry` events where `reason == :rate_limited`
- **Status code distribution** — group by `product` + `status`
- **Request tracing** — use `request_id` to correlate with Twilio support

## Retry Observability

The `:retry` event is emitted each time a request is retried, giving you
real-time visibility into retry behavior:

```
[warning] Twilio api POST /2010-04-01/.../Messages.json retry #1 (rate_limited, status: 429, waiting 1000ms)
[warning] Twilio api POST /2010-04-01/.../Messages.json retry #2 (rate_limited, status: 429, waiting 2340ms)
[info] Twilio api POST /2010-04-01/.../Messages.json -> 201 in 3456ms (2 retries) [RQxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx]
```

The `reason` field in retry metadata tells you why the retry happened:

| Reason | Trigger |
|--------|---------|
| `:rate_limited` | 429 response |
| `:server_error` | 500, 502, 503, or 409 response |
| `:connection_error` | `Mint.TransportError` (DNS, TLS, timeout) |

## Connection Pool Monitoring

The Finch connection pool also emits its own telemetry events. Attach to
`[:finch, :request, :stop]` for connection-level metrics, or
`[:finch, :queue, :stop]` for pool queue wait times.
