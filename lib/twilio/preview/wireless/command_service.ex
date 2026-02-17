# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Preview.Wireless.CommandService do
  @moduledoc """
  Service for Command API operations.

  Operations: `list`, `create`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListWirelessCommand` | Tags: PreviewWirelessCommand

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Device` | string |  |
  | `Sim` | string |  |
  | `Status` | string |  |
  | `Direction` | string |  |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/wireless/Commands",
           params: params,
           opts: opts,
           base_url: "https://preview.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "commands")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Preview.Wireless.Command
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
      "commands"
    )
  end

  @doc """


  Operation: `CreateWirelessCommand` | Tags: PreviewWirelessCommand

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Command` | string |  |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `CallbackMethod` | string |  |
  | `CallbackUrl` | string (uri) |  |
  | `CommandMode` | string |  |
  | `Device` | string |  |
  | `IncludeSid` | string |  |
  | `Sim` | string |  |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Preview.Wireless.Command.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/wireless/Commands",
             params: params,
             opts: opts,
             base_url: "https://preview.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Preview.Wireless.Command)}
    end
  end

  @doc """


  Operation: `FetchWirelessCommand` | Tags: PreviewWirelessCommand
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Preview.Wireless.Command.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/wireless/Commands/#{sid}",
             opts: opts,
             base_url: "https://preview.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Preview.Wireless.Command)}
    end
  end
end
