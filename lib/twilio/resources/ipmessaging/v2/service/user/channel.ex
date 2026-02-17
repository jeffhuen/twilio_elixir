# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.IpMessaging.V2.Service.User.Channel do
  @moduledoc """
  Channel resource.

  Parent: `/Services/{ServiceSid}/Users/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `links` | Format: uri-map |
  | `notification_level` | Values: `default`, `muted` |
  | `status` | Values: `joined`, `invited`, `not_participating` |
  | `url` | Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          channel_sid: String.t() | nil,
          last_consumed_message_index: integer() | nil,
          links: map() | nil,
          member_sid: String.t() | nil,
          notification_level: String.t(),
          service_sid: String.t() | nil,
          status: String.t(),
          unread_messages_count: integer() | nil,
          url: String.t() | nil,
          user_sid: String.t() | nil
        }

  defstruct [
    :account_sid,
    :channel_sid,
    :last_consumed_message_index,
    :links,
    :member_sid,
    :notification_level,
    :service_sid,
    :status,
    :unread_messages_count,
    :url,
    :user_sid
  ]

  @object_name "ip_messaging.v2.service.user.user_channel"
  def object_name, do: @object_name
end
