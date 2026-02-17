# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Wireless.V1.Usagerecord do
  @moduledoc """
  Aggregated Usage information for all SIMs on an Account

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the AccountUsageRecord resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `commands` | An object that describes the aggregated Commands usage for all SIMs during the specified period. See [Commands Usage Object](https://www.twilio.com/docs/iot/wireless/api/account-usagerecord-resource#commands-usage-object). |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `data` | An object that describes the aggregated Data usage for all SIMs over the period. See [Data Usage Object](https://www.twilio.com/docs/iot/wireless/api/account-usagerecord-resource#data-usage-object). |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `period` | The time period for which usage is reported. Contains `start` and `end` properties that describe the period using GMT date-time values specified in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          commands: String.t() | nil,
          data: String.t() | nil,
          period: String.t() | nil
        }

  defstruct [:account_sid, :commands, :data, :period]

  @object_name "wireless.v1.account_usage_record"
  def object_name, do: @object_name
end
