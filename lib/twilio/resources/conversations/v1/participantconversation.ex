# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Conversations.V1.Participantconversation do
  @moduledoc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Participant Conversations resource represents a list of Conversations that this Participant belongs to belonging to a default conversation service.

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The unique ID of the [Account](https://www.twilio.com/docs/iam/api/account) responsible for this conversation. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `chat_service_sid` | The unique ID of the [Conversation Service](https://www.twilio.com/docs/conversations/api/service-resource) this conversation belongs to. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `conversation_attributes` | An optional string metadata field you can use to store any data you wish. The string value must contain structurally valid JSON if specified.  **Note** that if the attributes are not set "{}" will be returned.. PII: sensitive |
  | `conversation_created_by` | Identity of the creator of this Conversation. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `conversation_date_created` | The date that this conversation was created, given in ISO 8601 format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `conversation_date_updated` | The date that this conversation was last updated, given in ISO 8601 format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `conversation_friendly_name` | The human-readable name of this conversation, limited to 256 characters. Optional.. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `conversation_sid` | The unique ID of the [Conversation](https://www.twilio.com/docs/conversations/api/conversation-resource) this Participant belongs to. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `conversation_state` | The current state of this User Conversation. One of `inactive`, `active` or `closed`.. Values: `inactive`, `active`, `closed` |
  | `conversation_timers` | Timer date values representing state update for this conversation. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `conversation_unique_name` | An application-defined string that uniquely identifies the Conversation resource.. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `links` | Contains absolute URLs to access the [participant](https://www.twilio.com/docs/conversations/api/conversation-participant-resource) and [conversation](https://www.twilio.com/docs/conversations/api/conversation-resource) of this conversation.. Format: uri-map |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `participant_identity` | A unique string identifier for the conversation participant as [Conversation User](https://www.twilio.com/docs/conversations/api/user-resource). This parameter is non-null if (and only if) the participant is using the Conversations SDK to communicate. Limited to 256 characters.. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `participant_messaging_binding` | Information about how this participant exchanges messages with the conversation. A JSON parameter consisting of type and address fields of the participant.. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `participant_sid` | The unique ID of the [Participant](https://www.twilio.com/docs/conversations/api/conversation-participant-resource). |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `participant_user_sid` | The unique string that identifies the conversation participant as [Conversation User](https://www.twilio.com/docs/conversations/api/user-resource). |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          chat_service_sid: String.t() | nil,
          conversation_attributes: String.t() | nil,
          conversation_created_by: String.t() | nil,
          conversation_date_created: String.t() | nil,
          conversation_date_updated: String.t() | nil,
          conversation_friendly_name: String.t() | nil,
          conversation_sid: String.t() | nil,
          conversation_state: String.t(),
          conversation_timers: String.t() | nil,
          conversation_unique_name: String.t() | nil,
          links: map() | nil,
          participant_identity: String.t() | nil,
          participant_messaging_binding: String.t() | nil,
          participant_sid: String.t() | nil,
          participant_user_sid: String.t() | nil
        }

  defstruct [
    :account_sid,
    :chat_service_sid,
    :conversation_attributes,
    :conversation_created_by,
    :conversation_date_created,
    :conversation_date_updated,
    :conversation_friendly_name,
    :conversation_sid,
    :conversation_state,
    :conversation_timers,
    :conversation_unique_name,
    :links,
    :participant_identity,
    :participant_messaging_binding,
    :participant_sid,
    :participant_user_sid
  ]

  @object_name "conversations.v1.participant_conversation"
  def object_name, do: @object_name
end
