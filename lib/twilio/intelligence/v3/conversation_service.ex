# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Intelligence.V3.ConversationService do
  @moduledoc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Intelligence Conversations resource to retrieve conversations that have been processed by an Intelligence Configuration.

  Operations: `list`, `fetch`
  """

  alias Twilio.Client

  @doc """
  Retrieve a list of Conversations processed by an Intelligence Configuration.

  Operation: `ListConversations` | Tags: Conversations

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `pageSize` | integer | The maximum number of resources to return |
  | `pageToken` | string | Token for pagination |
  | `createdAtBefore` | string (date-time) | Filter by Conversations created before this timestamp. |
  | `createdAtAfter` | string (date-time) | Filter by Conversations created after this timestamp. |
  | `status` | string | Filter by Conversation status. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `channelId` | string | Filters Conversations by the underlying channel resource ID, such as a Call ID or Message ID. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `channels` | array | Filters Conversations that include one or more of the specified communication channels (`OR` match). |
  | `conversationConfigurationId` | string | The configuration `id` used to generate the Conversation. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `intelligenceConfigurationIds` | array | Filters Conversations activated by one or more of the specified Intelligence Configuration IDs (`OR` match). |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `operatorIds` | array | Filters Conversations to those where at least one of the specified Language Operators was executed (`OR` match). |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v3/Conversations",
           params: params,
           opts: opts,
           base_url: "https://intelligence.twilio.com"
         ) do
      {:ok, data} -> {:ok, Twilio.Page.from_response(data, "items")}
      error -> error
    end
  end

  @doc "Stream: Retrieve a list of Conversations processed by an Intelligence Configuration. (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "items"
    )
  end

  @doc """
  Fetch a Conversation.

  Operation: `FetchConversation` | Tags: Conversations
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    Client.request(client, :get, "/v3/Conversations/#{sid}",
      opts: opts,
      base_url: "https://intelligence.twilio.com"
    )
  end
end
