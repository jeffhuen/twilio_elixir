# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Preview.Marketplace.AvailableAddOn.AvailableAddOnExtensionService do
  @moduledoc """
  Service for AvailableAddOnExtension API operations.

  Operations: `list`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of Extensions for the Available Add-on.

  Operation: `ListMarketplaceAvailableAddOnExtension` | Tags: PreviewMarketplaceAvailableAddOnExtension
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, available_add_on_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/marketplace/AvailableAddOns/#{available_add_on_sid}/Extensions",
           params: params,
           opts: opts,
           base_url: "https://preview.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "extensions")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Preview.Marketplace.AvailableAddOn.AvailableAddOnExtension
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of Extensions for the Available Add-on. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, available_add_on_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, available_add_on_sid, Map.merge(params, page_opts), opts)
      end,
      "extensions"
    )
  end

  @doc """
  Fetch an instance of an Extension for the Available Add-on.

  Operation: `FetchMarketplaceAvailableAddOnExtension` | Tags: PreviewMarketplaceAvailableAddOnExtension
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Preview.Marketplace.AvailableAddOn.AvailableAddOnExtension.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, available_add_on_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/marketplace/AvailableAddOns/#{available_add_on_sid}/Extensions/#{sid}",
             opts: opts,
             base_url: "https://preview.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Preview.Marketplace.AvailableAddOn.AvailableAddOnExtension
       )}
    end
  end
end
