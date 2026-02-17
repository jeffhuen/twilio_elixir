# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Flex.V1.Pluginservice.PluginService do
  @moduledoc """


  Operations: `list`, `create`, `fetch`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListPlugin` | Tags: FlexV1Plugin
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/PluginService/Plugins",
           params: params,
           opts: opts,
           base_url: "https://flex-api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "plugins")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Flex.V1.Pluginservice.Plugin
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
      "plugins"
    )
  end

  @doc """


  Operation: `CreatePlugin` | Tags: FlexV1Plugin

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `UniqueName` | string | The Flex Plugin's unique name. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Description` | string | A descriptive string that you create to describe the plugin resource. It can be up to 500 characters long |
  | `FriendlyName` | string | The Flex Plugin's friendly name. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.Pluginservice.Plugin.t()} | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/PluginService/Plugins",
             params: params,
             opts: opts,
             base_url: "https://flex-api.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Flex.V1.Pluginservice.Plugin)}
    end
  end

  @doc """


  Operation: `FetchPlugin` | Tags: FlexV1Plugin
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.Pluginservice.Plugin.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/PluginService/Plugins/#{sid}",
             opts: opts,
             base_url: "https://flex-api.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Flex.V1.Pluginservice.Plugin)}
    end
  end

  @doc """


  Operation: `UpdatePlugin` | Tags: FlexV1Plugin

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Description` | string | A descriptive string that you update to describe the plugin resource. It can be up to 500 characters long |
  | `FriendlyName` | string | The Flex Plugin's friendly name. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.Pluginservice.Plugin.t()} | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/PluginService/Plugins/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://flex-api.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Flex.V1.Pluginservice.Plugin)}
    end
  end
end
