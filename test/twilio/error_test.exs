defmodule Twilio.ErrorTest do
  use ExUnit.Case, async: true

  alias Twilio.Error

  describe "from_response/3" do
    test "parses a 400 error response" do
      body =
        JSON.encode!(%{
          "code" => 21_211,
          "message" => "Invalid phone number",
          "more_info" => "https://twilio.com/docs/errors/21211"
        })

      error = Error.from_response(400, body, [])

      assert error.type == :invalid_request_error
      assert error.code == 21_211
      assert error.message == "Invalid phone number"
      assert error.http_status == 400
      assert error.more_info == "https://twilio.com/docs/errors/21211"
    end

    test "parses a 401 as authentication error" do
      body = JSON.encode!(%{"code" => 20_003, "message" => "Authenticate"})

      error = Error.from_response(401, body, [])

      assert error.type == :authentication_error
      assert error.code == 20_003
    end

    test "parses a 403 as authentication error" do
      error = Error.from_response(403, "{}", [])
      assert error.type == :authentication_error
    end

    test "parses a 404 as not found error" do
      error = Error.from_response(404, "{}", [])
      assert error.type == :not_found_error
    end

    test "parses a 429 as rate limit error" do
      error = Error.from_response(429, "{}", [{"retry-after", "30"}])

      assert error.type == :rate_limit_error
      assert error.retry_after == 30
    end

    test "parses a 500 as api error" do
      error = Error.from_response(500, "{}", [])
      assert error.type == :api_error
    end

    test "extracts request ID from headers" do
      error = Error.from_response(400, "{}", [{"X-Twilio-Request-Id", "RQ123"}])
      assert error.request_id == "RQ123"
    end

    test "handles non-JSON body gracefully" do
      error = Error.from_response(500, "Internal Server Error", [])

      assert error.type == :api_error
      assert error.http_body == "Internal Server Error"
      assert error.message == nil
    end

    test "parses details field" do
      body = JSON.encode!(%{"code" => 123, "details" => %{"field" => "To"}})
      error = Error.from_response(400, body, [])
      assert error.details == %{"field" => "To"}
    end
  end

  describe "connection_error/1" do
    test "creates a connection error" do
      error = Error.connection_error("timeout")

      assert error.type == :connection_error
      assert error.message == "timeout"
    end
  end

  describe "retryable?/1" do
    test "rate limit errors are retryable" do
      assert Error.retryable?(%Error{type: :rate_limit_error})
    end

    test "5xx errors are retryable" do
      assert Error.retryable?(%Error{type: :api_error, http_status: 500})
      assert Error.retryable?(%Error{type: :api_error, http_status: 503})
    end

    test "connection errors are retryable" do
      assert Error.retryable?(%Error{type: :connection_error})
    end

    test "4xx errors are not retryable" do
      refute Error.retryable?(%Error{type: :invalid_request_error, http_status: 400})
      refute Error.retryable?(%Error{type: :authentication_error, http_status: 401})
      refute Error.retryable?(%Error{type: :not_found_error, http_status: 404})
    end
  end
end
