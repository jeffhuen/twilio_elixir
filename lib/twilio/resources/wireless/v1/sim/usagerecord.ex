# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Wireless.V1.Sim.Usagerecord do
  @moduledoc """
  Usage information for SIMs

  Parent: `/Sims/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the UsageRecord resource. |
  | `commands` | An object that describes the SIM's usage of Commands during the specified period. See [Commands Usage Object](https://www.twilio.com/docs/iot/wireless/api/sim-usagerecord-resource#commands-usage-object). |
  | `data` | An object that describes the SIM's data usage during the specified period. See [Data Usage Object](https://www.twilio.com/docs/iot/wireless/api/sim-usagerecord-resource#data-usage-object). |
  | `period` | The time period for which the usage is reported. Contains `start` and `end` datetime values given as GMT in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format. |
  | `sim_sid` | The SID of the [Sim resource](https://www.twilio.com/docs/iot/wireless/api/sim-resource) that this Usage Record is for. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          commands: String.t() | nil,
          data: String.t() | nil,
          period: String.t() | nil,
          sim_sid: String.t() | nil
        }

  defstruct [:account_sid, :commands, :data, :period, :sim_sid]

  @object_name "wireless.v1.sim.usage_record"
  def object_name, do: @object_name
end
