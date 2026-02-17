# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Supersim.V1.SettingsUpdateService do
  @moduledoc """
  Service for SettingsUpdate API operations.

  Operations: `list`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of Settings Updates.

  Operation: `ListSettingsUpdate` | Tags: SupersimV1SettingsUpdate

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Sim` | string | Filter the Settings Updates by a Super SIM's SID or UniqueName. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Status` | string | Filter the Settings Updates by status. Can be `scheduled`, `in-progress`, `successful`, or `failed`. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/SettingsUpdates",
           params: params,
           opts: opts,
           base_url: "https://supersim.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "settings_updates")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Supersim.V1.SettingsUpdate
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of Settings Updates. (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "settings_updates"
    )
  end
end
