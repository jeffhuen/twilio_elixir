# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Conversations.V1.Service.Conversation.Participant do
  @moduledoc """
  A Service Participant resource represents a member of the conversation within a specific service.

  SID prefix: `MB`

  Parent: `/Services/{ChatServiceSid}/Conversations/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The unique ID of the [Account](https://www.twilio.com/docs/iam/api/account) responsible for this participant. |
  | `attributes` | An optional string metadata field you can use to store any data you wish. The string value must contain structurally valid JSON if specified.  **Note** that if the attributes are not set `{}` will be returned.. PII: sensitive |
  | `chat_service_sid` | The SID of the [Conversation Service](https://www.twilio.com/docs/conversations/api/service-resource) the Participant resource is associated with. |
  | `conversation_sid` | The unique ID of the [Conversation](https://www.twilio.com/docs/conversations/api/conversation-resource) for this participant. |
  | `date_created` | The date on which this resource was created.. Format: date-time |
  | `date_updated` | The date on which this resource was last updated.. Format: date-time |
  | `identity` | A unique string identifier for the conversation participant as [Conversation User](https://www.twilio.com/docs/conversations/api/user-resource). This parameter is non-null if (and only if) the participant is using the [Conversation SDK](https://www.twilio.com/docs/conversations/sdk-overview) to communicate. Limited to 256 characters.. PII: standard |
  | `last_read_message_index` | Index of last “read” message in the [Conversation](https://www.twilio.com/docs/conversations/api/conversation-resource) for the Participant. |
  | `last_read_timestamp` | Timestamp of last “read” message in the [Conversation](https://www.twilio.com/docs/conversations/api/conversation-resource) for the Participant. |
  | `messaging_binding` | Information about how this participant exchanges messages with the conversation. A JSON parameter consisting of type and address fields of the participant.. PII: standard |
  | `role_sid` | The SID of a conversation-level [Role](https://www.twilio.com/docs/conversations/api/role-resource) to assign to the participant. |
  | `sid` | A 34 character string that uniquely identifies this resource. |
  | `url` | An absolute API resource URL for this participant.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          attributes: String.t() | nil,
          chat_service_sid: String.t() | nil,
          conversation_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          identity: String.t() | nil,
          last_read_message_index: integer() | nil,
          last_read_timestamp: String.t() | nil,
          messaging_binding: String.t() | nil,
          role_sid: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :attributes,
    :chat_service_sid,
    :conversation_sid,
    :date_created,
    :date_updated,
    :identity,
    :last_read_message_index,
    :last_read_timestamp,
    :messaging_binding,
    :role_sid,
    :sid,
    :url
  ]

  @object_name "conversations.v1.service.service_conversation.service_conversation_participant"
  def object_name, do: @object_name

  @sid_prefix "MB"
  def sid_prefix, do: @sid_prefix
end
