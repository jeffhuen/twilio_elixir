# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Marketplace.V1.AvailableaddonService do
  @moduledoc """


  Operations: `list`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of Add-ons currently available to be installed.

  Operation: `ListAvailableAddOn` | Tags: MarketplaceAvailableAddOn
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/AvailableAddOns",
           params: params,
           opts: opts,
           base_url: "https://marketplace.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "available_add_ons")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Marketplace.V1.Availableaddon
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of Add-ons currently available to be installed. (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "available_add_ons"
    )
  end

  @doc """
  Fetch an instance of an Add-on currently available to be installed.

  Operation: `FetchAvailableAddOn` | Tags: MarketplaceAvailableAddOn
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Marketplace.V1.Availableaddon.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/AvailableAddOns/#{sid}",
             opts: opts,
             base_url: "https://marketplace.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Marketplace.V1.Availableaddon)}
    end
  end
end
