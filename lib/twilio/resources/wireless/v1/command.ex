# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Wireless.V1.Command do
  @moduledoc """
  Machine-to-machine commands sent to/from devices

  SID prefix: `DC`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Command resource. |
  | `command` | The message being sent to or from the SIM. For text mode messages, this can be up to 160 characters. For binary mode messages, this is a series of up to 140 bytes of data encoded using base64.. PII: standard |
  | `command_mode` | The mode used to send the SMS message. Can be: `text` or `binary`. The default SMS mode is `text`.. Values: `text`, `binary` |
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format.. Format: date-time |
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format.. Format: date-time |
  | `delivery_receipt_requested` | Whether to request a delivery receipt. |
  | `direction` | The direction of the Command. Can be `to_sim` or `from_sim`. The value of `to_sim` is synonymous with the term `mobile terminated`, and `from_sim` is synonymous with the term `mobile originated`.. Values: `from_sim`, `to_sim` |
  | `sid` | The unique string that we created to identify the Command resource. |
  | `sim_sid` | The SID of the [Sim resource](https://www.twilio.com/docs/iot/wireless/api/sim-resource) that the Command was sent to or from. |
  | `status` | The status of the Command. Can be: `queued`, `sent`, `delivered`, `received`, or `failed`. See [Status Values](https://www.twilio.com/docs/iot/wireless/api/command-resource#status-values) for a description of each state.. Values: `queued`, `sent`, `delivered`, `received`, `failed` |
  | `transport` | The type of transport used. Can be: `sms` or `ip`.. Values: `sms`, `ip` |
  | `url` | The absolute URL of the resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          command: String.t() | nil,
          command_mode: String.t(),
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          delivery_receipt_requested: boolean() | nil,
          direction: String.t(),
          sid: String.t() | nil,
          sim_sid: String.t() | nil,
          status: String.t(),
          transport: String.t(),
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :command,
    :command_mode,
    :date_created,
    :date_updated,
    :delivery_receipt_requested,
    :direction,
    :sid,
    :sim_sid,
    :status,
    :transport,
    :url
  ]

  @object_name "wireless.v1.command"
  def object_name, do: @object_name

  @sid_prefix "DC"
  def sid_prefix, do: @sid_prefix
end
