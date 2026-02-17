# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Flex.V1.Pluginservice.ReleaseService do
  @moduledoc """


  Operations: `list`, `create`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListPluginRelease` | Tags: FlexV1PluginRelease
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/PluginService/Releases",
           params: params,
           opts: opts,
           base_url: "https://flex-api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "releases")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Flex.V1.Pluginservice.Release
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
      "releases"
    )
  end

  @doc """


  Operation: `CreatePluginRelease` | Tags: FlexV1PluginRelease

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `ConfigurationId` | string | The SID or the Version of the Flex Plugin Configuration to release. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.Pluginservice.Release.t()} | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/PluginService/Releases",
             params: params,
             opts: opts,
             base_url: "https://flex-api.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Flex.V1.Pluginservice.Release)}
    end
  end

  @doc """


  Operation: `FetchPluginRelease` | Tags: FlexV1PluginRelease
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.Pluginservice.Release.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/PluginService/Releases/#{sid}",
             opts: opts,
             base_url: "https://flex-api.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Flex.V1.Pluginservice.Release)}
    end
  end
end
