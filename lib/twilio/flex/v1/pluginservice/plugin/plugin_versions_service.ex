# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Flex.V1.Pluginservice.Plugin.PluginVersionsService do
  @moduledoc """
  Service for PluginVersions API operations.

  Operations: `list`, `create`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListPluginVersion` | Tags: FlexV1PluginVersions
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, plugin_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/PluginService/Plugins/#{plugin_sid}/Versions",
           params: params,
           opts: opts,
           base_url: "https://flex-api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "plugin_versions")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Flex.V1.Pluginservice.Plugin.PluginVersions
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream:  (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, plugin_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, plugin_sid, Map.merge(params, page_opts), opts)
      end,
      "plugin_versions"
    )
  end

  @doc """


  Operation: `CreatePluginVersion` | Tags: FlexV1PluginVersions

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `PluginUrl` | string (uri) | The URL of the Flex Plugin Version bundle |
  | `Version` | string | The Flex Plugin Version's version. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Changelog` | string | The changelog of the Flex Plugin Version. |
  | `CliVersion` | string | The version of Flex Plugins CLI used to create this plugin |
  | `Private` | boolean | Whether this Flex Plugin Version requires authorization. |
  | `ValidateStatus` | string | The validation status of the plugin, indicating whether it has been validated |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.Pluginservice.Plugin.PluginVersions.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, plugin_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/PluginService/Plugins/#{plugin_sid}/Versions",
             params: params,
             opts: opts,
             base_url: "https://flex-api.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Flex.V1.Pluginservice.Plugin.PluginVersions
       )}
    end
  end

  @doc """


  Operation: `FetchPluginVersion` | Tags: FlexV1PluginVersions
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.Pluginservice.Plugin.PluginVersions.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, plugin_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/PluginService/Plugins/#{plugin_sid}/Versions/#{sid}",
             opts: opts,
             base_url: "https://flex-api.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Flex.V1.Pluginservice.Plugin.PluginVersions
       )}
    end
  end
end
