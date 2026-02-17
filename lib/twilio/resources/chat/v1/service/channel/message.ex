# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Chat.V1.Service.Channel.Message do
  @moduledoc """
  Individual chat messages

  SID prefix: `IM`

  Parent: `/Services/{ServiceSid}/Channels/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/api/rest/account) that created the Message resource. |
  | `attributes` | The JSON string that stores application-specific data. **Note** If this property has been assigned a value, it's only  displayed in a FETCH action that returns a single resource; otherwise, it's null. If the attributes have not been set, `{}` is returned.. PII: sensitive |
  | `body` | The content of the message.. PII: sensitive |
  | `channel_sid` | The unique ID of the [Channel](https://www.twilio.com/docs/api/chat/rest/channels) the Message resource belongs to. |
  | `date_created` | The date and time in GMT when the resource was created specified in [RFC 2822](http://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [RFC 2822](http://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `from` | The [identity](https://www.twilio.com/docs/api/chat/guides/identity) of the message's author. The default value is `system`.. PII: standard |
  | `index` | The index of the message within the [Channel](https://www.twilio.com/docs/chat/api/channels). |
  | `service_sid` | The SID of the [Service](https://www.twilio.com/docs/api/chat/rest/services) the resource is associated with. |
  | `sid` | The unique string that we created to identify the Message resource. |
  | `to` | The SID of the [Channel](https://www.twilio.com/docs/chat/api/channels) that the message was sent to. |
  | `url` | The absolute URL of the Message resource.. Format: uri |
  | `was_edited` | Whether the message has been edited since it was created. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          attributes: String.t() | nil,
          body: String.t() | nil,
          channel_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          from: String.t() | nil,
          index: integer(),
          service_sid: String.t() | nil,
          sid: String.t() | nil,
          to: String.t() | nil,
          url: String.t() | nil,
          was_edited: boolean() | nil
        }

  defstruct [
    :account_sid,
    :attributes,
    :body,
    :channel_sid,
    :date_created,
    :date_updated,
    :from,
    :index,
    :service_sid,
    :sid,
    :to,
    :url,
    :was_edited
  ]

  @object_name "chat.v1.service.channel.message"
  def object_name, do: @object_name

  @sid_prefix "IM"
  def sid_prefix, do: @sid_prefix
end
