# Testing

`Twilio.Test` provides process-scoped HTTP stubs via NimbleOwnership, so
your tests can run with `async: true` without interference.

## Setup

Start the test stub server in your `test/test_helper.exs`:

```elixir
Twilio.Test.start()
ExUnit.start()
```

## Stubbing Requests

Use `Twilio.Test.stub/1` to define how the HTTP layer responds. The stub
function receives `(method, url, headers, body)` and returns a
`{status, headers, body}` tuple:

```elixir
defmodule MyApp.NotifierTest do
  use ExUnit.Case, async: true

  test "sends an SMS" do
    Twilio.Test.stub(fn _method, _url, _headers, _body ->
      {201, [], ~s({"sid": "SMxxx", "status": "queued", "body": "Hello!"})}
    end)

    client = Twilio.client("ACtest", "token")

    {:ok, msg} = Twilio.Api.V2010.MessageService.create(client, %{
      "To" => "+15551234567",
      "From" => "+15559876543",
      "Body" => "Hello!"
    })

    assert msg.sid == "SMxxx"
    assert msg.status == "queued"
  end
end
```

## Asserting on Request Parameters

The stub receives the full request, so you can assert on the URL, body,
headers, or method:

```elixir
test "sends correct params" do
  Twilio.Test.stub(fn method, url, _headers, body ->
    assert method == "POST"
    assert url =~ "/Messages.json"

    params = URI.decode_query(body)
    assert params["To"] == "+15551234567"
    assert params["Body"] == "Hello!"

    {201, [], ~s({"sid": "SMxxx"})}
  end)

  client = Twilio.client("ACtest", "token")
  {:ok, _} = Twilio.Api.V2010.MessageService.create(client, %{
    "To" => "+15551234567",
    "Body" => "Hello!"
  })
end
```

## Simulating Errors

Return non-200 status codes to test error handling:

```elixir
test "handles invalid number" do
  Twilio.Test.stub(fn _method, _url, _headers, _body ->
    {400, [],
     ~s({"code": 21211, "message": "The 'To' number is not a valid phone number.", "status": 400})}
  end)

  client = Twilio.client("ACtest", "token")
  {:error, err} = Twilio.Api.V2010.MessageService.create(client, %{
    "To" => "not-a-number",
    "From" => "+15559876543",
    "Body" => "Test"
  })

  assert err.code == 21211
  assert err.message =~ "not a valid phone number"
end
```

## Testing Pagination

Stub multiple pages to test auto-paging behavior:

```elixir
test "streams through pages" do
  call_count = :counters.new(1, [:atomics])

  Twilio.Test.stub(fn _method, url, _headers, _body ->
    count = :counters.get(call_count, 1)
    :counters.add(call_count, 1, 1)

    if count == 0 do
      {200, [], ~s({
        "messages": [{"sid": "SM001"}, {"sid": "SM002"}],
        "meta": {
          "key": "messages",
          "next_page_url": "#{url}?Page=1",
          "page": 0,
          "page_size": 2
        }
      })}
    else
      {200, [], ~s({
        "messages": [{"sid": "SM003"}],
        "meta": {
          "key": "messages",
          "next_page_url": null,
          "page": 1,
          "page_size": 2
        }
      })}
    end
  end)

  client = Twilio.client("ACtest", "token")
  items = client
  |> Twilio.Messaging.V1.MessageService.stream()
  |> Enum.to_list()

  assert length(items) == 3
end
```

## Process Isolation

Stubs are scoped to the test process that defines them. This means:

- **`async: true` works** — concurrent tests don't interfere with each other
- **No shared state** — each test sets up its own stubs independently
- **Automatic cleanup** — stubs are removed when the test process exits

Under the hood, `Twilio.Test` uses `NimbleOwnership` to associate stubs
with the calling process. If your test spawns child processes that make
Twilio calls, you can allow them to share the parent's stubs:

```elixir
test "works in spawned processes" do
  Twilio.Test.stub(fn _method, _url, _headers, _body ->
    {200, [], ~s({"sid": "SMxxx", "status": "sent"})}
  end)

  task = Task.async(fn ->
    Twilio.Test.allow(self())
    client = Twilio.client("ACtest", "token")
    Twilio.Api.V2010.MessageService.fetch(client, "SMxxx")
  end)

  assert {:ok, msg} = Task.await(task)
  assert msg.sid == "SMxxx"
end
```

## Testing Webhooks

`Twilio.Webhook` functions are pure — they don't make HTTP calls, so test
them directly without stubs:

```elixir
test "validates webhook signature" do
  auth_token = "12345"
  url = "https://myapp.com/twilio/webhook"
  params = %{"CallSid" => "CA123", "From" => "+14158675310"}

  signature = Twilio.Webhook.build_signature(url, params, auth_token)

  assert Twilio.Webhook.valid?(url, params, signature, auth_token)
  refute Twilio.Webhook.valid?(url, params, "wrong_signature", auth_token)
end
```

## Testing TwiML

TwiML builders are also pure functions — assert on the generated XML:

```elixir
test "generates voice response" do
  xml = Twilio.TwiML.VoiceResponse.new()
  |> Twilio.TwiML.VoiceResponse.say("Hello!", voice: "alice")
  |> Twilio.TwiML.VoiceResponse.to_xml()

  assert xml =~ ~s(<Say voice="alice">Hello!</Say>)
  assert xml =~ "<Response>"
end
```

## Tips

- **Keep stubs minimal.** Only include the fields your test actually checks.
  The deserializer handles missing fields gracefully.
- **Use `async: true`.** The ownership model is designed for it.
- **Don't stub webhooks or TwiML.** They are pure functions that don't make
  HTTP calls.
- **Stub the response format correctly.** Twilio returns JSON with
  `snake_case` keys (e.g. `"account_sid"`, `"date_created"`).
