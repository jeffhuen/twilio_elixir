# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Conversations.V1.User.Conversation do
  @moduledoc """
  A User Conversation resource represents a conversation of the user belonging to a default conversation service.

  Parent: `/Users/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The unique ID of the [Account](https://www.twilio.com/docs/iam/api/account) responsible for this conversation. |
  | `attributes` | An optional string metadata field you can use to store any data you wish. The string value must contain structurally valid JSON if specified.  **Note** that if the attributes are not set "{}" will be returned.. PII: sensitive |
  | `chat_service_sid` | The unique ID of the [Conversation Service](https://www.twilio.com/docs/conversations/api/service-resource) this conversation belongs to. |
  | `conversation_sid` | The unique ID of the [Conversation](https://www.twilio.com/docs/conversations/api/conversation-resource) for this User Conversation. |
  | `conversation_state` | The current state of this User Conversation. One of `inactive`, `active` or `closed`.. Values: `inactive`, `active`, `closed` |
  | `created_by` | Identity of the creator of this Conversation. |
  | `date_created` | The date that this conversation was created, given in ISO 8601 format.. Format: date-time |
  | `date_updated` | The date that this conversation was last updated, given in ISO 8601 format.. Format: date-time |
  | `friendly_name` | The human-readable name of this conversation, limited to 256 characters. Optional.. PII: standard |
  | `last_read_message_index` | The index of the last Message in the Conversation that the Participant has read. |
  | `links` | Contains absolute URLs to access the [participant](https://www.twilio.com/docs/conversations/api/conversation-participant-resource) and [conversation](https://www.twilio.com/docs/conversations/api/conversation-resource) of this conversation.. Format: uri-map |
  | `notification_level` | The Notification Level of this User Conversation. One of `default` or `muted`.. Values: `default`, `muted` |
  | `participant_sid` | The unique ID of the [participant](https://www.twilio.com/docs/conversations/api/conversation-participant-resource) the user conversation belongs to. |
  | `timers` | Timer date values representing state update for this conversation. |
  | `unique_name` | An application-defined string that uniquely identifies the Conversation resource. It can be used to address the resource in place of the resource's `conversation_sid` in the URL.. PII: standard |
  | `unread_messages_count` | The number of unread Messages in the Conversation for the Participant. |
  | `url` | Format: uri |
  | `user_sid` | The unique string that identifies the [User resource](https://www.twilio.com/docs/conversations/api/user-resource). |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          attributes: String.t() | nil,
          chat_service_sid: String.t() | nil,
          conversation_sid: String.t() | nil,
          conversation_state: String.t(),
          created_by: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          last_read_message_index: integer() | nil,
          links: map() | nil,
          notification_level: String.t(),
          participant_sid: String.t() | nil,
          timers: String.t() | nil,
          unique_name: String.t() | nil,
          unread_messages_count: integer() | nil,
          url: String.t() | nil,
          user_sid: String.t() | nil
        }

  defstruct [
    :account_sid,
    :attributes,
    :chat_service_sid,
    :conversation_sid,
    :conversation_state,
    :created_by,
    :date_created,
    :date_updated,
    :friendly_name,
    :last_read_message_index,
    :links,
    :notification_level,
    :participant_sid,
    :timers,
    :unique_name,
    :unread_messages_count,
    :url,
    :user_sid
  ]

  @object_name "conversations.v1.user.user_conversation"
  def object_name, do: @object_name
end
