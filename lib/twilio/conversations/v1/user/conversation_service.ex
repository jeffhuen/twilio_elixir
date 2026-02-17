# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Conversations.V1.User.ConversationService do
  @moduledoc """
  A User Conversation resource represents a conversation of the user belonging to a default conversation service.

  Operations: `list`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all User Conversations for the User.

  Operation: `ListUserConversation` | Tags: ConversationsV1UserConversation
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, user_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Users/#{user_sid}/Conversations",
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
                 Twilio.Resources.Conversations.V1.User.Conversation
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all User Conversations for the User. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, user_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, user_sid, Map.merge(params, page_opts), opts)
      end,
      "conversations"
    )
  end

  @doc """
  Fetch a specific User Conversation.

  Operation: `FetchUserConversation` | Tags: ConversationsV1UserConversation
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Conversations.V1.User.Conversation.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, user_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Users/#{user_sid}/Conversations/#{sid}",
             opts: opts,
             base_url: "https://conversations.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Conversations.V1.User.Conversation)}
    end
  end

  @doc """
  Update a specific User Conversation.

  Operation: `UpdateUserConversation` | Tags: ConversationsV1UserConversation

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `LastReadMessageIndex` | integer | The index of the last Message in the Conversation that the Participant has read. |
  | `LastReadTimestamp` | string (date-time) | The date of the last message read in conversation by the user, given in ISO 8601 format. |
  | `NotificationLevel` | string |  Values: `default`, `muted` |
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Conversations.V1.User.Conversation.t()}
          | {:error, Twilio.Error.t()}
  def update(client, user_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Users/#{user_sid}/Conversations/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://conversations.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Conversations.V1.User.Conversation)}
    end
  end

  @doc """
  Delete a specific User Conversation.

  Operation: `DeleteUserConversation` | Tags: ConversationsV1UserConversation
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, user_sid, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Users/#{user_sid}/Conversations/#{sid}",
      opts: opts,
      base_url: "https://conversations.twilio.com"
    )
  end
end
