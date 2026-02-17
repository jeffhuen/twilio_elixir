# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Marketplace.V1.ReferralconversionService do
  @moduledoc """


  Operations: `create`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `CreateReferralConversion` | Tags: MarketplaceReferralConversion

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `referral_account_sid` | string |  |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Marketplace.V1.Referralconversion.t()}
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/ReferralConversion",
             params: params,
             opts: opts,
             base_url: "https://marketplace.twilio.com",
             content_type: :json
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Marketplace.V1.Referralconversion)}
    end
  end
end
