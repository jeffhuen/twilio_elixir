# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Pricing.V2.Voice.NumberService do
  @moduledoc """
  Voice pricing for a specific phone number

  Operations: `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Fetch pricing information for a specific destination and, optionally, origination phone number.

  Operation: `FetchVoiceNumber` | Tags: PricingV2Number

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `OriginationNumber` | string (phone-number) | The origination phone number, in [E.164](https://www.twilio.com/docs/glossary/what-e164) format, for which to fetch the origin-based voice pricing information. E.164 format consists of a + followed by the country code and subscriber number. |
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Pricing.V2.Voice.Number.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v2/Voice/Numbers/#{sid}",
             opts: opts,
             base_url: "https://pricing.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Pricing.V2.Voice.Number)}
    end
  end
end
