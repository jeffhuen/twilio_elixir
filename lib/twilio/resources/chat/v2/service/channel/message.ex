# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Chat.V2.Service.Channel.Message do
  @moduledoc """
  Individual chat messages

  SID prefix: `IM`

  Parent: `/Services/{ServiceSid}/Channels/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Message resource. |
  | `attributes` | The JSON string that stores application-specific data. If attributes have not been set, `{}` is returned.. PII: sensitive |
  | `body` | The content of the message.. PII: sensitive |
  | `channel_sid` | The SID of the [Channel](https://www.twilio.com/docs/chat/channels) the Message resource belongs to. |
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `from` | The [Identity](https://www.twilio.com/docs/chat/identity) of the message's author. The default value is `system`.. PII: standard |
  | `index` | The index of the message within the [Channel](https://www.twilio.com/docs/chat/channels). Indices may skip numbers, but will always be in order of when the message was received. |
  | `last_updated_by` | The [Identity](https://www.twilio.com/docs/chat/identity) of the User who last updated the Message, if applicable.. PII: standard |
  | `media` | An object that describes the Message's media, if the message contains media. The object contains these fields: `content_type` with the MIME type of the media, `filename` with the name of the media, `sid` with the SID of the Media resource, and `size` with the media object's file size in bytes. If the Message has no media, this value is `null`.. PII: standard |
  | `service_sid` | The SID of the [Service](https://www.twilio.com/docs/chat/rest/service-resource) the Message resource is associated with. |
  | `sid` | The unique string that we created to identify the Message resource. |
  | `to` | The SID of the [Channel](https://www.twilio.com/docs/chat/channels) that the message was sent to. |
  | `type` | The Message type. Can be: `text` or `media`. |
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
          last_updated_by: String.t() | nil,
          media: String.t() | nil,
          service_sid: String.t() | nil,
          sid: String.t() | nil,
          to: String.t() | nil,
          type: String.t() | nil,
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
    :last_updated_by,
    :media,
    :service_sid,
    :sid,
    :to,
    :type,
    :url,
    :was_edited
  ]

  @object_name "chat.v2.service.channel.message"
  def object_name, do: @object_name

  @sid_prefix "IM"
  def sid_prefix, do: @sid_prefix
end
