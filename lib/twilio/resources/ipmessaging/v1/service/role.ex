# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.IpMessaging.V1.Service.Role do
  @moduledoc """


  SID prefix: `RL`

  Parent: `/Services/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `date_created` | Format: date-time |
  | `date_updated` | Format: date-time |
  | `type` | Values: `channel`, `deployment` |
  | `url` | Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          permissions: list() | nil,
          service_sid: String.t() | nil,
          sid: String.t() | nil,
          type: String.t(),
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :date_created,
    :date_updated,
    :friendly_name,
    :permissions,
    :service_sid,
    :sid,
    :type,
    :url
  ]

  @object_name "ip_messaging.v1.service.role"
  def object_name, do: @object_name

  @sid_prefix "RL"
  def sid_prefix, do: @sid_prefix
end
