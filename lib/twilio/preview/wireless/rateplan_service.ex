# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Preview.Wireless.RateplanService do
  @moduledoc """
  Service for Rateplan API operations.

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListWirelessRatePlan` | Tags: PreviewWirelessRatePlan
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/wireless/RatePlans",
           params: params,
           opts: opts,
           base_url: "https://preview.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "rate_plans")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Preview.Wireless.Rateplan
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
      "rate_plans"
    )
  end

  @doc """


  Operation: `CreateWirelessRatePlan` | Tags: PreviewWirelessRatePlan

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `CommandsEnabled` | boolean |  |
  | `DataEnabled` | boolean |  |
  | `DataLimit` | integer |  |
  | `DataMetering` | string |  |
  | `FriendlyName` | string |  |
  | `InternationalRoaming` | array |  |
  | `MessagingEnabled` | boolean |  |
  | `NationalRoamingEnabled` | boolean |  |
  | `UniqueName` | string |  |
  | `VoiceEnabled` | boolean |  |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Preview.Wireless.Rateplan.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/wireless/RatePlans",
             params: params,
             opts: opts,
             base_url: "https://preview.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Preview.Wireless.Rateplan)}
    end
  end

  @doc """


  Operation: `FetchWirelessRatePlan` | Tags: PreviewWirelessRatePlan
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Preview.Wireless.Rateplan.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/wireless/RatePlans/#{sid}",
             opts: opts,
             base_url: "https://preview.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Preview.Wireless.Rateplan)}
    end
  end

  @doc """


  Operation: `UpdateWirelessRatePlan` | Tags: PreviewWirelessRatePlan

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `FriendlyName` | string |  |
  | `UniqueName` | string |  |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Preview.Wireless.Rateplan.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/wireless/RatePlans/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://preview.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Preview.Wireless.Rateplan)}
    end
  end

  @doc """


  Operation: `DeleteWirelessRatePlan` | Tags: PreviewWirelessRatePlan
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/wireless/RatePlans/#{sid}",
      opts: opts,
      base_url: "https://preview.twilio.com"
    )
  end
end
