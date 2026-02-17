# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Conversations.V1.ConversationWithParticipants do
  @moduledoc """
  A Conversation resource represents an omnichannel group conversation with an ordered list of messages and a participant roster.

  SID prefix: `CH`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The unique ID of the [Account](https://www.twilio.com/docs/iam/api/account) responsible for this conversation. |
  | `attributes` | An optional string metadata field you can use to store any data you wish. The string value must contain structurally valid JSON if specified.  **Note** that if the attributes are not set "{}" will be returned.. PII: sensitive |
  | `chat_service_sid` | The unique ID of the [Conversation Service](https://www.twilio.com/docs/conversations/api/service-resource) this conversation belongs to. |
  | `date_created` | The date that this resource was created.. Format: date-time |
  | `date_updated` | The date that this resource was last updated.. Format: date-time |
  | `friendly_name` | The human-readable name of this conversation, limited to 256 characters. Optional.. PII: standard |
  | `links` | Contains absolute URLs to access the [participants](https://www.twilio.com/docs/conversations/api/conversation-participant-resource), [messages](https://www.twilio.com/docs/conversations/api/conversation-message-resource) and [webhooks](https://www.twilio.com/docs/conversations/api/conversation-scoped-webhook-resource) of this conversation.. Format: uri-map |
  | `messaging_service_sid` | The unique ID of the [Messaging Service](https://www.twilio.com/docs/messaging/api/service-resource) this conversation belongs to. |
  | `sid` | A 34 character string that uniquely identifies this resource. |
  | `state` | Current state of this conversation. Can be either `initializing`, `active`, `inactive` or `closed` and defaults to `active`. Values: `initializing`, `inactive`, `active`, `closed` |
  | `timers` | Timer date values representing state update for this conversation. |
  | `unique_name` | An application-defined string that uniquely identifies the resource. It can be used to address the resource in place of the resource's `sid` in the URL.. PII: standard |
  | `url` | An absolute API resource URL for this conversation.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          attributes: String.t() | nil,
          bindings: String.t() | nil,
          chat_service_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          links: map() | nil,
          messaging_service_sid: String.t() | nil,
          sid: String.t() | nil,
          state: String.t(),
          timers: String.t() | nil,
          unique_name: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :attributes,
    :bindings,
    :chat_service_sid,
    :date_created,
    :date_updated,
    :friendly_name,
    :links,
    :messaging_service_sid,
    :sid,
    :state,
    :timers,
    :unique_name,
    :url
  ]

  @object_name "conversations.v1.conversation_with_participants"
  def object_name, do: @object_name

  @sid_prefix "CH"
  def sid_prefix, do: @sid_prefix
end
