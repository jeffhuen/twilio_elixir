# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Flex.V1.PluginService.Configuration.ConfiguredPluginService do
  @moduledoc """
  Service for ConfiguredPlugin API operations.

  Operations: `list`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListConfiguredPlugin` | Tags: FlexV1ConfiguredPlugin
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, configuration_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/v1/PluginService/Configurations/#{configuration_sid}/Plugins",
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
                 Twilio.Resources.Flex.V1.PluginService.Configuration.ConfiguredPlugin
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream:  (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, configuration_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, configuration_sid, Map.merge(params, page_opts), opts)
      end,
      "plugins"
    )
  end

  @doc """


  Operation: `FetchConfiguredPlugin` | Tags: FlexV1ConfiguredPlugin
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.PluginService.Configuration.ConfiguredPlugin.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, configuration_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/PluginService/Configurations/#{configuration_sid}/Plugins/#{sid}",
             opts: opts,
             base_url: "https://flex-api.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Flex.V1.PluginService.Configuration.ConfiguredPlugin
       )}
    end
  end
end
