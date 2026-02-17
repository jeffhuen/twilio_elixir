# TwilioElixir

[![CI](https://github.com/jeffhuen/twilio_elixir/actions/workflows/ci.yml/badge.svg)](https://github.com/jeffhuen/twilio_elixir/actions/workflows/ci.yml)
[![Hex.pm](https://img.shields.io/hexpm/v/twilio_elixir.svg)](https://hex.pm/packages/twilio_elixir)

The complete Twilio SDK for Elixir — auto-generated from Twilio's
official [OpenAPI specs](https://github.com/twilio/twilio-oai) with full-fidelity
mapping across all 54 spec files, 37 products, 494 services, and 467 typed resources.

Twilio has a fragmented feature set across its official SDKs. This library aims to combine the best features from each the official Twilio SDKs (Python, Ruby, Node, and Java) and ships them all in one idiomatic Elixir package.

## Features

- **From Node** — 429 rate-limit retry with exponential backoff and full jitter
- **From Java** — 5xx server-error retry, connection pooling (Finch/NimblePool, auto-sized)
- **From Python** — Connection-error retry, auto-sized pool scaling
- **From Ruby** — TwiML generation (functional pipeline builder), webhook validation, API surface parity
- **New in this library** — Retry-After header parsing, idempotency tokens for safe POST retries, structured `:telemetry` events, typed `Twilio.Error` structs with `retryable?/1`
- **Full API coverage** — 494 services and 467 typed resources across 37 products, auto-generated from 54 OpenAPI spec files with full-fidelity mapping
- **Dual pagination** — Auto-detects v2010 flat and v1/v2/v3 meta wrapper formats
- **Async test stubs** — Per-process HTTP stubs via NimbleOwnership

## Installation

Add `twilio_elixir` to your dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:twilio_elixir, "~> 0.1"}
  ]
end
```

Requires Elixir 1.19+ and OTP 27+.

## Quick Start

### Configuration

```elixir
# config/runtime.exs
config :twilio_elixir,
  account_sid: System.fetch_env!("TWILIO_ACCOUNT_SID"),
  auth_token: System.fetch_env!("TWILIO_AUTH_TOKEN")
```

### Send a Message

```elixir
client = Twilio.client()

{:ok, message} = Twilio.Api.V2010.MessageService.create(client, %{
  "To" => "+15551234567",
  "From" => "+15559876543",
  "Body" => "Hello from Elixir!"
})

message.sid    #=> "SMxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
message.status #=> "queued"
```

### Make a Call

```elixir
{:ok, call} = Twilio.Api.V2010.CallService.create(client, %{
  "To" => "+15551234567",
  "From" => "+15559876543",
  "Url" => "http://demo.twilio.com/docs/voice.xml"
})
```

### Error Handling

```elixir
case Twilio.Api.V2010.MessageService.create(client, params) do
  {:ok, message} ->
    IO.puts("Sent: #{message.sid}")

  {:error, %Twilio.Error{code: 21211} = err} ->
    IO.puts("Invalid phone number: #{err.message}")

  {:error, %Twilio.Error{} = err} ->
    IO.puts("Error #{err.code}: #{err.message}")
end
```

### Pagination

```elixir
# Single page
{:ok, page} = Twilio.Api.V2010.MessageService.list(client)

# Lazy auto-paging stream
client
|> Twilio.Api.V2010.MessageService.stream()
|> Stream.take(100)
|> Enum.to_list()
```

## TwiML

Generate TwiML XML for voice and messaging webhooks:

```elixir
alias Twilio.TwiML.VoiceResponse

xml = VoiceResponse.new()
|> VoiceResponse.say("Hello! Press 1 for sales.", voice: "alice")
|> VoiceResponse.gather(num_digits: 1, action: "/handle-key", children: [
  {"Say", %{}, ["Press 1 for sales, 2 for support."]}
])
|> VoiceResponse.to_xml()
```

```elixir
alias Twilio.TwiML.MessagingResponse

xml = MessagingResponse.new()
|> MessagingResponse.message("Thanks for your message!")
|> MessagingResponse.to_xml()
```

See the [TwiML guide](guides/twiml.md) for all verbs and a complete IVR
example.

## Webhook Validation

Verify that incoming requests are from Twilio:

```elixir
# Form-encoded webhooks
Twilio.Webhook.valid?(url, params, signature, auth_token)

# JSON body webhooks
Twilio.Webhook.valid_body?(url, body, signature, auth_token)
```

See the [Webhooks guide](guides/webhooks.md) for Phoenix integration and
status callback handling.

## Testing

Use `Twilio.Test` to stub HTTP requests in your tests with `async: true`:

```elixir
defmodule MyApp.NotifierTest do
  use ExUnit.Case, async: true

  test "sends SMS" do
    Twilio.Test.stub(fn _method, _url, _headers, _body ->
      {201, [], ~s({"sid": "SMxxx", "status": "queued"})}
    end)

    client = Twilio.client("ACtest", "token")

    assert {:ok, msg} = Twilio.Api.V2010.MessageService.create(client, %{
      "To" => "+15551234567",
      "From" => "+15559876543",
      "Body" => "Test"
    })

    assert msg.sid == "SMxxx"
  end
end
```

See the [Testing guide](guides/testing.md) for error simulation, pagination
stubs, and process isolation patterns.

## Guides

- **[Getting Started](guides/getting-started.md)** - Installation,
  configuration, making API calls, pagination, retries
- **[Webhooks](guides/webhooks.md)** - Signature verification, Phoenix
  integration, status callbacks
- **[TwiML](guides/twiml.md)** - Voice and messaging XML builders, IVR
  example
- **[Testing](guides/testing.md)** - HTTP stubs, error simulation, async
  test patterns
- **[Telemetry](guides/telemetry.md)** - Observability, logging, metrics
  integration

## Telemetry Events

| Event | Measurements | Metadata |
|-------|-------------|----------|
| `[:twilio, :request, :start]` | `system_time` | `method`, `path`, `product` |
| `[:twilio, :request, :stop]` | `duration` | `method`, `path`, `product`, `status`, `retries`, `request_id`, `error` |
| `[:twilio, :request, :exception]` | `duration` | `method`, `path`, `product`, `kind`, `reason` |
| `[:twilio, :request, :retry]` | `attempt`, `wait_ms` | `method`, `path`, `product`, `status`, `reason` |

See the [Telemetry guide](guides/telemetry.md) for logging setup and
StatsD/Prometheus integration.

## Code Generation

The SDK is auto-generated from Twilio's OpenAPI specs. To regenerate:

```bash
# Download latest specs
bash scripts/sync_openapi.sh

# Generate code
mix twilio.generate --clean --stats
```

Weekly CI automatically pulls the latest specs, regenerates, and opens a PR.

## License

MIT License. See [LICENSE](LICENSE) for details.
