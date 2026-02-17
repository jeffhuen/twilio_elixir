# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Marketplace.V1.Installedaddon.InstalledAddOnUsageService do
  @moduledoc """


  Operations: `create`
  """

  alias Twilio.Client

  @doc """
  Allows Twilio Marketplace publishers to manually report customer usage on No-code Partner Listings that they own.

  Operation: `CreateBillingUsage` | Tags: MarketplaceBillingUsage
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, map()} | {:error, Twilio.Error.t()}
  def create(client, installed_add_on_sid, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/InstalledAddOns/#{installed_add_on_sid}/Usage",
      params: params,
      opts: opts,
      base_url: "https://marketplace.twilio.com",
      content_type: :json
    )
  end
end
