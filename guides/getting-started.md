# Getting Started

## Installation

Add `twilio_elixir` to your dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:twilio_elixir, "~> 0.1.0"}
  ]
end
```

Requires Elixir 1.19+ and OTP 27+.

## Configuration

Add your Twilio credentials to your application config. The recommended
pattern is to use `config/dev.exs` for test credentials and
`config/runtime.exs` for production:

```elixir
# config/dev.exs
import Config

config :twilio_elixir,
  account_sid: "ACxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
  auth_token: "your_test_auth_token"
```

```elixir
# config/runtime.exs
import Config

if config_env() == :prod do
  config :twilio_elixir,
    account_sid: System.fetch_env!("TWILIO_ACCOUNT_SID"),
    auth_token: System.fetch_env!("TWILIO_AUTH_TOKEN")
end
```

### All Config Options

The only required keys are `:account_sid` and `:auth_token`. Everything else
has sensible defaults:

```elixir
config :twilio_elixir,
  # Required
  account_sid: "ACxxx",
  auth_token: "your_auth_token",

  # Optional — all have defaults if omitted
  region: "ie1",            # Twilio region (default: nil — US)
  edge: "dublin",           # Twilio edge location (default: nil)
  max_retries: 3            # retry attempts (default: 0 — no retry)
```

| Key | Default | Description |
|-----|---------|-------------|
| `:account_sid` | required | Twilio Account SID (`ACxxx`) |
| `:auth_token` | required | Twilio Auth Token |
| `:region` | `nil` | Twilio region (e.g. `"us1"`, `"ie1"`, `"au1"`) |
| `:edge` | `nil` | Twilio edge location (e.g. `"ashburn"`, `"dublin"`, `"sydney"`) |
| `:max_retries` | `0` | Max retry attempts for failed requests |

## Creating a Client

Once configured, create a client with no arguments — it reads from your config
automatically:

```elixir
client = Twilio.client()
```

### Explicit Credentials

For multi-tenant apps or subaccounts, pass credentials directly:

```elixir
client = Twilio.client("ACxxx", "auth_token_xxx")
```

### With Options

Override config values for a specific client:

```elixir
client = Twilio.client("ACxxx", "auth_token_xxx",
  max_retries: 3,
  region: "ie1",
  edge: "dublin"
)
```

### Subaccounts

To make calls on behalf of a subaccount, pass the subaccount SID as the
`:account_sid` option while authenticating with the parent credentials:

```elixir
client = Twilio.client("ACparent_sid", "parent_auth_token",
  account_sid: "ACsubaccount_sid"
)
```

### Config Precedence

Options are resolved in this order (highest wins):

1. Explicit arguments to `client/2` or `client/3`
2. Application config (`config :twilio_elixir, ...`)
3. Struct defaults (e.g. `max_retries: 0`)

Clients are plain structs with no global state — safe for concurrent use
with multiple accounts.

## Making API Calls

Service modules map to Twilio's API resources. Each method takes the client
as the first argument:

```elixir
# Send a message
{:ok, message} = Twilio.Api.V2010.MessageService.create(client, %{
  "To" => "+15551234567",
  "From" => "+15559876543",
  "Body" => "Hello from Elixir!"
})

# Fetch a call
{:ok, call} = Twilio.Api.V2010.CallService.fetch(client, "CAxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")

# List recent messages
{:ok, page} = Twilio.Api.V2010.MessageService.list(client, %{"PageSize" => "20"})
```

### Service Module Naming

Service modules follow the pattern `Twilio.<Product>.<Version>.<Resource>Service`:

| Twilio Product | Example Module |
|---------------|----------------|
| Core API | `Twilio.Api.V2010.MessageService` |
| Messaging | `Twilio.Messaging.V1.ServiceService` |
| Verify | `Twilio.Verify.V2.ServiceService` |
| Conversations | `Twilio.Conversations.V1.ConversationService` |
| Voice | `Twilio.Voice.V1.SourceIpMappingService` |

This mirrors Twilio's internal Domain/Version/Resource hierarchy.

## Typed Responses

API responses are automatically deserialized into typed Elixir structs:

```elixir
message.sid     #=> "SMxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
message.status  #=> "queued"
message.body    #=> "Hello from Elixir!"
message.__struct__ #=> Twilio.Resources.Api.V2010.Message
```

## Error Handling

All API errors return `{:error, %Twilio.Error{}}`:

```elixir
case Twilio.Api.V2010.MessageService.create(client, params) do
  {:ok, message} ->
    IO.puts("Sent: #{message.sid}")

  {:error, %Twilio.Error{code: 21211} = err} ->
    IO.puts("Invalid 'To' number: #{err.message}")

  {:error, %Twilio.Error{code: 21608}} ->
    IO.puts("Unverified number — add it in the Twilio console")

  {:error, err} ->
    IO.puts("Error #{err.code}: #{err.message}")
end
```

Common Twilio error codes:

| Code | Meaning |
|------|---------|
| 20003 | Authentication failure |
| 20404 | Resource not found |
| 20429 | Too many requests (rate limited) |
| 21211 | Invalid "To" phone number |
| 21608 | Unverified phone number |
| 30006 | Landline or unreachable carrier |

## Pagination

### Single Page

```elixir
{:ok, page} = Twilio.Api.V2010.MessageService.list(client, %{"PageSize" => "50"})
page.items  #=> [%Twilio.Resources.Api.V2010.Message{}, ...]
```

### Auto-Paging Stream

Lazily iterate through all pages:

```elixir
client
|> Twilio.Api.V2010.MessageService.stream(%{"PageSize" => "100"})
|> Stream.filter(fn msg -> msg.status == "delivered" end)
|> Stream.take(500)
|> Enum.to_list()
```

The stream handles both Twilio pagination formats (v2010 flat and v1/v2/v3
meta wrapper) transparently.

## Updating and Deleting

```elixir
# Update
{:ok, updated} = Twilio.Api.V2010.MessageService.update(client, "SMxxx", %{
  "Body" => ""
})

# Delete (returns :ok on success)
:ok = Twilio.Api.V2010.MessageService.delete(client, "SMxxx")
```

## Response Metadata

Access HTTP status, headers, and request ID by passing `return_response: true`
as an option to the client request:

```elixir
{:ok, message, response} = Twilio.Api.V2010.MessageService.fetch(
  client, "SMxxx", return_response: true
)

response.status     #=> 200
response.request_id #=> "RQxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
response.headers    #=> [{"content-type", "application/json"}, ...]
```

## Retries

Failed requests (429, 5xx, connection errors) can be automatically retried
with exponential backoff and jitter:

```elixir
# Via config
config :twilio_elixir, max_retries: 3

# Or per-client
client = Twilio.client("ACxxx", "token", max_retries: 3)
```

When retries are enabled on POST requests, an idempotency token
(`I-Twilio-Idempotency-Token`) is automatically generated and reused across
retry attempts to prevent duplicate creates.

The library also respects the `Retry-After` header on 429 responses, waiting
the server-specified duration before retrying.

## Next Steps

- [Webhooks](webhooks.md) — verify incoming Twilio requests
- [TwiML](twiml.md) — generate XML responses for voice and messaging
- [Testing](testing.md) — stub HTTP requests in your test suite
- [Telemetry](telemetry.md) — observability and metrics
