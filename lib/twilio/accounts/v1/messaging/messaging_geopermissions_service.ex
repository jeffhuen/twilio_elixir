# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Accounts.V1.Messaging.MessagingGeopermissionsService do
  @moduledoc """
  Manage Geo Permissions for each country.

  Operations: `list`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `FetchMessagingGeopermissions` | Tags: AccountsV1MessagingGeopermissions

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `CountryCode` | string | The country code to filter the geo permissions. If provided, only the geo permission for the specified country will be returned. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Messaging/GeoPermissions",
           params: params,
           opts: opts,
           base_url: "https://accounts.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "geopermissions")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Accounts.V1.Messaging.MessagingGeopermissions
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
      "geopermissions"
    )
  end
end
