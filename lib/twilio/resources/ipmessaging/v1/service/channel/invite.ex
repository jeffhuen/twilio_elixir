# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.IpMessaging.V1.Service.Channel.Invite do
  @moduledoc """
  Invite resource.

  SID prefix: `IN`

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
          created_by: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          identity: String.t() | nil,
          role_sid: String.t() | nil,
          service_sid: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :channel_sid,
    :created_by,
    :date_created,
    :date_updated,
    :identity,
    :role_sid,
    :service_sid,
    :sid,
    :url
  ]

  @object_name "ip_messaging.v1.service.channel.invite"
  def object_name, do: @object_name

  @sid_prefix "IN"
  def sid_prefix, do: @sid_prefix
end
