# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Marketplace.V1.ListingService do
  @moduledoc """
  Service for Listing API operations.

  Operations: `fetch`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  This endpoint returns the data of a given Listing. To find a Listing's SID, use the [Available Add-ons resource](/docs/marketplace/api/available-add-ons) or view its Listing details page in the Console by visiting the [Catalog](https://console.twilio.com/us1/develop/add-ons/catalog) or the [My Listings tab](https://console.twilio.com/us1/develop/add-ons/publish/my-listings) and selecting the Listing.

  Operation: `FetchModuleDataManagement` | Tags: MarketplaceModuleDataManagement
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Marketplace.V1.Listing.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Listing/#{sid}",
             opts: opts,
             base_url: "https://marketplace.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Marketplace.V1.Listing)}
    end
  end

  @doc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  This endpoint updates the data of a given Listing. To find a Listing's SID, use the [Available Add-ons resource](https://www.twilio.com/docs/marketplace/api/available-add-ons) or view its Listing details page in the Console by visiting the [Catalog](https://console.twilio.com/us1/develop/add-ons/catalog) or the [My Listings tab](https://console.twilio.com/us1/develop/add-ons/publish/my-listings) and selecting the Listing. Only Listing owners are allowed to update the Listing.

  Operation: `UpdateModuleDataManagement` | Tags: MarketplaceModuleDataManagement

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Configuration` | string | A JSON object for providing Listing-specific configuration. Contains button setup, notification URL, and more. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Description` | string | A JSON object describing the Listing. You can define the main body of the description, highlight key features or aspects of the Listing, and provide code samples for developers if applicable. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Documentation` | string | A JSON object for providing comprehensive information, instructions, and resources related to the Listing. |
  | `ModuleInfo` | string | A JSON object containing essential attributes that define a Listing. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Policies` | string | A JSON object describing the Listing's privacy and legal policies. The maximum file size for Policies is 5MB. |
  | `Pricing` | string | A JSON object for providing Listing's purchase options. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Support` | string | A JSON object containing information on how Marketplace users can obtain support for the Listing. Use this parameter to provide details such as contact information and support description. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Marketplace.V1.Listing.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Listing/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://marketplace.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Marketplace.V1.Listing)}
    end
  end
end
