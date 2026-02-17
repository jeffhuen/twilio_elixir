# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Api.V2010.AddressService do
  @moduledoc """
  An Address instance resource represents your or your customer's physical location within a country. Around the world, some local authorities require the name and address of the user to be on file with Twilio to purchase and own a phone number.

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListAddress` | Tags: Api20100401Address

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `CustomerName` | string | The `customer_name` of the Address resources to read. |
  | `FriendlyName` | string | The string that identifies the Address resources to read. |
  | `EmergencyEnabled` | boolean | Whether the address can be associated to a number for emergency calling. |
  | `IsoCountry` | string (iso-country-code) | The ISO country code of the Address resources to read. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/2010-04-01/Accounts/#{client.account_sid}/Addresses.json",
           params: params,
           opts: opts,
           base_url: "https://api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "addresses")

        {:ok,
         %{
           page
           | items: Deserializer.deserialize_list(page.items, Twilio.Resources.Api.V2010.Address)
         }}

      error ->
        error
    end
  end

  @doc "Stream:  (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "addresses"
    )
  end

  @doc """


  Operation: `CreateAddress` | Tags: Api20100401Address

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `City` | string | The city of the new address. |
  | `CustomerName` | string | The name to associate with the new address. |
  | `IsoCountry` | string (iso-country-code) | The ISO country code of the new address. |
  | `PostalCode` | string | The postal code of the new address. |
  | `Region` | string | The state or region of the new address. |
  | `Street` | string | The number and street address of the new address. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `AutoCorrectAddress` | boolean | Whether we should automatically correct the address. Can be: `true` or `false` and the default is `true`. If empty or `true`, we will correct the address you provide if necessary. If `false`, we won't alter the address you provide. |
  | `EmergencyEnabled` | boolean | Whether to enable emergency calling on the new address. Can be: `true` or `false`. |
  | `FriendlyName` | string | A descriptive string that you create to describe the new address. It can be up to 64 characters long for Regulatory Compliance addresses and 32 characters long for Emergency addresses. |
  | `StreetSecondary` | string | The additional number and street address of the address. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Address.t()} | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/2010-04-01/Accounts/#{client.account_sid}/Addresses.json",
             params: params,
             opts: opts,
             base_url: "https://api.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Address)}
    end
  end

  @doc """


  Operation: `FetchAddress` | Tags: Api20100401Address
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Address.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/2010-04-01/Accounts/#{client.account_sid}/Addresses/#{sid}.json",
             opts: opts,
             base_url: "https://api.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Address)}
    end
  end

  @doc """


  Operation: `UpdateAddress` | Tags: Api20100401Address

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `AutoCorrectAddress` | boolean | Whether we should automatically correct the address. Can be: `true` or `false` and the default is `true`. If empty or `true`, we will correct the address you provide if necessary. If `false`, we won't alter the address you provide. |
  | `City` | string | The city of the address. |
  | `CustomerName` | string | The name to associate with the address. |
  | `EmergencyEnabled` | boolean | Whether to enable emergency calling on the address. Can be: `true` or `false`. |
  | `FriendlyName` | string | A descriptive string that you create to describe the new address. It can be up to 64 characters long for Regulatory Compliance addresses and 32 characters long for Emergency addresses. |
  | `PostalCode` | string | The postal code of the address. |
  | `Region` | string | The state or region of the address. |
  | `Street` | string | The number and street address of the address. |
  | `StreetSecondary` | string | The additional number and street address of the address. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Address.t()} | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/2010-04-01/Accounts/#{client.account_sid}/Addresses/#{sid}.json",
             params: params,
             opts: opts,
             base_url: "https://api.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Address)}
    end
  end

  @doc """


  Operation: `DeleteAddress` | Tags: Api20100401Address
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/2010-04-01/Accounts/#{client.account_sid}/Addresses/#{sid}.json",
      opts: opts,
      base_url: "https://api.twilio.com"
    )
  end
end
