# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Routes.V2.Sipdomain do
  @moduledoc """


  SID prefix: `QQ`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `date_created` | Format: date-time |
  | `date_updated` | Format: date-time |
  | `url` | Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          sid: String.t() | nil,
          sip_domain: String.t() | nil,
          url: String.t() | nil,
          voice_region: String.t() | nil
        }

  defstruct [
    :account_sid,
    :date_created,
    :date_updated,
    :friendly_name,
    :sid,
    :sip_domain,
    :url,
    :voice_region
  ]

  @object_name "routes.v2.sip_domain"
  def object_name, do: @object_name

  @sid_prefix "QQ"
  def sid_prefix, do: @sid_prefix
end
