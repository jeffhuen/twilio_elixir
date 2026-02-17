# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.IpMessaging.V2.Credential do
  @moduledoc """


  SID prefix: `CR`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `date_created` | Format: date-time |
  | `date_updated` | Format: date-time |
  | `type` | Values: `gcm`, `apn`, `fcm` |
  | `url` | Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          sandbox: String.t() | nil,
          sid: String.t() | nil,
          type: String.t(),
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :date_created,
    :date_updated,
    :friendly_name,
    :sandbox,
    :sid,
    :type,
    :url
  ]

  @object_name "ip_messaging.v2.credential"
  def object_name, do: @object_name

  @sid_prefix "CR"
  def sid_prefix, do: @sid_prefix
end
