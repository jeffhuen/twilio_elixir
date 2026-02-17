# TwiML

TwiML (Twilio Markup Language) is the XML that tells Twilio how to handle
incoming calls and messages. This library provides a functional builder API
for generating TwiML without writing raw XML.

## Voice Responses

Use `Twilio.TwiML.VoiceResponse` to build voice call instructions:

```elixir
alias Twilio.TwiML.VoiceResponse

xml = VoiceResponse.new()
|> VoiceResponse.say("Welcome to our phone system.")
|> VoiceResponse.to_xml()
```

Output:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Response>
  <Say>Welcome to our phone system.</Say>
</Response>
```

## Voice Verbs

### Say

Text-to-speech with optional voice and language:

```elixir
VoiceResponse.new()
|> VoiceResponse.say("Hello!", voice: "alice", language: "en-US")
|> VoiceResponse.to_xml()
```

### Play

Play an audio file or DTMF tones:

```elixir
VoiceResponse.new()
|> VoiceResponse.play("https://example.com/welcome.mp3")
|> VoiceResponse.play("ww12", digits: true)
|> VoiceResponse.to_xml()
```

### Gather

Collect user input (keypress or speech):

```elixir
VoiceResponse.new()
|> VoiceResponse.gather(
  num_digits: 1,
  action: "/handle-key",
  method: "POST",
  children: [
    {"Say", %{}, ["Press 1 for sales. Press 2 for support."]}
  ]
)
|> VoiceResponse.say("We didn't receive any input. Goodbye!")
|> VoiceResponse.to_xml()
```

The `children` option lets you nest verbs inside `<Gather>`. Each child is a
tuple of `{tag_name, attributes_map, [content]}`.

### Dial

Connect the caller to another phone number, SIP endpoint, or client:

```elixir
# Dial a number
VoiceResponse.new()
|> VoiceResponse.dial("+15551234567", caller_id: "+15559876543")
|> VoiceResponse.to_xml()

# Dial with nested nouns
VoiceResponse.new()
|> VoiceResponse.dial(nil,
  caller_id: "+15559876543",
  children: [
    {"Number", %{}, ["+15551111111"]},
    {"Number", %{}, ["+15552222222"]},
    {"Client", %{}, ["agent_jane"]}
  ]
)
|> VoiceResponse.to_xml()
```

Supported nested nouns: `Number`, `Client`, `Sip`, `Queue`.

### Record

Record the caller's voice:

```elixir
VoiceResponse.new()
|> VoiceResponse.say("Please leave a message after the beep.")
|> VoiceResponse.record(
  max_length: 30,
  action: "/handle-recording",
  transcribe: true,
  transcribe_callback: "/handle-transcription"
)
|> VoiceResponse.to_xml()
```

### Redirect

Transfer control to another TwiML URL:

```elixir
VoiceResponse.new()
|> VoiceResponse.redirect("/next-step")
|> VoiceResponse.to_xml()
```

### Control Verbs

```elixir
VoiceResponse.new()
|> VoiceResponse.pause(length: 2)    # Pause for 2 seconds
|> VoiceResponse.hangup()             # End the call
|> VoiceResponse.to_xml()
```

Other control verbs: `reject/1` (reject with reason), `enqueue/2` (add to
queue).

## Messaging Responses

Use `Twilio.TwiML.MessagingResponse` for incoming SMS/MMS replies:

```elixir
alias Twilio.TwiML.MessagingResponse

