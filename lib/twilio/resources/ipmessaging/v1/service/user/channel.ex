# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.IpMessaging.V1.Service.User.Channel do
  @moduledoc """
  Channel resource.

  Parent: `/Services/{ServiceSid}/Users/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `links` | Format: uri-map |
  | `status` | Values: `joined`, `invited`, `not_participating` |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          channel_sid: String.t() | nil,
          last_consumed_message_index: integer() | nil,
          links: map() | nil,
          member_sid: String.t() | nil,
          service_sid: String.t() | nil,
          status: String.t(),
          unread_messages_count: integer() | nil
        }

  defstruct [
    :account_sid,
    :channel_sid,
    :last_consumed_message_index,
    :links,
    :member_sid,
    :service_sid,
    :status,
    :unread_messages_count
  ]

  @object_name "ip_messaging.v1.service.user.user_channel"
  def object_name, do: @object_name
end
