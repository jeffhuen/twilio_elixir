# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Conversations.V1.Service.Conversation.MessageService do
  @moduledoc """
  A Service Message resource represents a message in a conversation within a specific service.

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all messages in the conversation

  Operation: `ListServiceConversationMessage` | Tags: ConversationsV1Message

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Order` | string | The sort order of the returned messages. Can be: `asc` (ascending) or `desc` (descending), with `asc` as the default. |
  """
  @spec list(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, chat_service_sid, conversation_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/v1/Services/#{chat_service_sid}/Conversations/#{conversation_sid}/Messages",
           params: params,
           opts: opts,
           base_url: "https://conversations.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "messages")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Conversations.V1.Service.Conversation.Message
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all messages in the conversation (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, chat_service_sid, conversation_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, chat_service_sid, conversation_sid, Map.merge(params, page_opts), opts)
      end,
      "messages"
    )
  end

  @doc """
  Add a new message to the conversation in a specific service

  Operation: `CreateServiceConversationMessage` | Tags: ConversationsV1Message

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Attributes` | string | A string metadata field you can use to store any data you wish. The string value must contain structurally valid JSON if specified.  **Note** that if the attributes are not set "{}" will be returned. |
  | `Author` | string | The channel specific identifier of the message's author. Defaults to `system`. |
  | `Body` | string | The content of the message, can be up to 1,600 characters long. |
  | `ContentSid` | string | The unique ID of the multi-channel [Rich Content](https://www.twilio.com/docs/content) template, required for template-generated messages.  **Note** that if this field is set, `Body` and `MediaSid` parameters are ignored. |
  | `ContentVariables` | string | A structurally valid JSON string that contains values to resolve Rich Content template variables. |
  | `DateCreated` | string (date-time) | The date that this resource was created. |
  | `DateUpdated` | string (date-time) | The date that this resource was last updated. `null` if the message has not been edited. |
  | `MediaSid` | string | The Media SID to be attached to the new Message. |
  | `Subject` | string | The subject of the message, can be up to 256 characters long. |
  """
  @spec create(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Conversations.V1.Service.Conversation.Message.t()}
          | {:error, Twilio.Error.t()}
  def create(client, chat_service_sid, conversation_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/Services/#{chat_service_sid}/Conversations/#{conversation_sid}/Messages",
             params: params,
             opts: opts,
             base_url: "https://conversations.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Conversations.V1.Service.Conversation.Message
       )}
    end
  end

  @doc """
  Fetch a message from the conversation

  Operation: `FetchServiceConversationMessage` | Tags: ConversationsV1Message
  """
  @spec fetch(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Conversations.V1.Service.Conversation.Message.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, chat_service_sid, conversation_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/Services/#{chat_service_sid}/Conversations/#{conversation_sid}/Messages/#{sid}",
             opts: opts,
             base_url: "https://conversations.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Conversations.V1.Service.Conversation.Message
       )}
    end
  end

  @doc """
  Update an existing message in the conversation

  Operation: `UpdateServiceConversationMessage` | Tags: ConversationsV1Message

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Attributes` | string | A string metadata field you can use to store any data you wish. The string value must contain structurally valid JSON if specified.  **Note** that if the attributes are not set "{}" will be returned. |
  | `Author` | string | The channel specific identifier of the message's author. Defaults to `system`. |
  | `Body` | string | The content of the message, can be up to 1,600 characters long. |
  | `DateCreated` | string (date-time) | The date that this resource was created. |
  | `DateUpdated` | string (date-time) | The date that this resource was last updated. `null` if the message has not been edited. |
  | `Subject` | string | The subject of the message, can be up to 256 characters long. |
  """
  @spec update(Client.t(), String.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Conversations.V1.Service.Conversation.Message.t()}
          | {:error, Twilio.Error.t()}
  def update(client, chat_service_sid, conversation_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/Services/#{chat_service_sid}/Conversations/#{conversation_sid}/Messages/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://conversations.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Conversations.V1.Service.Conversation.Message
       )}
    end
  end

  @doc """
  Remove a message from the conversation

  Operation: `DeleteServiceConversationMessage` | Tags: ConversationsV1Message
  """
  @spec delete(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, chat_service_sid, conversation_sid, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v1/Services/#{chat_service_sid}/Conversations/#{conversation_sid}/Messages/#{sid}",
      opts: opts,
      base_url: "https://conversations.twilio.com"
    )
  end
end
