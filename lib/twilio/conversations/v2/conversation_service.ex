# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Conversations.V2.ConversationService do
  @moduledoc """
  Service for Conversation API operations.

  Operations: `list`, `create`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of Conversations.

  Operation: `ListConversationByAccount` | Tags: ConversationsV2Conversation

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `status` | array | Filters for specific statuses |
  | `channelId` | string | The resource identifier (such as callSid or messageSid) to filter conversations. |
  | `pageSize` | integer | Maximum number of items to return in a single response |
  | `pageToken` | string | A URL-safe, base64-encoded token representing the page of results to return |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v2/Conversations",
           params: params,
           opts: opts,
           base_url: "https://conversations.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "conversations")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Conversations.V2.Conversation
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of Conversations. (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "conversations"
    )
  end

  @doc """
  Create a new conversation

  Operation: `CreateConversationWithConfig` | Tags: ConversationsV2Conversation

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `configurationId` | string | The ID of an existing configuration. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `configuration` | object | Conversation configuration settings. |
  | `name` | string | The name of the conversation. |
  | `participants` | array | Optional list of Participants to create with the Conversation. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Conversations.V2.Conversation.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/Conversations",
             params: params,
             opts: opts,
             base_url: "https://conversations.twilio.com",
             content_type: :json
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Conversations.V2.Conversation)}
    end
  end

  @doc """
  Retrieve a Conversation.

  Operation: `FetchConversation` | Tags: ConversationsV2Conversation
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Conversations.V2.Conversation.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v2/Conversations/#{sid}",
             opts: opts,
             base_url: "https://conversations.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Conversations.V2.Conversation)}
    end
  end

  @doc """
  Asynchronously delete a conversation and all associated data.
  Returns 202 Accepted with an Operation-Id for status tracking via GET /v2/ControlPlane/Operations/{operationId}.


  Operation: `DeleteConversationAsync` | Tags: ConversationsV2Conversation
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v2/Conversations/#{sid}",
      opts: opts,
      base_url: "https://conversations.twilio.com"
    )
  end
end
