# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Messaging.V1.Service.Channelsender do
  @moduledoc """
  A Messaging Service resource to read, fetch all Channel Senders associated with a Messaging Service.

  SID prefix: `XE`

  Parent: `/Services/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the ChannelSender resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `country_code` | The 2-character [ISO Country Code](https://www.iso.org/iso-3166-country-codes.html) of the number. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `messaging_service_sid` | The SID of the [Service](https://www.twilio.com/docs/messaging/services) the resource is associated with. |
  | `sender` | The unique string that identifies the sender e.g whatsapp:+123456XXXX. |
  | `sender_type` | A string value that identifies the sender type e.g WhatsApp, Messenger. |
  | `sid` | The unique string that we created to identify the ChannelSender resource. |
  | `url` | The absolute URL of the ChannelSender resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          country_code: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          messaging_service_sid: String.t() | nil,
          sender: String.t() | nil,
          sender_type: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :country_code,
    :date_created,
    :date_updated,
    :messaging_service_sid,
    :sender,
    :sender_type,
    :sid,
    :url
  ]

  @object_name "messaging.v1.service.channel_sender"
  def object_name, do: @object_name

  @sid_prefix "XE"
  def sid_prefix, do: @sid_prefix
end
