# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Supersim.V1.Usagerecord do
  @moduledoc """
  Usage information for Sim resources

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that incurred the usage. |
  | `billed_unit` | The currency in which the billed amounts are measured, specified in the 3 letter ISO 4127 format (e.g. `USD`, `EUR`, `JPY`). This can be null when data_toal_billed is 0 and we do not yet have billing information for the corresponding data usage. Refer to [Data Usage Processing](https://www.twilio.com/docs/iot/supersim/api/usage-record-resource#data-usage-processing) for more details.. Format: currency |
  | `data_download` | Total data downloaded in bytes, aggregated by the query parameters.. Format: int64 |
  | `data_total` | Total of data_upload and data_download.. Format: int64 |
  | `data_total_billed` | Total amount in the `billed_unit` that was charged for the data uploaded or downloaded. Will return 0 for usage prior to February 1, 2022. Value may be 0 despite `data_total` being greater than 0 if the data usage is still being processed by Twilio's billing system. Refer to [Data Usage Processing](https://www.twilio.com/docs/iot/supersim/api/usage-record-resource#data-usage-processing) for more details. |
  | `data_upload` | Total data uploaded in bytes, aggregated by the query parameters.. Format: int64 |
  | `fleet_sid` | SID of the Fleet resource the usage occurred on. Value will only be present when either a value for the `Fleet` query parameter is provided or when UsageRecords are grouped by `fleet`. Otherwise, the value will be `null`. |
  | `iso_country` | Alpha-2 ISO Country Code that the usage occurred in. Value will only be present when either a value for the `IsoCountry` query parameter is provided or when UsageRecords are grouped by `isoCountry`. Otherwise, the value will be `null`.. Format: iso-country-code |
  | `network_sid` | SID of the Network resource the usage occurred on. Value will only be present when either a value for the `Network` query parameter is provided or when UsageRecords are grouped by `network`. Otherwise, the value will be `null`. |
  | `period` | The time period for which the usage is reported. The period is represented as a pair of `start_time` and `end_time` timestamps specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format. |
  | `sim_sid` | SID of a Sim resource to which the UsageRecord belongs. Value will only be present when either a value for the `Sim` query parameter is provided or when UsageRecords are grouped by `sim`. Otherwise, the value will be `null`. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          billed_unit: String.t() | nil,
          data_download: integer() | nil,
          data_total: integer() | nil,
          data_total_billed: float() | nil,
          data_upload: integer() | nil,
          fleet_sid: String.t() | nil,
          iso_country: String.t() | nil,
          network_sid: String.t() | nil,
          period: String.t() | nil,
          sim_sid: String.t() | nil
        }

  defstruct [
    :account_sid,
    :billed_unit,
    :data_download,
    :data_total,
    :data_total_billed,
    :data_upload,
    :fleet_sid,
    :iso_country,
    :network_sid,
    :period,
    :sim_sid
  ]

  @object_name "supersim.v1.usage_record"
  def object_name, do: @object_name
end
