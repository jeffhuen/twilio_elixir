# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Chat.V1.Service.Channel.Member do
  @moduledoc """
  Users joined to specific channels

  SID prefix: `MB`

  Parent: `/Services/{ServiceSid}/Channels/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/api/rest/account) that created the Member resource. |
  | `channel_sid` | The unique ID of the [Channel](https://www.twilio.com/docs/api/chat/rest/channels) for the member. |
  | `date_created` | The date and time in GMT when the resource was created specified in [RFC 2822](http://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [RFC 2822](http://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `identity` | The application-defined string that uniquely identifies the resource's [User](https://www.twilio.com/docs/api/chat/rest/users) within the [Service](https://www.twilio.com/docs/api/chat/rest/services). See [access tokens](https://www.twilio.com/docs/api/chat/guides/create-tokens) for more info.. PII: standard |
  | `last_consumed_message_index` | The index of the last [Message](https://www.twilio.com/docs/api/chat/rest/messages) in the [Channel](https://www.twilio.com/docs/api/chat/rest/channels) that the Member has read. |
  | `last_consumption_timestamp` | The ISO 8601 timestamp string that represents the date-time of the last [Message](https://www.twilio.com/docs/api/chat/rest/messages) read event for the Member within the [Channel](https://www.twilio.com/docs/api/chat/rest/channels).. Format: date-time |
  | `role_sid` | The SID of the [Role](https://www.twilio.com/docs/api/chat/rest/roles) assigned to the member. |
  | `service_sid` | The SID of the [Service](https://www.twilio.com/docs/api/chat/rest/services) the resource is associated with. |
  | `sid` | The unique string that we created to identify the Member resource. |
  | `url` | The absolute URL of the Member resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
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

  @object_name "chat.v1.service.channel.member"
  def object_name, do: @object_name

  @sid_prefix "MB"
  def sid_prefix, do: @sid_prefix
end
