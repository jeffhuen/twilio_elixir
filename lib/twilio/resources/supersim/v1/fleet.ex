# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Supersim.V1.Fleet do
  @moduledoc """
  Configure shared settings inherited by all Super SIMs assigned to the Fleet

  SID prefix: `HF`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Fleet resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `data_enabled` | Defines whether SIMs in the Fleet are capable of using 2G/3G/4G/LTE/CAT-M data connectivity. Defaults to `true`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `data_limit` | The total data usage (download and upload combined) in Megabytes that each Super SIM assigned to the Fleet can consume during a billing period (normally one month). Value must be between 1MB (1) and 2TB (2,000,000). Defaults to 250MB. |
  | `data_metering` | The model by which a SIMs usage is metered and billed. Defaults to `payg`.. Values: `payg` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ip_commands_method` | A string representing the HTTP method to use when making a request to `ip_commands_url`. Can be one of `POST` or `GET`. Defaults to `POST`.. Values: `GET`, `POST`. Format: http-method |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ip_commands_url` | The URL that will receive a webhook when a Super SIM in the Fleet is used to send an IP Command from your device to a special IP address. Your server should respond with an HTTP status code in the 200 range; any response body will be ignored.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `network_access_profile_sid` | The SID of the Network Access Profile that controls which cellular networks the Fleet's SIMs can connect to. |
  | `sid` | The unique string that we created to identify the Fleet resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `sms_commands_enabled` | Defines whether SIMs in the Fleet are capable of sending and receiving machine-to-machine SMS via Commands. Defaults to `false`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `sms_commands_method` | A string representing the HTTP method to use when making a request to `sms_commands_url`. Can be one of `POST` or `GET`. Defaults to `POST`.. Values: `GET`, `POST`. Format: http-method |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `sms_commands_url` | The URL that will receive a webhook when a Super SIM in the Fleet is used to send an SMS from your device to the SMS Commands number. Your server should respond with an HTTP status code in the 200 range; any response body will be ignored.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `unique_name` | An application-defined string that uniquely identifies the resource. It can be used in place of the resource's `sid` in the URL to address the resource. |
  | `url` | The absolute URL of the Fleet resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          data_enabled: boolean() | nil,
          data_limit: integer(),
          data_metering: String.t(),
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          ip_commands_method: String.t() | nil,
          ip_commands_url: String.t() | nil,
          network_access_profile_sid: String.t() | nil,
          sid: String.t() | nil,
          sms_commands_enabled: boolean() | nil,
          sms_commands_method: String.t() | nil,
          sms_commands_url: String.t() | nil,
          unique_name: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :data_enabled,
    :data_limit,
    :data_metering,
    :date_created,
    :date_updated,
    :ip_commands_method,
    :ip_commands_url,
    :network_access_profile_sid,
    :sid,
    :sms_commands_enabled,
    :sms_commands_method,
    :sms_commands_url,
    :unique_name,
    :url
  ]

  @object_name "supersim.v1.fleet"
  def object_name, do: @object_name

  @sid_prefix "HF"
  def sid_prefix, do: @sid_prefix
end
