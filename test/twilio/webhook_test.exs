defmodule Twilio.WebhookTest do
  use ExUnit.Case, async: true

  alias Twilio.Webhook

  # Test values derived from Twilio's official documentation
  # https://www.twilio.com/docs/usage/security#validating-requests
  @auth_token "12345"
  @url "https://mycompany.com/myapp.php?foo=1&bar=2"
  @params %{
    "CallSid" => "CA1234567890ABCDE",
    "Caller" => "+14158675310",
    "Digits" => "1234",
    "From" => "+14158675310",
    "To" => "+18005551212"
  }

  describe "valid?/4" do
    test "returns true for a correct signature" do
      signature = Webhook.build_signature(@url, @params, @auth_token)
      assert Webhook.valid?(@url, @params, signature, @auth_token)
    end

    test "returns false for an incorrect signature" do
      refute Webhook.valid?(@url, @params, "wrong_signature==", @auth_token)
    end

    test "returns false for a tampered URL" do
      signature = Webhook.build_signature(@url, @params, @auth_token)
      refute Webhook.valid?("https://evil.com/myapp.php", @params, signature, @auth_token)
    end

    test "returns false for tampered params" do
      signature = Webhook.build_signature(@url, @params, @auth_token)
      tampered = Map.put(@params, "Digits", "9999")
      refute Webhook.valid?(@url, tampered, signature, @auth_token)
    end

    test "returns false for wrong auth token" do
      signature = Webhook.build_signature(@url, @params, @auth_token)
      refute Webhook.valid?(@url, @params, signature, "wrong_token")
    end

    test "works with empty params (GET request)" do
      signature = Webhook.build_signature(@url, %{}, @auth_token)
      assert Webhook.valid?(@url, %{}, signature, @auth_token)
    end
  end

  describe "valid_body?/4" do
    test "validates a JSON body webhook" do
      body = ~s({"key":"value"})
      url = "https://mycompany.com/webhook"

      # Build expected: append bodySHA256 to URL, then sign
      body_hash = Webhook.build_body_hash(body)
      url_with_hash = "#{url}?bodySHA256=#{body_hash}"
      signature = Webhook.build_signature(url_with_hash, %{}, @auth_token)

      assert Webhook.valid_body?(url, body, signature, @auth_token)
    end

    test "returns false for tampered body" do
      body = ~s({"key":"value"})
      url = "https://mycompany.com/webhook"

      body_hash = Webhook.build_body_hash(body)
      url_with_hash = "#{url}?bodySHA256=#{body_hash}"
      signature = Webhook.build_signature(url_with_hash, %{}, @auth_token)

      refute Webhook.valid_body?(url, ~s({"key":"tampered"}), signature, @auth_token)
    end

    test "appends with & when URL already has query params" do
      body = ~s({"test":true})
      url = "https://mycompany.com/webhook?existing=param"

      body_hash = Webhook.build_body_hash(body)
      url_with_hash = "#{url}&bodySHA256=#{body_hash}"
      signature = Webhook.build_signature(url_with_hash, %{}, @auth_token)

      assert Webhook.valid_body?(url, body, signature, @auth_token)
    end
  end

  describe "build_signature/3" do
    test "produces a base64-encoded HMAC-SHA1" do
      sig = Webhook.build_signature("https://example.com", %{}, "secret")
      # Should be valid base64
      assert {:ok, _} = Base.decode64(sig)
    end

    test "sorts params alphabetically by key" do
      params = %{"Zebra" => "z", "Apple" => "a", "Mango" => "m"}
      sig1 = Webhook.build_signature("https://x.com", params, "key")

      # Same params in different insertion order should produce same signature
      params2 = %{"Mango" => "m", "Apple" => "a", "Zebra" => "z"}
      sig2 = Webhook.build_signature("https://x.com", params2, "key")

      assert sig1 == sig2
    end
  end

  describe "build_body_hash/1" do
    test "produces a lowercase hex SHA256" do
      hash = Webhook.build_body_hash("test body")
      assert String.match?(hash, ~r/^[0-9a-f]{64}$/)
    end
  end
end
