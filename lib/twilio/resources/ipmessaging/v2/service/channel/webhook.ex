# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.IpMessaging.V2.Service.Channel.Webhook do
  @moduledoc """
  Webhook resource.

  SID prefix: `WH`

  Parent: `/Services/{ServiceSid}/Channels/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `date_created` | Format: date-time |
  | `date_updated` | Format: date-time |
  | `url` | Format: uri |
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

  @object_name "ip_messaging.v2.service.channel.channel_webhook"
  def object_name, do: @object_name

  @sid_prefix "WH"
  def sid_prefix, do: @sid_prefix
end
