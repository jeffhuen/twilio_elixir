# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Conversations.V1.Role do
  @moduledoc """
  A Role resource represents a set of permissions granted to a user within a service or a conversation.

  SID prefix: `RL`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Role resource. |
  | `chat_service_sid` | The SID of the [Conversation Service](https://www.twilio.com/docs/conversations/api/service-resource) the Role resource is associated with. |
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `friendly_name` | The string that you assigned to describe the resource.. PII: standard |
  | `permissions` | An array of the permissions the role has been granted. |
  | `sid` | The unique string that we created to identify the Role resource. |
  | `type` | The type of role. Can be: `conversation` for [Conversation](https://www.twilio.com/docs/conversations/api/conversation-resource) roles or `service` for [Conversation Service](https://www.twilio.com/docs/conversations/api/service-resource) roles.. Values: `conversation`, `service` |
  | `url` | An absolute API resource URL for this user role.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          chat_service_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          permissions: list() | nil,
          sid: String.t() | nil,
          type: String.t(),
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :chat_service_sid,
    :date_created,
    :date_updated,
    :friendly_name,
    :permissions,
    :sid,
    :type,
    :url
  ]

  @object_name "conversations.v1.role"
  def object_name, do: @object_name

  @sid_prefix "RL"
  def sid_prefix, do: @sid_prefix
end
