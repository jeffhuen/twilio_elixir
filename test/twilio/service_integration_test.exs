defmodule Twilio.ServiceIntegrationTest do
  use ExUnit.Case, async: true

  alias Twilio.Api.V2010.MessageService
  alias Twilio.Resources.Api.V2010.Message

  setup do
    Twilio.Test.stub(fn _method, _url, _headers, _body ->
      {200, [{"content-type", "application/json"}], "{}"}
    end)

    client = Twilio.client()
    {:ok, client: client}
  end

  describe "MessageService.fetch/3 deserialization" do
    test "returns a Message struct", %{client: client} do
      Twilio.Test.stub(fn _method, url, _headers, _body ->
        assert url =~ "/Messages/SM123.json"

        body =
          JSON.encode!(%{
            "sid" => "SM123",
            "body" => "Hello world",
            "status" => "delivered",
            "from" => "+15551234567",
            "to" => "+15559876543",
            "error_code" => nil,
            "date_created" => "Thu, 30 Jul 2015 20:00:00 +0000"
          })

        {200, [{"content-type", "application/json"}], body}
      end)

      assert {:ok, %Message{} = msg} =
               MessageService.fetch(client, "SM123")

      assert msg.sid == "SM123"
      assert msg.body == "Hello world"
      assert msg.status == "delivered"
      assert msg.from == "+15551234567"
    end
  end

  describe "MessageService.create/3 deserialization" do
    test "returns a Message struct", %{client: client} do
      Twilio.Test.stub(fn _method, url, _headers, _body ->
        assert url =~ "/Messages.json"

        body =
          JSON.encode!(%{
            "sid" => "SM456",
            "body" => "New message",
            "status" => "queued",
            "from" => "+15551234567",
            "to" => "+15559876543"
          })

        {201, [{"content-type", "application/json"}], body}
      end)

      assert {:ok, %Message{} = msg} =
               MessageService.create(client, %{
                 "To" => "+15559876543",
                 "From" => "+15551234567",
                 "Body" => "New message"
               })

      assert msg.sid == "SM456"
      assert msg.status == "queued"
    end
  end

  describe "MessageService.list/3 deserialization" do
    test "returns a Page with deserialized Message structs", %{client: client} do
      Twilio.Test.stub(fn _method, url, _headers, _body ->
        assert url =~ "/Messages.json"

        body =
          JSON.encode!(%{
            "messages" => [
              %{"sid" => "SM001", "body" => "First", "status" => "delivered"},
              %{"sid" => "SM002", "body" => "Second", "status" => "sent"}
            ],
            "page" => 0,
            "page_size" => 50,
            "first_page_uri" => "/2010-04-01/Accounts/AC123/Messages.json?Page=0",
            "next_page_uri" => nil,
            "previous_page_uri" => nil,
            "uri" => "/2010-04-01/Accounts/AC123/Messages.json?Page=0"
          })

        {200, [{"content-type", "application/json"}], body}
      end)

      assert {:ok, %Twilio.Page{} = page} = MessageService.list(client)

      assert length(page.items) == 2

      assert [
               %Message{} = m1,
               %Message{} = m2
             ] = page.items

      assert m1.sid == "SM001"
      assert m1.body == "First"
      assert m2.sid == "SM002"
      assert m2.status == "sent"
    end
  end

  describe "MessageService.delete/3" do
    test "returns :ok on success", %{client: client} do
      Twilio.Test.stub(fn _method, url, _headers, _body ->
        assert url =~ "/Messages/SM789.json"
        {204, [], ""}
      end)

      assert :ok = MessageService.delete(client, "SM789")
    end
  end
end
