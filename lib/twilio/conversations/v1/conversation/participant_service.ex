# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Conversations.V1.Conversation.ParticipantService do
  @moduledoc """
  A Participant resource represents a member of the conversation.

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all participants of the conversation

  Operation: `ListConversationParticipant` | Tags: ConversationsV1Participant
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, conversation_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Conversations/#{conversation_sid}/Participants",
           params: params,
           opts: opts,
           base_url: "https://conversations.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "participants")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Conversations.V1.Conversation.Participant
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all participants of the conversation (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, conversation_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, conversation_sid, Map.merge(params, page_opts), opts)
      end,
      "participants"
    )
  end

  @doc """
  Add a new participant to the conversation

  Operation: `CreateConversationParticipant` | Tags: ConversationsV1Participant

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Attributes` | string | An optional string metadata field you can use to store any data you wish. The string value must contain structurally valid JSON if specified.  **Note** that if the attributes are not set "{}" will be returned. |
  | `DateCreated` | string (date-time) | The date that this resource was created. |
  | `DateUpdated` | string (date-time) | The date that this resource was last updated. |
  | `Identity` | string | A unique string identifier for the conversation participant as [Conversation User](https://www.twilio.com/docs/conversations/api/user-resource). This parameter is non-null if (and only if) the participant is using the Conversations SDK to communicate. Limited to 256 characters. |
  | `MessagingBinding.Address` | string | The address of the participant's device, e.g. a phone or WhatsApp number. Together with the Proxy address, this determines a participant uniquely. This field (with proxy_address) is only null when the participant is interacting from an SDK endpoint (see the 'identity' field). |
  | `MessagingBinding.ProjectedAddress` | string | The address of the Twilio phone number that is used in Group MMS. Communication mask for the Conversation participant with Identity. |
  | `MessagingBinding.ProxyAddress` | string | The address of the Twilio phone number (or WhatsApp number) that the participant is in contact with. This field, together with participant address, is only null when the participant is interacting from an SDK endpoint (see the 'identity' field). |
  | `RoleSid` | string | The SID of a conversation-level [Role](https://www.twilio.com/docs/conversations/api/role-resource) to assign to the participant. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Conversations.V1.Conversation.Participant.t()}
          | {:error, Twilio.Error.t()}
  def create(client, conversation_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Conversations/#{conversation_sid}/Participants",
             params: params,
             opts: opts,
             base_url: "https://conversations.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Conversations.V1.Conversation.Participant)}
    end
  end

  @doc """
  Fetch a participant of the conversation

  Operation: `FetchConversationParticipant` | Tags: ConversationsV1Participant
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Conversations.V1.Conversation.Participant.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, conversation_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/Conversations/#{conversation_sid}/Participants/#{sid}",
             opts: opts,
             base_url: "https://conversations.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Conversations.V1.Conversation.Participant)}
    end
  end

  @doc """
  Update an existing participant in the conversation

  Operation: `UpdateConversationParticipant` | Tags: ConversationsV1Participant

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Attributes` | string | An optional string metadata field you can use to store any data you wish. The string value must contain structurally valid JSON if specified.  **Note** that if the attributes are not set "{}" will be returned. |
  | `DateCreated` | string (date-time) | The date that this resource was created. |
  | `DateUpdated` | string (date-time) | The date that this resource was last updated. |
  | `Identity` | string | A unique string identifier for the conversation participant as [Conversation User](https://www.twilio.com/docs/conversations/api/user-resource). This parameter is non-null if (and only if) the participant is using the Conversations SDK to communicate. Limited to 256 characters. |
  | `LastReadMessageIndex` | integer | Index of last “read” message in the [Conversation](https://www.twilio.com/docs/conversations/api/conversation-resource) for the Participant. |
  | `LastReadTimestamp` | string | Timestamp of last “read” message in the [Conversation](https://www.twilio.com/docs/conversations/api/conversation-resource) for the Participant. |
  | `MessagingBinding.ProjectedAddress` | string | The address of the Twilio phone number that is used in Group MMS. 'null' value will remove it. |
  | `MessagingBinding.ProxyAddress` | string | The address of the Twilio phone number that the participant is in contact with. 'null' value will remove it. |
  | `RoleSid` | string | The SID of a conversation-level [Role](https://www.twilio.com/docs/conversations/api/role-resource) to assign to the participant. |
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Conversations.V1.Conversation.Participant.t()}
          | {:error, Twilio.Error.t()}
  def update(client, conversation_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/Conversations/#{conversation_sid}/Participants/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://conversations.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Conversations.V1.Conversation.Participant)}
    end
  end

  @doc """
  Remove a participant from the conversation

  Operation: `DeleteConversationParticipant` | Tags: ConversationsV1Participant
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, conversation_sid, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Conversations/#{conversation_sid}/Participants/#{sid}",
      opts: opts,
      base_url: "https://conversations.twilio.com"
    )
  end
end
