# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Pricing.V1.Voice.NumberService do
  @moduledoc """
  Voice pricing for a specific phone number

  Operations: `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `FetchVoiceNumber` | Tags: PricingV1Number
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Pricing.V1.Voice.Number.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Voice/Numbers/#{sid}",
             opts: opts,
             base_url: "https://pricing.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Pricing.V1.Voice.Number)}
    end
  end
end
