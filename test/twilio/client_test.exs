defmodule Twilio.ClientTest do
  use ExUnit.Case, async: true

  alias Twilio.Client

  setup do
    Twilio.Test.stub(fn _method, _url, _headers, _body ->
      {200, [], ~s({"sid": "SM123", "status": "sent"})}
    end)

    client = Client.new("ACtest123", "test_token")
    {:ok, client: client}
  end

  describe "new/0" do
    test "creates client from application config" do
      client = Client.new()
      assert String.starts_with?(client.account_sid, "AC")
      assert is_binary(client.auth_token)
    end
  end

  describe "new/2" do
    test "creates client with explicit credentials" do
      client = Client.new("ACxxx", "token123")
      assert client.account_sid == "ACxxx"
      assert client.auth_token == "token123"
      assert client.username == "ACxxx"
      assert client.password == "token123"
    end
  end

  describe "new/3" do
    test "accepts option overrides" do
      client = Client.new("ACxxx", "token", region: "ie1", edge: "dublin", max_retries: 3)

      assert client.region == "ie1"
      assert client.edge == "dublin"
      assert client.max_retries == 3
    end

    test "supports subaccount override" do
      client = Client.new("ACmain", "token", account_sid: "ACsub")

      assert client.account_sid == "ACsub"
      assert client.username == "ACmain"
      assert client.password == "token"
    end
  end

  describe "request/4 — basic" do
    test "makes a GET request and parses JSON", %{client: client} do
      assert {:ok, data} =
               Client.request(client, :get, "/test.json", base_url: "https://api.twilio.com")

      assert data["sid"] == "SM123"
    end

    test "returns :ok for 204 responses", %{client: client} do
      Twilio.Test.stub(fn _method, _url, _headers, _body ->
        {204, [], ""}
      end)

      assert :ok =
               Client.request(client, :delete, "/test.json", base_url: "https://api.twilio.com")
    end

    test "returns error for 4xx responses", %{client: client} do
      Twilio.Test.stub(fn _method, _url, _headers, _body ->
        body = JSON.encode!(%{"code" => 21_211, "message" => "Invalid phone number"})
        {400, [], body}
      end)

      assert {:error, %Twilio.Error{code: 21_211}} =
               Client.request(client, :post, "/test.json", base_url: "https://api.twilio.com")
    end
  end

  describe "request/4 — auth" do
    test "sends Basic auth header", %{client: client} do
      Twilio.Test.stub(fn _method, _url, headers, _body ->
        {_, auth} = List.keyfind(headers, "authorization", 0)
        assert String.starts_with?(auth, "Basic ")
        decoded = auth |> String.replace("Basic ", "") |> Base.decode64!()
        assert decoded == "ACtest123:test_token"
        {200, [], ~s({"ok": true})}
      end)

      assert {:ok, _} =
               Client.request(client, :get, "/test.json", base_url: "https://api.twilio.com")
    end
  end

  describe "request/4 — encoding" do
    test "form-encodes POST parameters", %{client: client} do
      Twilio.Test.stub(fn _method, _url, _headers, body ->
        assert body =~ "To=%2B15551234567"
        assert body =~ "Body=Hello"
        {201, [], ~s({"sid": "SM123"})}
      end)

      assert {:ok, _} =
               Client.request(client, :post, "/test.json",
                 params: %{"To" => "+15551234567", "Body" => "Hello"},
                 base_url: "https://api.twilio.com"
               )
    end

    test "sends query params for GET requests", %{client: client} do
      Twilio.Test.stub(fn _method, url, _headers, _body ->
        assert url =~ "PageSize=10"
        {200, [], ~s({"messages": []})}
      end)

      assert {:ok, _} =
               Client.request(client, :get, "/test.json",
                 params: %{"PageSize" => "10"},
                 base_url: "https://api.twilio.com"
               )
    end

    test "encodes JSON when content_type is :json", %{client: client} do
      Twilio.Test.stub(fn _method, _url, headers, body ->
        {_, ct} = List.keyfind(headers, "content-type", 0)
        assert ct == "application/json"
        decoded = JSON.decode!(body)
        assert decoded["To"] == "+15551234567"
        {201, [], ~s({"sid": "SM123"})}
      end)

      assert {:ok, _} =
               Client.request(client, :post, "/test.json",
                 params: %{"To" => "+15551234567"},
                 base_url: "https://api.twilio.com",
                 content_type: :json
               )
    end
  end

  describe "request/4 — region/edge" do
    test "applies region to base URL" do
      Twilio.Test.stub(fn _method, url, _headers, _body ->
        assert url =~ "api.ie1.twilio.com"
        {200, [], ~s({"ok": true})}
      end)

      client = Client.new("ACtest", "token", region: "ie1")

      assert {:ok, _} =
               Client.request(client, :get, "/test.json", base_url: "https://api.twilio.com")
    end

    test "applies edge and region to base URL" do
      Twilio.Test.stub(fn _method, url, _headers, _body ->
        assert url =~ "api.dublin.ie1.twilio.com"
        {200, [], ~s({"ok": true})}
      end)

      client = Client.new("ACtest", "token", region: "ie1", edge: "dublin")

      assert {:ok, _} =
               Client.request(client, :get, "/test.json", base_url: "https://api.twilio.com")
    end

    test "applies edge with default us1 region" do
      Twilio.Test.stub(fn _method, url, _headers, _body ->
        assert url =~ "api.ashburn.us1.twilio.com"
        {200, [], ~s({"ok": true})}
      end)

      client = Client.new("ACtest", "token", edge: "ashburn")

      assert {:ok, _} =
               Client.request(client, :get, "/test.json", base_url: "https://api.twilio.com")
    end
  end

  describe "request/4 — return_response" do
    test "returns response metadata when opt-in", %{client: client} do
      Twilio.Test.stub(fn _method, _url, _headers, _body ->
        {200, [{"x-twilio-request-id", "RQ456"}], ~s({"sid": "SM123"})}
      end)

      assert {:ok, data, response} =
               Client.request(client, :get, "/test.json",
                 base_url: "https://api.twilio.com",
                 return_response: true
               )

      assert data["sid"] == "SM123"
      assert response.status == 200
      assert response.request_id == "RQ456"
    end
  end

  describe "request/4 — retry" do
    test "retries on 429 and succeeds", %{client: client} do
      call_count = :counters.new(1, [:atomics])

      Twilio.Test.stub(fn _method, _url, _headers, _body ->
        count = :counters.get(call_count, 1)
        :counters.add(call_count, 1, 1)

        if count == 0 do
          {429, [{"retry-after", "0"}], ~s({"code": 20429, "message": "Too many requests"})}
        else
          {200, [], ~s({"sid": "SM123"})}
        end
      end)

      client = %{client | max_retries: 1}

      assert {:ok, data} =
               Client.request(client, :get, "/test.json", base_url: "https://api.twilio.com")

      assert data["sid"] == "SM123"
      assert :counters.get(call_count, 1) == 2
    end

    test "retries on 500 and succeeds", %{client: client} do
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

      assert {:ok, data} =
               Client.request(client, :get, "/test.json", base_url: "https://api.twilio.com")

      assert data["sid"] == "SM123"
      assert :counters.get(call_count, 1) == 2
    end

    test "returns error after exhausting retries", %{client: client} do
      Twilio.Test.stub(fn _method, _url, _headers, _body ->
        {500, [], ~s({"code": 500, "message": "Internal error"})}
      end)

      client = %{client | max_retries: 1}

      assert {:error, %Twilio.Error{http_status: 500}} =
               Client.request(client, :get, "/test.json", base_url: "https://api.twilio.com")
    end

    test "does not retry 4xx errors", %{client: client} do
      call_count = :counters.new(1, [:atomics])

      Twilio.Test.stub(fn _method, _url, _headers, _body ->
        :counters.add(call_count, 1, 1)
        {400, [], ~s({"code": 21211, "message": "Invalid"})}
      end)

      client = %{client | max_retries: 3}

      assert {:error, _} =
               Client.request(client, :get, "/test.json", base_url: "https://api.twilio.com")

      assert :counters.get(call_count, 1) == 1
    end
  end

  describe "request/4 — idempotency" do
    test "adds idempotency token for POST when retries enabled", %{client: client} do
      Twilio.Test.stub(fn _method, _url, headers, _body ->
        assert List.keyfind(headers, "i-twilio-idempotency-token", 0) != nil
        {201, [], ~s({"sid": "SM123"})}
      end)

      client = %{client | max_retries: 1}

      assert {:ok, _} =
               Client.request(client, :post, "/test.json",
                 params: %{"Body" => "test"},
                 base_url: "https://api.twilio.com"
               )
    end

    test "does not add idempotency token for GET", %{client: client} do
      Twilio.Test.stub(fn _method, _url, headers, _body ->
        assert List.keyfind(headers, "i-twilio-idempotency-token", 0) == nil
        {200, [], ~s({"sid": "SM123"})}
      end)

      client = %{client | max_retries: 1}

      assert {:ok, _} =
               Client.request(client, :get, "/test.json", base_url: "https://api.twilio.com")
    end

    test "uses custom idempotency token when provided", %{client: client} do
      Twilio.Test.stub(fn _method, _url, headers, _body ->
        {_, token} = List.keyfind(headers, "i-twilio-idempotency-token", 0)
        assert token == "my-custom-token"
        {201, [], ~s({"sid": "SM123"})}
      end)

      assert {:ok, _} =
               Client.request(client, :post, "/test.json",
                 params: %{"Body" => "test"},
                 base_url: "https://api.twilio.com",
                 idempotency_token: "my-custom-token"
               )
    end
  end

  describe "request/4 — user agent" do
    test "sends user-agent header", %{client: client} do
      Twilio.Test.stub(fn _method, _url, headers, _body ->
        {_, ua} = List.keyfind(headers, "user-agent", 0)
        assert ua =~ "twilio-elixir/"
        assert ua =~ "elixir/"
        {200, [], ~s({"ok": true})}
      end)

      assert {:ok, _} =
               Client.request(client, :get, "/test.json", base_url: "https://api.twilio.com")
    end

    test "includes user-agent extensions", %{client: client} do
      client = %{client | user_agent_extensions: ["my-app/1.0"]}

      Twilio.Test.stub(fn _method, _url, headers, _body ->
        {_, ua} = List.keyfind(headers, "user-agent", 0)
        assert ua =~ "my-app/1.0"
        {200, [], ~s({"ok": true})}
      end)

      assert {:ok, _} =
               Client.request(client, :get, "/test.json", base_url: "https://api.twilio.com")
    end
  end
end
