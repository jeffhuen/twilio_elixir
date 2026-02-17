# Webhooks

Twilio sends webhook requests to your application when events happen — calls
connect, messages are received, status changes occur, etc. This guide covers
verifying and handling those requests.

## Signature Verification

Every webhook request includes an `X-Twilio-Signature` header. Always verify
it before trusting the payload to prevent spoofed requests.

### Form-Encoded Webhooks

Most Twilio webhooks send form-encoded POST bodies:

```elixir
url = "https://myapp.com/twilio/voice"
params = conn.params  # %{"CallSid" => "CA123", "From" => "+14158675310", ...}
signature = get_req_header(conn, "x-twilio-signature") |> List.first()
auth_token = Application.fetch_env!(:twilio_elixir, :auth_token)

if Twilio.Webhook.valid?(url, params, signature, auth_token) do
  handle_call(params)
else
  send_resp(conn, 403, "Invalid signature")
end
```

### JSON Body Webhooks

Some newer Twilio webhooks send JSON bodies. These use a different
verification method — a SHA256 hash of the body is appended to the URL:

```elixir
url = "https://myapp.com/twilio/status"
body = conn.assigns.raw_body  # the raw request body string
signature = get_req_header(conn, "x-twilio-signature") |> List.first()
auth_token = Application.fetch_env!(:twilio_elixir, :auth_token)

if Twilio.Webhook.valid_body?(url, body, signature, auth_token) do
  event = JSON.decode!(body)
  handle_event(event)
else
  send_resp(conn, 403, "Invalid signature")
end
```

## How Verification Works

Twilio's signature algorithm:

1. Take the full webhook URL (including scheme, host, port, and path)
2. For form-encoded bodies: sort the POST parameters alphabetically by key,
   then append each key-value pair to the URL
3. For JSON bodies: compute the SHA256 hash of the raw body, append it to the
   URL as `?bodySHA256=<hash>`
4. HMAC-SHA1 the resulting string using your Auth Token as the key
5. Base64-encode the result

The `X-Twilio-Signature` header contains this Base64-encoded HMAC. The SDK
uses constant-time comparison to prevent timing attacks.

## Phoenix Integration

### Basic Controller

```elixir
defmodule MyAppWeb.TwilioController do
  use MyAppWeb, :controller

  @auth_token Application.compile_env!(:twilio_elixir, :auth_token)

  def voice(conn, params) do
    url = current_url(conn)
    signature = get_req_header(conn, "x-twilio-signature") |> List.first()

    if Twilio.Webhook.valid?(url, params, signature, @auth_token) do
      xml = Twilio.TwiML.VoiceResponse.new()
      |> Twilio.TwiML.VoiceResponse.say("Hello! Thanks for calling.")
      |> Twilio.TwiML.VoiceResponse.to_xml()

      conn
      |> put_resp_content_type("text/xml")
      |> send_resp(200, xml)
    else
      send_resp(conn, 403, "Forbidden")
    end
  end

  def message(conn, params) do
    url = current_url(conn)
    signature = get_req_header(conn, "x-twilio-signature") |> List.first()

    if Twilio.Webhook.valid?(url, params, signature, @auth_token) do
      from = params["From"]
      body = params["Body"]
      Logger.info("SMS from #{from}: #{body}")

      xml = Twilio.TwiML.MessagingResponse.new()
      |> Twilio.TwiML.MessagingResponse.message("Thanks for your message!")
      |> Twilio.TwiML.MessagingResponse.to_xml()

      conn
      |> put_resp_content_type("text/xml")
      |> send_resp(200, xml)
    else
      send_resp(conn, 403, "Forbidden")
    end
  end

  defp current_url(conn) do
    MyAppWeb.Endpoint.url() <> conn.request_path
  end
end
```

### Router

```elixir
# lib/my_app_web/router.ex
scope "/twilio" do
  post "/voice", MyAppWeb.TwilioController, :voice
  post "/message", MyAppWeb.TwilioController, :message
end
```

## URL Considerations

The URL used for verification **must exactly match** the URL Twilio sends
the request to, including:

- **Scheme** (`https://` not `http://`)
- **Host** (the public-facing hostname, not `localhost`)
- **Port** (include non-standard ports like `:8443`)
- **Path** (exact match, including trailing slashes)

If you're behind a reverse proxy or load balancer, make sure you reconstruct
the URL from the original request, not the proxied one. Using your
endpoint's configured URL (as shown above) is usually the safest approach.

## Status Callbacks

When you create a call or message, you can specify a `StatusCallback` URL.
Twilio will send webhooks as the resource's status changes:

```elixir
{:ok, message} = Twilio.Api.V2010.MessageService.create(client, %{
  "To" => "+15551234567",
  "From" => "+15559876543",
  "Body" => "Hello!",
  "StatusCallback" => "https://myapp.com/twilio/status"
})
```

Status callback webhooks are verified the same way as other webhooks — check
the `X-Twilio-Signature` header.

## Common Webhook Parameters

### Voice Webhooks

| Parameter | Description |
|-----------|-------------|
| `CallSid` | Unique identifier for the call |
| `From` | Caller's phone number |
| `To` | Called phone number |
| `CallStatus` | `ringing`, `in-progress`, `completed`, `busy`, `no-answer`, `failed` |
| `Direction` | `inbound` or `outbound-api` |

### Messaging Webhooks

| Parameter | Description |
|-----------|-------------|
| `MessageSid` | Unique identifier for the message |
| `From` | Sender's phone number |
| `To` | Recipient's phone number |
| `Body` | Message text |
| `NumMedia` | Number of media attachments |
| `MediaUrl0` | URL of the first media attachment |

## Tips

- **Always verify signatures.** Never trust webhook data without checking
  `X-Twilio-Signature`.
- **Respond quickly.** Twilio expects a response within 15 seconds for voice
  webhooks or the call will fail. Process events asynchronously if needed.
- **Return TwiML.** Voice and messaging webhooks expect an XML response.
  See the [TwiML guide](twiml.md) for building responses.
- **Handle duplicates.** Network retries can cause the same webhook to arrive
  more than once. Use `CallSid` or `MessageSid` as an idempotency key.
- **Use HTTPS.** Twilio will only send webhooks to HTTPS URLs in production.
  For local development, use [ngrok](https://ngrok.com) or similar.
