# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Events.V1.Sink.TestService do
  @moduledoc """
  Test sink

  Operations: `create`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Create a new Sink Test Event for the given Sink.

  Operation: `CreateSinkTest` | Tags: EventsV1SinkTest
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Events.V1.Sink.Test.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Sinks/#{sid}/Test",
             params: params,
             opts: opts,
             base_url: "https://events.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Events.V1.Sink.Test)}
    end
  end
end
