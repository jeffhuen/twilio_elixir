# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Supersim.V1.Sim.Billingperiod do
  @moduledoc """
  Billing Period for an IoT Super SIM

  SID prefix: `HB`

  Parent: `/Sims/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) the Super SIM belongs to. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `end_time` | The end time of the Billing Period specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `period_type` | The type of Billing Period. Can be `ready` or `active`.. Values: `ready`, `active` |
  | `sid` | The SID of the Billing Period. |
  | `sim_sid` | The SID of the Super SIM the Billing Period belongs to. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `start_time` | The start time of the Billing Period specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          end_time: String.t() | nil,
          period_type: String.t(),
          sid: String.t() | nil,
          sim_sid: String.t() | nil,
          start_time: String.t() | nil
        }

  defstruct [
    :account_sid,
    :date_created,
    :date_updated,
    :end_time,
    :period_type,
    :sid,
    :sim_sid,
    :start_time
  ]

  @object_name "supersim.v1.sim.billing_period"
  def object_name, do: @object_name

  @sid_prefix "HB"
  def sid_prefix, do: @sid_prefix
end
