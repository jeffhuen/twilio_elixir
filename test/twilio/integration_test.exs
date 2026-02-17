defmodule Twilio.IntegrationTest do
  @moduledoc """
  Integration tests against the live Twilio test account API.

  Excluded by default. Run with:

      mix test --include integration

  Requires `dev/secrets.exs` with valid Twilio test credentials.
  """
  use ExUnit.Case, async: false

  @moduletag :integration

  @magic_from "+15005550006"
  @invalid_from "+15005550001"

  setup_all do
    client = Twilio.client()
    {:ok, client: client}
  end

  describe "SMS — send via magic number" do
    test "creates a message and returns a deserialized struct", %{client: client} do
      assert {:ok, message} =
               Twilio.Api.V2010.MessageService.create(client, %{
                 "From" => @magic_from,
                 "To" => @magic_from,
                 "Body" => "Integration test"
               })

      assert %Twilio.Resources.Api.V2010.Message{} = message
      assert message.sid =~ ~r/^SM/
      assert message.from == @magic_from
      assert message.body == "Integration test"
      assert message.status in ["queued", "sent"]
      assert message.direction == "outbound-api"
    end

    test "returns typed error for invalid From number", %{client: client} do
      assert {:error, error} =
               Twilio.Api.V2010.MessageService.create(client, %{
                 "From" => @invalid_from,
                 "To" => @magic_from,
                 "Body" => "Should fail"
               })

      assert %Twilio.Error{} = error
      assert error.type == :invalid_request_error
      assert error.http_status == 400
      assert is_integer(error.code)
    end
  end

  # NOTE: Twilio test credentials cannot fetch or list messages (403).
  # Only create (with magic numbers) and calls are supported.

  describe "telemetry — live request events" do
    setup do
      test_pid = self()
      handler_id = "integration-telemetry-#{inspect(self())}"

      :telemetry.attach_many(
        handler_id,
        [
          [:twilio, :request, :start],
          [:twilio, :request, :stop]
        ],
        fn event, measurements, metadata, _ ->
          send(test_pid, {:telemetry, event, measurements, metadata})
        end,
        nil
      )

      on_exit(fn -> :telemetry.detach(handler_id) end)
    end

    test "emits start and stop events on successful request", %{client: client} do
      Twilio.Api.V2010.MessageService.create(client, %{
        "From" => @magic_from,
        "To" => @magic_from,
        "Body" => "Telemetry test"
      })

      assert_receive {:telemetry, [:twilio, :request, :start], %{system_time: _}, start_meta}
      assert start_meta.method == :post
      assert start_meta.path =~ "/Messages.json"
      assert start_meta.product == "api"

      assert_receive {:telemetry, [:twilio, :request, :stop], %{duration: duration}, stop_meta}
      assert duration > 0
      assert stop_meta.status in [200, 201]
      assert stop_meta.retries == 0
      assert stop_meta.error == nil
      assert stop_meta.product == "api"
    end

    test "emits stop event with error on API failure", %{client: client} do
      Twilio.Api.V2010.MessageService.create(client, %{
        "From" => @invalid_from,
        "To" => @magic_from,
        "Body" => "Should fail"
      })

      assert_receive {:telemetry, [:twilio, :request, :start], _, _}

      assert_receive {:telemetry, [:twilio, :request, :stop], _, stop_meta}
      assert stop_meta.status == 400
      assert %Twilio.Error{type: :invalid_request_error} = stop_meta.error
    end
  end
end
