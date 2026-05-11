# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Conversations.V2.ControlPlane.ConfigurationService do
  @moduledoc """
  Service for Configuration API operations.

  Operations: `list`, `create`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of Configurations.

  Operation: `ListConfiguration` | Tags: ConversationsV2Configuration

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `pageSize` | integer | Maximum number of items to return in a single response |
  | `pageToken` | string | A URL-safe, base64-encoded token representing the page of results to return |
  | `memoryStoreId` | string | Filter configurations by Memory Store ID |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v2/ControlPlane/Configurations",
           params: params,
           opts: opts,
           base_url: "https://conversations.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "configurations")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Conversations.V2.ControlPlane.Configuration
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of Configurations. (lazy auto-pagination)."
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
  Create a new Configuration

  Operation: `CreateConfiguration` | Tags: ConversationsV2Configuration

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `conversationGroupingType` | string | The strategy Conversation Orchestrator uses to assign communications to conversations. Values: `GROUP_BY_PROFILE`, `GROUP_BY_PARTICIPANT_ADDRESSES`, `GROUP_BY_PARTICIPANT_ADDRESSES_AND_CHANNEL_TYPE` |
  | `description` | string | Human-readable description for the configuration. |
  | `displayName` | string | A human-readable name for the configuration. Limited to 32 characters. |
  | `memoryStoreId` | string | The memory store ID that Conversation Orchestrator uses for profile resolution. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `channelSettings` | object |  |
  | `intelligenceConfigurationIds` | array | A list of Conversational Intelligence configuration IDs. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `memoryExtractionEnabled` | boolean | Whether memory extraction is enabled for conversations under this configuration. Defaults to false. |
  | `statusCallbacks` | array | A list of webhook configurations. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Conversations.V2.ControlPlane.Configuration.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/ControlPlane/Configurations",
             params: params,
             opts: opts,
             base_url: "https://conversations.twilio.com",
             content_type: :json
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Conversations.V2.ControlPlane.Configuration
       )}
    end
  end

  @doc """
  Retrieve a Configuration.

  Operation: `FetchConfiguration` | Tags: ConversationsV2Configuration
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Conversations.V2.ControlPlane.Configuration.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v2/ControlPlane/Configurations/#{sid}",
             opts: opts,
             base_url: "https://conversations.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Conversations.V2.ControlPlane.Configuration
       )}
    end
  end

  @doc """
  Delete a Configuration

  Operation: `DeleteConfiguration` | Tags: ConversationsV2Configuration
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v2/ControlPlane/Configurations/#{sid}",
      opts: opts,
      base_url: "https://conversations.twilio.com"
    )
  end
end
