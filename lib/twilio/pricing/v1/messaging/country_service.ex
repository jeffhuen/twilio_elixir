# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Pricing.V1.Messaging.CountryService do
  @moduledoc """
  Messaging pricing by country

  Operations: `list`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListMessagingCountry` | Tags: PricingV1Country
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Messaging/Countries",
           params: params,
           opts: opts,
           base_url: "https://pricing.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "countries")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Pricing.V1.Messaging.Country
               )
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
      "countries"
    )
  end

  @doc """


  Operation: `FetchMessagingCountry` | Tags: PricingV1Country
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Pricing.V1.Messaging.Country.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Messaging/Countries/#{sid}",
             opts: opts,
             base_url: "https://pricing.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Pricing.V1.Messaging.Country)}
    end
  end
end
