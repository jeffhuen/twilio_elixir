# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Wireless.V1.Rateplan do
  @moduledoc """
  Capabilities and restrictions for SIMs

  SID prefix: `WP`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the RatePlan resource. |
  | `data_enabled` | Whether SIMs can use GPRS/3G/4G/LTE data connectivity. |
  | `data_limit` | The total data usage (download and upload combined) in Megabytes that the Network allows during one month on the home network (T-Mobile USA). The metering period begins the day of activation and ends on the same day in the following month. Can be up to 2TB. |
  | `data_metering` | The model used to meter data usage. Can be: `payg` and `quota-1`, `quota-10`, and `quota-50`. Learn more about the available [data metering models](https://www.twilio.com/docs/iot/wireless/api/rateplan-resource#payg-vs-quota-data-plans). |
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format.. Format: date-time |
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format.. Format: date-time |
  | `friendly_name` | The string that you assigned to describe the resource. |
  | `international_roaming` | The list of services that SIMs capable of using GPRS/3G/4G/LTE data connectivity can use outside of the United States. Can contain: `data` and `messaging`. |
  | `international_roaming_data_limit` | The total data usage (download and upload combined) in Megabytes that the Network allows during one month when roaming outside the United States. Can be up to 2TB. |
  | `messaging_enabled` | Whether SIMs can make, send, and receive SMS using [Commands](https://www.twilio.com/docs/iot/wireless/api/command-resource). |
  | `national_roaming_data_limit` | The total data usage (download and upload combined) in Megabytes that the Network allows during one month on non-home networks in the United States. The metering period begins the day of activation and ends on the same day in the following month. Can be up to 2TB. |
  | `national_roaming_enabled` | Whether SIMs can roam on networks other than the home network (T-Mobile USA) in the United States. See [national roaming](https://www.twilio.com/docs/iot/wireless/api/rateplan-resource#national-roaming). |
  | `sid` | The unique string that we created to identify the RatePlan resource. |
  | `unique_name` | An application-defined string that uniquely identifies the resource. It can be used in place of the resource's `sid` in the URL to address the resource. |
  | `url` | The absolute URL of the resource.. Format: uri |
  | `voice_enabled` | Deprecated. Whether SIMs can make and receive voice calls. |
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
          international_roaming_data_limit: integer(),
          messaging_enabled: boolean() | nil,
          national_roaming_data_limit: integer(),
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
    :international_roaming_data_limit,
    :messaging_enabled,
    :national_roaming_data_limit,
    :national_roaming_enabled,
    :sid,
    :unique_name,
    :url,
    :voice_enabled
  ]

  @object_name "wireless.v1.rate_plan"
  def object_name, do: @object_name

  @sid_prefix "WP"
  def sid_prefix, do: @sid_prefix
end
