defmodule Twilio.TelemetryTest do
  use ExUnit.Case, async: false

  alias Twilio.Client

  setup do
    Twilio.Test.stub(fn _method, _url, _headers, _body ->
      {200, [{"x-twilio-request-id", "RQ123"}], ~s({"sid": "SM123"})}
    end)

    test_pid = self()
    handler_id = "telemetry-test-#{inspect(self())}"

    :telemetry.attach_many(
      handler_id,
      [
        [:twilio, :request, :start],
        [:twilio, :request, :stop],
        [:twilio, :request, :exception],
        [:twilio, :request, :retry]
      ],
      fn event, measurements, metadata, _ ->
        send(test_pid, {:telemetry, event, measurements, metadata})
      end,
      nil
    )

    client = Client.new("ACtest123", "test_token")

    on_exit(fn -> :telemetry.detach(handler_id) end)

    {:ok, client: client}
  end

  describe "product_from_base_url/1" do
    test "returns \"api\" for api.twilio.com" do
      assert Twilio.Telemetry.product_from_base_url("https://api.twilio.com") == "api"
    end

    test "extracts product from subdomain" do
      assert Twilio.Telemetry.product_from_base_url("https://messaging.twilio.com") == "messaging"
      assert Twilio.Telemetry.product_from_base_url("https://verify.twilio.com") == "verify"

      assert Twilio.Telemetry.product_from_base_url("https://conversations.twilio.com") ==
               "conversations"
    end

    test "falls back to \"api\" for unexpected input" do
      assert Twilio.Telemetry.product_from_base_url("http://localhost:4000") == "api"
      assert Twilio.Telemetry.product_from_base_url("not-a-url") == "api"
    end
  end

  describe "start event" do
    test "fires with method, path, and product", %{client: client} do
      Client.request(client, :get, "/2010-04-01/test.json", base_url: "https://api.twilio.com")

      assert_receive {:telemetry, [:twilio, :request, :start], measurements, metadata}
      assert is_integer(measurements.system_time)
      assert metadata.method == :get
      assert metadata.path == "/2010-04-01/test.json"
      assert metadata.product == "api"
    end

    test "detects product from base_url", %{client: client} do
      Client.request(client, :post, "/v1/Services", base_url: "https://messaging.twilio.com")

      assert_receive {:telemetry, [:twilio, :request, :start], _, metadata}
      assert metadata.product == "messaging"
    end
  end

  describe "stop event — success" do
    test "fires with status, retries, request_id, and nil error", %{client: client} do
      Client.request(client, :get, "/test.json", base_url: "https://api.twilio.com")

      assert_receive {:telemetry, [:twilio, :request, :stop], measurements, metadata}
      assert is_integer(measurements.duration)
      assert measurements.duration > 0
      assert metadata.method == :get
      assert metadata.path == "/test.json"
      assert metadata.product == "api"
      assert metadata.status == 200
      assert metadata.retries == 0
      assert metadata.request_id == "RQ123"
      assert metadata.error == nil
    end
  end

  describe "stop event — API error" do
    test "fires with error struct on 4xx", %{client: client} do
      Twilio.Test.stub(fn _method, _url, _headers, _body ->
        {400, [], ~s({"code": 21211, "message": "Invalid phone number"})}
      end)

      Client.request(client, :post, "/test.json", base_url: "https://api.twilio.com")

      assert_receive {:telemetry, [:twilio, :request, :stop], _, metadata}
      assert metadata.status == 400
      assert metadata.retries == 0
      assert %Twilio.Error{type: :invalid_request_error, code: 21211} = metadata.error
    end

    test "fires with error struct on 401 authentication error", %{client: client} do
      Twilio.Test.stub(fn _method, _url, _headers, _body ->
        {401, [], ~s({"code": 20003, "message": "Authentication error"})}
      end)

      Client.request(client, :get, "/test.json", base_url: "https://api.twilio.com")

      assert_receive {:telemetry, [:twilio, :request, :stop], _, metadata}
      assert metadata.status == 401
      assert %Twilio.Error{type: :authentication_error, code: 20003} = metadata.error
    end
  end

  describe "retry event — 429 rate limit" do
    test "fires retry then stop with correct retries count", %{client: client} do
      call_count = :counters.new(1, [:atomics])

      Twilio.Test.stub(fn _method, _url, _headers, _body ->
        count = :counters.get(call_count, 1)
        :counters.add(call_count, 1, 1)

        if count == 0 do
          {429, [{"retry-after", "0"}], ~s({"code": 20429, "message": "Too many requests"})}
        else
          {200, [{"x-twilio-request-id", "RQ789"}], ~s({"sid": "SM123"})}
        end
      end)

      client = %{client | max_retries: 1}
      Client.request(client, :get, "/test.json", base_url: "https://api.twilio.com")

      assert_receive {:telemetry, [:twilio, :request, :retry], measurements, metadata}
      assert measurements.attempt == 1
      assert is_integer(measurements.wait_ms)
      assert metadata.status == 429
      assert metadata.reason == :rate_limited
      assert metadata.product == "api"

      assert_receive {:telemetry, [:twilio, :request, :stop], _, stop_meta}
      assert stop_meta.retries == 1
      assert stop_meta.status == 200
      assert stop_meta.request_id == "RQ789"
    end
  end

  describe "retry event — 500 server error" do
    test "fires retry with server_error reason", %{client: client} do
      call_count = :counters.new(1, [:atomics])

      Twilio.Test.stub(fn _method, _url, _headers, _body ->
        count = :counters.get(call_count, 1)
        :counters.add(call_count, 1, 1)

        if count == 0 do
          {500, [], ~s({"message": "Internal error"})}
        else
          {200, [], ~s({"sid": "SM123"})}
        end
      end)

      client = %{client | max_retries: 1}
      Client.request(client, :get, "/test.json", base_url: "https://api.twilio.com")

      assert_receive {:telemetry, [:twilio, :request, :retry], measurements, metadata}
      assert measurements.attempt == 1
      assert metadata.status == 500
      assert metadata.reason == :server_error
    end
  end

  describe "retry event — multiple retries" do
    test "fires retry for each attempt with incrementing attempt number", %{client: client} do
      call_count = :counters.new(1, [:atomics])

      Twilio.Test.stub(fn _method, _url, _headers, _body ->
        count = :counters.get(call_count, 1)
        :counters.add(call_count, 1, 1)

        if count < 2 do
          {500, [], ~s({"message": "Internal error"})}
        else
          {200, [], ~s({"sid": "SM123"})}
        end
      end)

      client = %{client | max_retries: 3}
      Client.request(client, :get, "/test.json", base_url: "https://api.twilio.com")

      assert_receive {:telemetry, [:twilio, :request, :retry], %{attempt: 1}, _}
      assert_receive {:telemetry, [:twilio, :request, :retry], %{attempt: 2}, _}

      assert_receive {:telemetry, [:twilio, :request, :stop], _, stop_meta}
      assert stop_meta.retries == 2
      assert stop_meta.status == 200
    end
  end

  describe "Retry-After header parsing" do
    test "uses Retry-After value from header on 429", %{client: client} do
      call_count = :counters.new(1, [:atomics])

      Twilio.Test.stub(fn _method, _url, _headers, _body ->
        count = :counters.get(call_count, 1)
        :counters.add(call_count, 1, 1)

        if count == 0 do
          {429, [{"retry-after", "1"}], ~s({"code": 20429, "message": "Too many requests"})}
        else
          {200, [], ~s({"sid": "SM123"})}
        end
      end)

      client = %{client | max_retries: 1}
      Client.request(client, :get, "/test.json", base_url: "https://api.twilio.com")

      assert_receive {:telemetry, [:twilio, :request, :retry], measurements, _}
      assert measurements.wait_ms == 1000
    end
  end

  describe "stop event — exhausted retries" do
    test "fires stop with error after max retries exhausted", %{client: client} do
      Twilio.Test.stub(fn _method, _url, _headers, _body ->
        {500, [], ~s({"code": 500, "message": "Internal error"})}
      end)

      client = %{client | max_retries: 2}
      Client.request(client, :get, "/test.json", base_url: "https://api.twilio.com")

      # Should get 2 retry events
      assert_receive {:telemetry, [:twilio, :request, :retry], %{attempt: 1}, _}
      assert_receive {:telemetry, [:twilio, :request, :retry], %{attempt: 2}, _}

      # Final stop should have error and correct retries count
      assert_receive {:telemetry, [:twilio, :request, :stop], _, stop_meta}
      assert stop_meta.retries == 2
      assert stop_meta.status == 500
      assert %Twilio.Error{} = stop_meta.error
    end
  end
end