xml = MessagingResponse.new()
|> MessagingResponse.message("Thanks for your message!")
|> MessagingResponse.to_xml()
```

### Message with Media

Send MMS with media attachments:

```elixir
MessagingResponse.new()
|> MessagingResponse.message("Here's a photo!", media: "https://example.com/photo.jpg")
|> MessagingResponse.to_xml()
```

### Multiple Messages

```elixir
MessagingResponse.new()
|> MessagingResponse.message("Message 1")
|> MessagingResponse.message("Message 2")
|> MessagingResponse.to_xml()
```

### Redirect

Redirect to another TwiML URL for the messaging response:

```elixir
MessagingResponse.new()
|> MessagingResponse.redirect("/sms/next")
|> MessagingResponse.to_xml()
```

## Attribute Naming

TwiML attributes use camelCase in XML. The builder automatically converts
snake_case Elixir options to camelCase XML attributes:

| Elixir Option | XML Attribute |
|---------------|---------------|
| `num_digits:` | `numDigits=` |
| `caller_id:` | `callerId=` |
| `max_length:` | `maxLength=` |
| `transcribe_callback:` | `transcribeCallback=` |
| `status_callback:` | `statusCallback=` |

## XML Escaping

Text content and attribute values are automatically escaped:

```elixir
VoiceResponse.new()
|> VoiceResponse.say("Tom & Jerry say \"hello\" to <everyone>")
|> VoiceResponse.to_xml()
```

Produces: `<Say>Tom &amp; Jerry say &quot;hello&quot; to &lt;everyone&gt;</Say>`

## Phoenix Integration

Return TwiML from a Phoenix controller:

```elixir
defmodule MyAppWeb.TwilioController do
  use MyAppWeb, :controller

  def voice(conn, _params) do
    xml = Twilio.TwiML.VoiceResponse.new()
    |> Twilio.TwiML.VoiceResponse.say("Hello! Thanks for calling.")
    |> Twilio.TwiML.VoiceResponse.gather(
      num_digits: 1,
      action: "/twilio/handle-key",
      children: [
        {"Say", %{}, ["Press 1 for sales. Press 2 for support."]}
      ]
    )
    |> Twilio.TwiML.VoiceResponse.to_xml()

    conn
    |> put_resp_content_type("text/xml")
    |> send_resp(200, xml)
  end

  def message(conn, %{"Body" => body}) do
    reply = "You said: #{body}"

    xml = Twilio.TwiML.MessagingResponse.new()
    |> Twilio.TwiML.MessagingResponse.message(reply)
    |> Twilio.TwiML.MessagingResponse.to_xml()

    conn
    |> put_resp_content_type("text/xml")
    |> send_resp(200, xml)
  end
end
```

## IVR Example

A complete interactive voice response (IVR) menu:

```elixir
defmodule MyAppWeb.IVRController do
  use MyAppWeb, :controller

  def welcome(conn, _params) do
    xml = Twilio.TwiML.VoiceResponse.new()
    |> Twilio.TwiML.VoiceResponse.gather(
      num_digits: 1,
      action: "/twilio/menu",
      children: [
        {"Say", %{voice: "alice"}, [
          "Welcome to Acme Corp. " <>
          "Press 1 for sales. " <>
          "Press 2 for support. " <>
          "Press 0 to speak with an operator."
        ]}
      ]
    )
    |> Twilio.TwiML.VoiceResponse.say("We didn't receive any input. Goodbye!")
    |> Twilio.TwiML.VoiceResponse.to_xml()

    conn |> put_resp_content_type("text/xml") |> send_resp(200, xml)
  end

  def menu(conn, %{"Digits" => "1"}) do
    xml = Twilio.TwiML.VoiceResponse.new()
    |> Twilio.TwiML.VoiceResponse.say("Connecting you to sales.")
    |> Twilio.TwiML.VoiceResponse.dial("+15551234567")
    |> Twilio.TwiML.VoiceResponse.to_xml()

    conn |> put_resp_content_type("text/xml") |> send_resp(200, xml)
  end

  def menu(conn, %{"Digits" => "2"}) do
    xml = Twilio.TwiML.VoiceResponse.new()
    |> Twilio.TwiML.VoiceResponse.say("Connecting you to support.")
    |> Twilio.TwiML.VoiceResponse.enqueue("support")
    |> Twilio.TwiML.VoiceResponse.to_xml()

    conn |> put_resp_content_type("text/xml") |> send_resp(200, xml)
  end

  def menu(conn, _params) do
    xml = Twilio.TwiML.VoiceResponse.new()
    |> Twilio.TwiML.VoiceResponse.say("Invalid option. Please try again.")
    |> Twilio.TwiML.VoiceResponse.redirect("/twilio/welcome")
    |> Twilio.TwiML.VoiceResponse.to_xml()

    conn |> put_resp_content_type("text/xml") |> send_resp(200, xml)
  end
end
```

## Tips

- **Return TwiML quickly.** Twilio expects a response within 15 seconds for
  voice webhooks.
- **Use `children` for nesting.** `Gather`, `Dial`, and `Message` support
  nested elements via the `children:` option.
- **Alias for readability.** `alias Twilio.TwiML.VoiceResponse` makes
  chained calls much more readable.
