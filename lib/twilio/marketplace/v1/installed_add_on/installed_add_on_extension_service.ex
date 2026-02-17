# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Marketplace.V1.InstalledAddOn.InstalledAddOnExtensionService do
  @moduledoc """
  Service for InstalledAddOnExtension API operations.

  Operations: `list`, `fetch`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of Extensions for the Installed Add-on.

  Operation: `ListInstalledAddOnExtension` | Tags: MarketplaceInstalledAddOnExtension
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, installed_add_on_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/InstalledAddOns/#{installed_add_on_sid}/Extensions",
           params: params,
           opts: opts,
           base_url: "https://marketplace.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "extensions")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Marketplace.V1.InstalledAddOn.InstalledAddOnExtension
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of Extensions for the Installed Add-on. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, installed_add_on_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, installed_add_on_sid, Map.merge(params, page_opts), opts)
      end,
      "extensions"
    )
  end

  @doc """
  Fetch an instance of an Extension for the Installed Add-on.

  Operation: `FetchInstalledAddOnExtension` | Tags: MarketplaceInstalledAddOnExtension
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Marketplace.V1.InstalledAddOn.InstalledAddOnExtension.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, installed_add_on_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/InstalledAddOns/#{installed_add_on_sid}/Extensions/#{sid}",
             opts: opts,
             base_url: "https://marketplace.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Marketplace.V1.InstalledAddOn.InstalledAddOnExtension
       )}
    end
  end

  @doc """
  Update an Extension for an Add-on installation.

  Operation: `UpdateInstalledAddOnExtension` | Tags: MarketplaceInstalledAddOnExtension

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Enabled` | boolean | Whether the Extension should be invoked. |
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Marketplace.V1.InstalledAddOn.InstalledAddOnExtension.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, installed_add_on_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/InstalledAddOns/#{installed_add_on_sid}/Extensions/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://marketplace.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Marketplace.V1.InstalledAddOn.InstalledAddOnExtension
       )}
    end
  end
end
