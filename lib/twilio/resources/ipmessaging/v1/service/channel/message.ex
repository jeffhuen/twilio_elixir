# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.IpMessaging.V1.Service.Channel.Message do
  @moduledoc """
  Message resource.

  SID prefix: `IM`

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

  @object_name "ip_messaging.v1.service.channel.message"
  def object_name, do: @object_name

  @sid_prefix "IM"
  def sid_prefix, do: @sid_prefix
end
