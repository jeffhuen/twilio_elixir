# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Chat.V2.Service.Channel.Webhook do
  @moduledoc """
  Webhooks for specific channels

  SID prefix: `WH`

  Parent: `/Services/{ServiceSid}/Channels/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Channel Webhook resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `channel_sid` | The SID of the [Channel](https://www.twilio.com/docs/chat/channels) the Channel Webhook resource belongs to. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `configuration` | The JSON string that describes how the channel webhook is configured. The configuration object contains the `url`, `method`, `filters`, and `retry_count` values that are configured by the create and update actions. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `service_sid` | The SID of the [Service](https://www.twilio.com/docs/chat/rest/service-resource) the Channel Webhook resource is associated with. |
  | `sid` | The unique string that we created to identify the Channel Webhook resource. |
  | `type` | The type of webhook. Can be: `webhook`, `studio`, or `trigger`. |
  | `url` | The absolute URL of the Channel Webhook resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          channel_sid: String.t() | nil,
          configuration: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          service_sid: String.t() | nil,
          sid: String.t() | nil,
          type: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :channel_sid,
    :configuration,
    :date_created,
    :date_updated,
    :service_sid,
    :sid,
    :type,
    :url
  ]

  @object_name "chat.v2.service.channel.channel_webhook"
  def object_name, do: @object_name

  @sid_prefix "WH"
  def sid_prefix, do: @sid_prefix
end
