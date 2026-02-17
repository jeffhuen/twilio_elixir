# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Routes.V2.Trunk do
  @moduledoc """


  SID prefix: `QQ`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The unique SID identifier of the Account. |
  | `date_created` | The date that this SIP Trunk was assigned an Inbound Processing Region, given in ISO 8601 format.. Format: date-time |
  | `date_updated` | The date that the Inbound Processing Region was updated for this SIP Trunk, given in ISO 8601 format.. Format: date-time |
  | `friendly_name` | A human readable description of the Inbound Processing Region assignments for this SIP Trunk, up to 64 characters. |
  | `sid` | A 34 character string that uniquely identifies the Inbound Processing Region assignments for this SIP Trunk. |
  | `sip_trunk_domain` | The absolute URL of the SIP Trunk |
  | `url` | The absolute URL of the resource.. Format: uri |
  | `voice_region` | The Inbound Processing Region used for this SIP Trunk for voice. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          sid: String.t() | nil,
          sip_trunk_domain: String.t() | nil,
          url: String.t() | nil,
          voice_region: String.t() | nil
        }

  defstruct [
    :account_sid,
    :date_created,
    :date_updated,
    :friendly_name,
    :sid,
    :sip_trunk_domain,
    :url,
    :voice_region
  ]

  @object_name "routes.v2.trunks"
  def object_name, do: @object_name

  @sid_prefix "QQ"
  def sid_prefix, do: @sid_prefix
end
