# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Insights.V1.Voice.CallSummaryService do
  @moduledoc """
  Service for CallSummary API operations.

  Operations: `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Get a specific Call Summary.

  Operation: `FetchSummary` | Tags: InsightsV1CallSummary

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `ProcessingState` | string | The Processing State of this Call Summary. One of `complete`, `partial` or `all`. |
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Insights.V1.Voice.CallSummary.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, call_sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Voice/#{call_sid}/Summary",
             opts: opts,
             base_url: "https://insights.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Insights.V1.Voice.CallSummary)}
    end
  end
end
