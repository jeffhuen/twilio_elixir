# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Preview.Wireless.Rateplan do
  @moduledoc """


  SID prefix: `WP`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `date_created` | Format: date-time |
  | `date_updated` | Format: date-time |
  | `url` | Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          data_enabled: boolean() | nil,
          data_limit: integer(),
          data_metering: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          international_roaming: list() | nil,
          messaging_enabled: boolean() | nil,
          national_roaming_enabled: boolean() | nil,
          sid: String.t() | nil,
          unique_name: String.t() | nil,
          url: String.t() | nil,
          voice_enabled: boolean() | nil
        }

  defstruct [
    :account_sid,
    :data_enabled,
    :data_limit,
    :data_metering,
    :date_created,
    :date_updated,
    :friendly_name,
    :international_roaming,
    :messaging_enabled,
    :national_roaming_enabled,
    :sid,
    :unique_name,
    :url,
    :voice_enabled
  ]

  @object_name "preview.wireless.rate_plan"
  def object_name, do: @object_name

  @sid_prefix "WP"
  def sid_prefix, do: @sid_prefix
end
