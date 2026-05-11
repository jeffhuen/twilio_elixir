# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Conversations.V2.Conversation.CommunicationService do
  @moduledoc """
  Service for Communication API operations.

  Operations: `list`, `create`, `fetch`
  """

  alias Twilio.Client

  @doc """
  Retrieve a list of Communications in a Conversation.

  Operation: `ListCommunicationByConversation` | Tags: ConversationsV2Communication

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `channelId` | string | Resource identifier to filter communications |
  | `pageSize` | integer | Maximum number of items to return |
  | `pageToken` | string | Page token for pagination |
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, conversation_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v2/Conversations/#{conversation_sid}/Communications",
           params: params,
           opts: opts,
           base_url: "https://conversations.twilio.com"
         ) do
      {:ok, data} -> {:ok, Twilio.Page.from_response(data, "communications")}
      error -> error
    end
  end

  @doc "Stream: Retrieve a list of Communications in a Conversation. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, conversation_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, conversation_sid, Map.merge(params, page_opts), opts)
      end,
      "communications"
    )
  end

  @doc """
  Create a Communication.

  Operation: `CreateCommunicationInConversation` | Tags: ConversationsV2Communication

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `author` | object |  |
  | `content` | string | The content of the Communication. |
  | `recipients` | array |  |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `channelId` | string |  |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def create(client, conversation_sid, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v2/Conversations/#{conversation_sid}/Communications",
      params: params,
      opts: opts,
      base_url: "https://conversations.twilio.com",
      content_type: :json
    )
  end

  @doc """
  Retrieve a Communication.

  Operation: `FetchCommunication` | Tags: ConversationsV2Communication
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def fetch(client, conversation_sid, sid, opts \\ []) do
    Client.request(client, :get, "/v2/Conversations/#{conversation_sid}/Communications/#{sid}",
      opts: opts,
      base_url: "https://conversations.twilio.com"
    )
  end
end
