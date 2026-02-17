# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.IpMessaging.V1.Service.Channel do
  @moduledoc """
  Channel resource.

  SID prefix: `CH`

  Parent: `/Services/{Sid}`

  ## Sub-resources
  - `invites` — `/v1/Services/{service_sid}/Channels/{channel_sid}/Invites`
  - `members` — `/v1/Services/{service_sid}/Channels/{channel_sid}/Members`
  - `messages` — `/v1/Services/{service_sid}/Channels/{channel_sid}/Messages`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `date_created` | Format: date-time |
  | `date_updated` | Format: date-time |
  | `links` | Format: uri-map |
  | `type` | Values: `public`, `private` |
  | `url` | Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          attributes: String.t() | nil,
          created_by: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          links: map() | nil,
          members_count: integer(),
          messages_count: integer(),
          service_sid: String.t() | nil,
          sid: String.t() | nil,
          type: String.t(),
          unique_name: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :attributes,
    :created_by,
    :date_created,
    :date_updated,
    :friendly_name,
    :links,
    :members_count,
    :messages_count,
    :service_sid,
    :sid,
    :type,
    :unique_name,
    :url
  ]

  @object_name "ip_messaging.v1.service.channel"
  def object_name, do: @object_name

  @sid_prefix "CH"
  def sid_prefix, do: @sid_prefix
end
