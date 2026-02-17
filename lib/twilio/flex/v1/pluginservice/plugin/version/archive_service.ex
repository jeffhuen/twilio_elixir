# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Flex.V1.Pluginservice.Plugin.Version.ArchiveService do
  @moduledoc """


  Operations: `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `UpdatePluginVersionArchive` | Tags: FlexV1PluginVersionArchive
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.Pluginservice.Plugin.Version.Archive.t()}
          | {:error, Twilio.Error.t()}
  def update(client, plugin_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/PluginService/Plugins/#{plugin_sid}/Versions/#{sid}/Archive",
             params: params,
             opts: opts,
             base_url: "https://flex-api.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Flex.V1.Pluginservice.Plugin.Version.Archive
       )}
    end
  end
end
