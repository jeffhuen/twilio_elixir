defmodule Twilio.TwiMLTest do
  use ExUnit.Case, async: true

  alias Twilio.TwiML
  alias Twilio.TwiML.VoiceResponse
  alias Twilio.TwiML.MessagingResponse

  describe "VoiceResponse" do
    test "empty response" do
      xml = VoiceResponse.new() |> VoiceResponse.to_xml()
      assert xml == ~s(<?xml version="1.0" encoding="UTF-8"?><Response></Response>)
    end

    test "say with text" do
      xml =
        VoiceResponse.new()
        |> VoiceResponse.say("Hello world")
        |> VoiceResponse.to_xml()

      assert xml =~ "<Say>Hello world</Say>"
    end

    test "say with voice and language" do
      xml =
        VoiceResponse.new()
        |> VoiceResponse.say("Hello", voice: "alice", language: "en-US")
        |> VoiceResponse.to_xml()

      assert xml =~ ~s(<Say language="en-US" voice="alice">Hello</Say>)
    end

    test "play audio" do
      xml =
        VoiceResponse.new()
        |> VoiceResponse.play("https://example.com/audio.mp3", loop: 2)
        |> VoiceResponse.to_xml()

      assert xml =~ ~s(<Play loop="2">https://example.com/audio.mp3</Play>)
    end

    test "gather with nested say" do
      xml =
        VoiceResponse.new()
        |> VoiceResponse.gather(
          num_digits: 1,
          action: "/handle",
          children: [
            VoiceResponse.say_element("Press 1 for sales.")
          ]
        )
        |> VoiceResponse.to_xml()

      assert xml =~ ~s(<Gather action="/handle" numDigits="1">)
      assert xml =~ "<Say>Press 1 for sales.</Say>"
      assert xml =~ "</Gather>"
    end

    test "dial a number" do
      xml =
        VoiceResponse.new()
        |> VoiceResponse.dial("+15551234567", timeout: 30)
        |> VoiceResponse.to_xml()

      assert xml =~ ~s(<Dial timeout="30">+15551234567</Dial>)
    end

    test "dial with nested nouns" do
      xml =
        VoiceResponse.new()
        |> VoiceResponse.dial(nil,
          caller_id: "+15559876543",
          children: [
            VoiceResponse.number("+15551234567", send_digits: "wwww1928"),
            VoiceResponse.client("jenny")
          ]
        )
        |> VoiceResponse.to_xml()

      assert xml =~ ~s(<Dial callerId="+15559876543">)
      assert xml =~ ~s(<Number sendDigits="wwww1928">+15551234567</Number>)
      assert xml =~ "<Client>jenny</Client>"
    end

    test "record" do
      xml =
        VoiceResponse.new()
        |> VoiceResponse.record(max_length: 30, action: "/handle-recording")
        |> VoiceResponse.to_xml()

      assert xml =~ ~s(<Record action="/handle-recording" maxLength="30"/>)
    end

    test "redirect" do
      xml =
        VoiceResponse.new()
        |> VoiceResponse.redirect("/next-step", method: "POST")
        |> VoiceResponse.to_xml()

      assert xml =~ ~s(<Redirect method="POST">/next-step</Redirect>)
    end

    test "hangup" do
      xml = VoiceResponse.new() |> VoiceResponse.hangup() |> VoiceResponse.to_xml()
      assert xml =~ "<Hangup/>"
    end

    test "reject" do
      xml =
        VoiceResponse.new()
        |> VoiceResponse.reject(reason: "busy")
        |> VoiceResponse.to_xml()

      assert xml =~ ~s(<Reject reason="busy"/>)
    end

    test "pause" do
      xml =
        VoiceResponse.new()
        |> VoiceResponse.pause(length: 3)
        |> VoiceResponse.to_xml()

      assert xml =~ ~s(<Pause length="3"/>)
    end

    test "enqueue" do
      xml =
        VoiceResponse.new()
        |> VoiceResponse.enqueue("support", wait_url: "/wait-music")
        |> VoiceResponse.to_xml()

      assert xml =~ ~s(<Enqueue waitUrl="/wait-music">support</Enqueue>)
    end

    test "complex IVR flow" do
      xml =
        VoiceResponse.new()
        |> VoiceResponse.say("Welcome to Acme Corp.", voice: "alice")
        |> VoiceResponse.gather(
          num_digits: 1,
          timeout: 5,
          children: [
            VoiceResponse.say_element("Press 1 for sales, 2 for support.")
          ]
        )
        |> VoiceResponse.say("We didn't receive any input. Goodbye!")
        |> VoiceResponse.hangup()
        |> VoiceResponse.to_xml()

      assert xml =~ ~s(<?xml version="1.0" encoding="UTF-8"?>)
      assert xml =~ "<Response>"
      assert xml =~ ~s(<Say voice="alice">Welcome to Acme Corp.</Say>)
      assert xml =~ "<Gather"
      assert xml =~ "<Hangup/>"
    end

    test "XML escaping in text" do
      xml =
        VoiceResponse.new()
        |> VoiceResponse.say("Hello <world> & \"friends\"")
        |> VoiceResponse.to_xml()

      assert xml =~ "Hello &lt;world&gt; &amp; \"friends\""
    end

    test "XML escaping in attributes" do
      xml =
        VoiceResponse.new()
        |> VoiceResponse.redirect("/path?a=1&b=2")
        |> VoiceResponse.to_xml()

      assert xml =~ "/path?a=1&amp;b=2"
    end
  end

  describe "MessagingResponse" do
    test "empty response" do
      xml = MessagingResponse.new() |> MessagingResponse.to_xml()
      assert xml == ~s(<?xml version="1.0" encoding="UTF-8"?><Response></Response>)
    end

    test "simple message" do
      xml =
        MessagingResponse.new()
        |> MessagingResponse.message("Thanks for your message!")
        |> MessagingResponse.to_xml()

      assert xml =~ "<Message><Body>Thanks for your message!</Body></Message>"
    end

    test "message with to/from" do
      xml =
        MessagingResponse.new()
        |> MessagingResponse.message("Hello", to: "+15551234567", from: "+15559876543")
        |> MessagingResponse.to_xml()

      assert xml =~ ~s(<Message from="+15559876543" to="+15551234567">)
      assert xml =~ "<Body>Hello</Body>"
    end

    test "message with media" do
      xml =
        MessagingResponse.new()
        |> MessagingResponse.message("Check this out!",
          children: [MessagingResponse.media("https://example.com/image.jpg")]
        )
        |> MessagingResponse.to_xml()

      assert xml =~ "<Body>Check this out!</Body>"
      assert xml =~ "<Media>https://example.com/image.jpg</Media>"
    end

    test "redirect" do
      xml =
        MessagingResponse.new()
        |> MessagingResponse.redirect("/next")
        |> MessagingResponse.to_xml()

      assert xml =~ "<Redirect>/next</Redirect>"
    end
  end

  describe "TwiML base" do
    test "add_element builds elements list" do
      twiml =
        %TwiML{}
        |> TwiML.add_element("Say", %{}, ["Hello"])
        |> TwiML.add_element("Pause", %{"length" => "2"}, [])

      assert length(twiml.elements) == 2
    end
  end
end
