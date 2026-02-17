# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Insights.V1.VoiceService do
  @moduledoc """


  Operations: `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `FetchCall` | Tags: InsightsV1Call
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Insights.V1.Voice.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Voice/#{sid}",
             opts: opts,
             base_url: "https://insights.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Insights.V1.Voice)}
    end
  end
end
