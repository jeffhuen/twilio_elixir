# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Chat.V2.Service.Channel.Member do
  @moduledoc """
  Users joined to specific channels

  SID prefix: `MB`

  Parent: `/Services/{ServiceSid}/Channels/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Member resource. |
  | `attributes` | The JSON string that stores application-specific data. If attributes have not been set, `{}` is returned.. PII: sensitive |
  | `channel_sid` | The SID of the [Channel](https://www.twilio.com/docs/chat/channels) the Member resource belongs to. |
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `identity` | The application-defined string that uniquely identifies the resource's [User](https://www.twilio.com/docs/chat/rest/user-resource) within the [Service](https://www.twilio.com/docs/chat/rest/service-resource). See [access tokens](https://www.twilio.com/docs/chat/create-tokens) for more info.. PII: standard |
  | `last_consumed_message_index` | The index of the last [Message](https://www.twilio.com/docs/chat/rest/message-resource) in the [Channel](https://www.twilio.com/docs/chat/channels) that the Member has read. |
  | `last_consumption_timestamp` | The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp of the last [Message](https://www.twilio.com/docs/chat/rest/message-resource) read event for the Member within the [Channel](https://www.twilio.com/docs/chat/channels).. Format: date-time |
  | `role_sid` | The SID of the [Role](https://www.twilio.com/docs/chat/rest/role-resource) assigned to the member. |
  | `service_sid` | The SID of the [Service](https://www.twilio.com/docs/chat/rest/service-resource) the Member resource is associated with. |
  | `sid` | The unique string that we created to identify the Member resource. |
  | `url` | The absolute URL of the Member resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          attributes: String.t() | nil,
          channel_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          identity: String.t() | nil,
          last_consumed_message_index: integer() | nil,
          last_consumption_timestamp: String.t() | nil,
          role_sid: String.t() | nil,
          service_sid: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :attributes,
    :channel_sid,
    :date_created,
    :date_updated,
    :identity,
    :last_consumed_message_index,
    :last_consumption_timestamp,
    :role_sid,
    :service_sid,
    :sid,
    :url
  ]

  @object_name "chat.v2.service.channel.member"
  def object_name, do: @object_name

  @sid_prefix "MB"
  def sid_prefix, do: @sid_prefix
end
