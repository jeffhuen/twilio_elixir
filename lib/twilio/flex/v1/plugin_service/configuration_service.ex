# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Flex.V1.PluginService.ConfigurationService do
  @moduledoc """
  Service for Configuration API operations.

  Operations: `list`, `create`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListPluginConfiguration` | Tags: FlexV1PluginConfiguration
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/PluginService/Configurations",
           params: params,
           opts: opts,
           base_url: "https://flex-api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "configurations")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Flex.V1.PluginService.Configuration
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
      "configurations"
    )
  end

  @doc """


  Operation: `CreatePluginConfiguration` | Tags: FlexV1PluginConfiguration

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Name` | string | The Flex Plugin Configuration's name. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Description` | string | The Flex Plugin Configuration's description. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Plugins` | array | A list of objects that describe the plugin versions included in the configuration. Each object contains the sid of the plugin version. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.PluginService.Configuration.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/PluginService/Configurations",
             params: params,
             opts: opts,
             base_url: "https://flex-api.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Flex.V1.PluginService.Configuration)}
    end
  end

  @doc """


  Operation: `FetchPluginConfiguration` | Tags: FlexV1PluginConfiguration
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.PluginService.Configuration.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/PluginService/Configurations/#{sid}",
             opts: opts,
             base_url: "https://flex-api.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Flex.V1.PluginService.Configuration)}
    end
  end
end
