# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Events.V1.Sink.ValidateService do
  @moduledoc """
  Validate sink

  Operations: `create`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Validate that a test event for a Sink was received.

  Operation: `CreateSinkValidate` | Tags: EventsV1SinkValidate

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `TestId` | string | A 34 character string that uniquely identifies the test event for a Sink being validated. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Events.V1.Sink.Validate.t()} | {:error, Twilio.Error.t()}
  def create(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Sinks/#{sid}/Validate",
             params: params,
             opts: opts,
             base_url: "https://events.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Events.V1.Sink.Validate)}
    end
  end
end
