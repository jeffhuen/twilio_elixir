# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Supersim.V1.SmsCommand do
  @moduledoc """
  Machine-to-machine SMS Commands sent to/from SIMs

  SID prefix: `HC`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the SMS Command resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `direction` | The direction of the SMS Command. Can be `to_sim` or `from_sim`. The value of `to_sim` is synonymous with the term `mobile terminated`, and `from_sim` is synonymous with the term `mobile originated`.. Values: `to_sim`, `from_sim` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `payload` | The message body of the SMS Command sent to or from the SIM. For text mode messages, this can be up to 160 characters.. PII: standard |
  | `sid` | The unique string that we created to identify the SMS Command resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `sim_sid` | The SID of the [SIM](https://www.twilio.com/docs/iot/supersim/api/sim-resource) that this SMS Command was sent to or from. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status` | The status of the SMS Command. Can be: `queued`, `sent`, `delivered`, `received` or `failed`. See the [SMS Command Status Values](https://www.twilio.com/docs/iot/supersim/api/smscommand-resource#status-values) for a description of each.. Values: `queued`, `sent`, `delivered`, `received`, `failed` |
  | `url` | The absolute URL of the SMS Command resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          direction: String.t(),
          payload: String.t() | nil,
          sid: String.t() | nil,
          sim_sid: String.t() | nil,
          status: String.t(),
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :date_created,
    :date_updated,
    :direction,
    :payload,
    :sid,
    :sim_sid,
    :status,
    :url
  ]

  @object_name "supersim.v1.sms_command"
  def object_name, do: @object_name

  @sid_prefix "HC"
  def sid_prefix, do: @sid_prefix
end
