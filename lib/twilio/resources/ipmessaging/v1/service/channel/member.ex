# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.IpMessaging.V1.Service.Channel.Member do
  @moduledoc """
  Member resource.

  SID prefix: `MB`

  Parent: `/Services/{ServiceSid}/Channels/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `date_created` | Format: date-time |
  | `date_updated` | Format: date-time |
  | `last_consumption_timestamp` | Format: date-time |
  | `url` | Format: uri |
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

  @object_name "ip_messaging.v1.service.channel.member"
  def object_name, do: @object_name

  @sid_prefix "MB"
  def sid_prefix, do: @sid_prefix
end
