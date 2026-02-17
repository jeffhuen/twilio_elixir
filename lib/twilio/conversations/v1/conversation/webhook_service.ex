# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Conversations.V1.Conversation.WebhookService do
  @moduledoc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  A Scoped Webhook resource manages a set of callback URLs and their configuration for receiving events specific to one conversation.

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all webhooks scoped to the conversation

  Operation: `ListConversationScopedWebhook` | Tags: ConversationsV1Webhook
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, conversation_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Conversations/#{conversation_sid}/Webhooks",
           params: params,
           opts: opts,
           base_url: "https://conversations.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "webhooks")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Conversations.V1.Conversation.Webhook
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all webhooks scoped to the conversation (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, conversation_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, conversation_sid, Map.merge(params, page_opts), opts)
      end,
      "webhooks"
    )
  end

  @doc """
  Create a new webhook scoped to the conversation

  Operation: `CreateConversationScopedWebhook` | Tags: ConversationsV1Webhook

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Target` | string |  Values: `webhook`, `trigger`, `studio` |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Configuration.Filters` | array | The list of events, firing webhook event for this Conversation. |
  | `Configuration.FlowSid` | string | The studio flow SID, where the webhook should be sent to. |
  | `Configuration.Method` | string |  Values: `get`, `post` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Configuration.ReplayAfter` | integer | The message index for which and it's successors the webhook will be replayed. Not set by default |
  | `Configuration.Triggers` | array | The list of keywords, firing webhook event for this Conversation. |
  | `Configuration.Url` | string | The absolute url the webhook request should be sent to. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Conversations.V1.Conversation.Webhook.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, conversation_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Conversations/#{conversation_sid}/Webhooks",
             params: params,
             opts: opts,
             base_url: "https://conversations.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Conversations.V1.Conversation.Webhook)}
    end
  end

  @doc """
  Fetch the configuration of a conversation-scoped webhook

  Operation: `FetchConversationScopedWebhook` | Tags: ConversationsV1Webhook
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Conversations.V1.Conversation.Webhook.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, conversation_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Conversations/#{conversation_sid}/Webhooks/#{sid}",
             opts: opts,
             base_url: "https://conversations.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Conversations.V1.Conversation.Webhook)}
    end
  end

  @doc """
  Update an existing conversation-scoped webhook

  Operation: `UpdateConversationScopedWebhook` | Tags: ConversationsV1Webhook

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Configuration.Filters` | array | The list of events, firing webhook event for this Conversation. |
  | `Configuration.FlowSid` | string | The studio flow SID, where the webhook should be sent to. |
  | `Configuration.Method` | string |  Values: `get`, `post` |
  | `Configuration.Triggers` | array | The list of keywords, firing webhook event for this Conversation. |
  | `Configuration.Url` | string | The absolute url the webhook request should be sent to. |
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Conversations.V1.Conversation.Webhook.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, conversation_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Conversations/#{conversation_sid}/Webhooks/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://conversations.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Conversations.V1.Conversation.Webhook)}
    end
  end

  @doc """
  Remove an existing webhook scoped to the conversation

  Operation: `DeleteConversationScopedWebhook` | Tags: ConversationsV1Webhook
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, conversation_sid, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Conversations/#{conversation_sid}/Webhooks/#{sid}",
      opts: opts,
      base_url: "https://conversations.twilio.com"
    )
  end
end
