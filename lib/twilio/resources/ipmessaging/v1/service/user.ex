# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.IpMessaging.V1.Service.User do
  @moduledoc """
  User resource.

  SID prefix: `US`

  Parent: `/Services/{Sid}`

  ## Sub-resources
  - `user_channels` — `/v1/Services/{service_sid}/Users/{user_sid}/Channels`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `date_created` | Format: date-time |
  | `date_updated` | Format: date-time |
  | `links` | Format: uri-map |
  | `url` | Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          attributes: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          identity: String.t() | nil,
          is_notifiable: boolean() | nil,
          is_online: boolean() | nil,
          joined_channels_count: integer(),
          links: map() | nil,
          role_sid: String.t() | nil,
          service_sid: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :attributes,
    :date_created,
    :date_updated,
    :friendly_name,
    :identity,
    :is_notifiable,
    :is_online,
    :joined_channels_count,
    :links,
    :role_sid,
    :service_sid,
    :sid,
    :url
  ]

  @object_name "ip_messaging.v1.service.user"
  def object_name, do: @object_name

  @sid_prefix "US"
  def sid_prefix, do: @sid_prefix
end
