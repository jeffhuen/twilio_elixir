# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Preview.Wireless.SimService do
  @moduledoc """
  Service for Sim API operations.

  Operations: `list`, `fetch`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListWirelessSim` | Tags: PreviewWirelessSim

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Status` | string |  |
  | `Iccid` | string |  |
  | `RatePlan` | string |  |
  | `EId` | string |  |
  | `SimRegistrationCode` | string |  |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/wireless/Sims",
           params: params,
           opts: opts,
           base_url: "https://preview.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "sims")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(page.items, Twilio.Resources.Preview.Wireless.Sim)
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
      "sims"
    )
  end

  @doc """


  Operation: `FetchWirelessSim` | Tags: PreviewWirelessSim
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Preview.Wireless.Sim.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/wireless/Sims/#{sid}",
             opts: opts,
             base_url: "https://preview.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Preview.Wireless.Sim)}
    end
  end

  @doc """


  Operation: `UpdateWirelessSim` | Tags: PreviewWirelessSim

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `CallbackMethod` | string |  |
  | `CallbackUrl` | string (uri) |  |
  | `CommandsCallbackMethod` | string (http-method) |  Values: `GET`, `POST` |
  | `CommandsCallbackUrl` | string (uri) |  |
  | `FriendlyName` | string |  |
  | `RatePlan` | string |  |
  | `SmsFallbackMethod` | string (http-method) |  Values: `GET`, `POST` |
  | `SmsFallbackUrl` | string (uri) |  |
  | `SmsMethod` | string (http-method) |  Values: `GET`, `POST` |
  | `SmsUrl` | string (uri) |  |
  | `Status` | string |  |
  | `UniqueName` | string |  |
  | `VoiceFallbackMethod` | string (http-method) |  Values: `GET`, `POST` |
  | `VoiceFallbackUrl` | string (uri) |  |
  | `VoiceMethod` | string (http-method) |  Values: `GET`, `POST` |
  | `VoiceUrl` | string (uri) |  |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Preview.Wireless.Sim.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/wireless/Sims/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://preview.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Preview.Wireless.Sim)}
    end
  end
end
