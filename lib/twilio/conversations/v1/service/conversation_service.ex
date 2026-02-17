# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Conversations.V1.Service.ConversationService do
  @moduledoc """
  A Service Conversation resource represents an omnichannel group conversation with an ordered list of messages and a participant roster.

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of conversations in your service

  Operation: `ListServiceConversation` | Tags: ConversationsV1Conversation

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `StartDate` | string | Specifies the beginning of the date range for filtering Conversations based on their creation date. Conversations that were created on or after this date will be included in the results. The date must be in ISO8601 format, specifically starting at the beginning of the specified date (YYYY-MM-DDT00:00:00Z), for precise filtering. This parameter can be combined with other filters. If this filter is used, the returned list is sorted by latest conversation creation date in descending order. |
  | `EndDate` | string | Defines the end of the date range for filtering conversations by their creation date. Only conversations that were created on or before this date will appear in the results.  The date must be in ISO8601 format, specifically capturing up to the end of the specified date (YYYY-MM-DDT23:59:59Z), to ensure that conversations from the entire end day are included. This parameter can be combined with other filters. If this filter is used, the returned list is sorted by latest conversation creation date in descending order. |
  | `State` | string | State for sorting and filtering list of Conversations. Can be `active`, `inactive` or `closed` |
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, chat_service_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Services/#{chat_service_sid}/Conversations",
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
                 Twilio.Resources.Conversations.V1.Service.Conversation
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of conversations in your service (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, chat_service_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, chat_service_sid, Map.merge(params, page_opts), opts)
      end,
      "conversations"
    )
  end

  @doc """
  Create a new conversation in your service

  Operation: `CreateServiceConversation` | Tags: ConversationsV1Conversation

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Attributes` | string | An optional string metadata field you can use to store any data you wish. The string value must contain structurally valid JSON if specified.  **Note** that if the attributes are not set "{}" will be returned. |
  | `Bindings.Email.Address` | string | The default email address that will be used when sending outbound emails in this conversation. |
  | `Bindings.Email.Name` | string | The default name that will be used when sending outbound emails in this conversation. |
  | `DateCreated` | string (date-time) | The date that this resource was created. |
  | `DateUpdated` | string (date-time) | The date that this resource was last updated. |
  | `FriendlyName` | string | The human-readable name of this conversation, limited to 256 characters. Optional. |
  | `MessagingServiceSid` | string | The unique ID of the [Messaging Service](https://www.twilio.com/docs/messaging/api/service-resource) this conversation belongs to. |
  | `State` | string |  Values: `inactive`, `active`, `closed`, `initializing` |
  | `Timers.Closed` | string | ISO8601 duration when conversation will be switched to `closed` state. Minimum value for this timer is 10 minutes. |
  | `Timers.Inactive` | string | ISO8601 duration when conversation will be switched to `inactive` state. Minimum value for this timer is 1 minute. |
  | `UniqueName` | string | An application-defined string that uniquely identifies the resource. It can be used to address the resource in place of the resource's `sid` in the URL. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Conversations.V1.Service.Conversation.t()}
          | {:error, Twilio.Error.t()}
  def create(client, chat_service_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Services/#{chat_service_sid}/Conversations",
             params: params,
             opts: opts,
             base_url: "https://conversations.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Conversations.V1.Service.Conversation)}
    end
  end

  @doc """
  Fetch a conversation from your service

  Operation: `FetchServiceConversation` | Tags: ConversationsV1Conversation
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Conversations.V1.Service.Conversation.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, chat_service_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Services/#{chat_service_sid}/Conversations/#{sid}",
             opts: opts,
             base_url: "https://conversations.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Conversations.V1.Service.Conversation)}
    end
  end

  @doc """
  Update an existing conversation in your service

  Operation: `UpdateServiceConversation` | Tags: ConversationsV1Conversation

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Attributes` | string | An optional string metadata field you can use to store any data you wish. The string value must contain structurally valid JSON if specified.  **Note** that if the attributes are not set "{}" will be returned. |
  | `Bindings.Email.Address` | string | The default email address that will be used when sending outbound emails in this conversation. |
  | `Bindings.Email.Name` | string | The default name that will be used when sending outbound emails in this conversation. |
  | `DateCreated` | string (date-time) | The date that this resource was created. |
  | `DateUpdated` | string (date-time) | The date that this resource was last updated. |
  | `FriendlyName` | string | The human-readable name of this conversation, limited to 256 characters. Optional. |
  | `MessagingServiceSid` | string | The unique ID of the [Messaging Service](https://www.twilio.com/docs/messaging/api/service-resource) this conversation belongs to. |
  | `State` | string |  Values: `inactive`, `active`, `closed`, `initializing` |
  | `Timers.Closed` | string | ISO8601 duration when conversation will be switched to `closed` state. Minimum value for this timer is 10 minutes. |
  | `Timers.Inactive` | string | ISO8601 duration when conversation will be switched to `inactive` state. Minimum value for this timer is 1 minute. |
  | `UniqueName` | string | An application-defined string that uniquely identifies the resource. It can be used to address the resource in place of the resource's `sid` in the URL. |
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Conversations.V1.Service.Conversation.t()}
          | {:error, Twilio.Error.t()}
  def update(client, chat_service_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Services/#{chat_service_sid}/Conversations/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://conversations.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Conversations.V1.Service.Conversation)}
    end
  end

  @doc """
  Remove a conversation from your service

  Operation: `DeleteServiceConversation` | Tags: ConversationsV1Conversation
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, chat_service_sid, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Services/#{chat_service_sid}/Conversations/#{sid}",
      opts: opts,
      base_url: "https://conversations.twilio.com"
    )
  end
end
