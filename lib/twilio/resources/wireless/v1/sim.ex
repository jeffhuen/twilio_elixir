# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Wireless.V1.Sim do
  @moduledoc """
  A resource representing a Programmable Wireless SIM

  SID prefix: `DE`

  ## Sub-resources
  - `data_sessions` — `/v1/Sims/{sim_sid}/DataSessions`
  - `usage_records` — `/v1/Sims/{sim_sid}/UsageRecords`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) to which the Sim resource belongs. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `commands_callback_method` | The HTTP method we use to call `commands_callback_url`.  Can be: `POST` or `GET`. Default is `POST`.. Values: `GET`, `POST`. Format: http-method |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `commands_callback_url` | The URL we call using the `commands_callback_method` when the SIM originates a machine-to-machine [Command](https://www.twilio.com/docs/iot/wireless/api/command-resource). Your server should respond with an HTTP status code in the 200 range; any response body will be ignored.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the Sim resource was last updated specified in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format.. Format: date-time |
  | `e_id` | Deprecated. |
  | `friendly_name` | The string that you assigned to describe the Sim resource.. PII: standard |
  | `iccid` | The [ICCID](https://en.wikipedia.org/wiki/SIM_card#ICCID) associated with the SIM.. PII: standard |
  | `ip_address` | Deprecated. |
  | `links` | The URLs of related subresources.. Format: uri-map |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `rate_plan_sid` | The SID of the [RatePlan resource](https://www.twilio.com/docs/iot/wireless/api/rateplan-resource) to which the Sim resource is assigned. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `reset_status` | The connectivity reset status of the SIM. Can be: null or `resetting`. When a connectivity reset is initiated on a SIM, this property is `resetting`. After the reset completes, it is null.. Values: `resetting` |
  | `sid` | The unique string that we created to identify the Sim resource. |
  | `sms_fallback_method` | Deprecated.. Values: `GET`, `POST`. Format: http-method |
  | `sms_fallback_url` | Deprecated.. Format: uri |
  | `sms_method` | Deprecated.. Values: `GET`, `POST`. Format: http-method |
  | `sms_url` | Deprecated.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status` | The status of the Sim resource. Can be: `new`, `ready`, `active`, `deactivated`, `canceled`, `deleted`, `scheduled`, or `updating`. See [Status Values](https://www.twilio.com/docs/iot/wireless/api/sim-resource#status-values) for the description of each status.. Values: `new`, `ready`, `active`, `suspended`, `deactivated`, `canceled`, `scheduled`, `updating` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `unique_name` | An application-defined string that uniquely identifies the resource. It can be used in place of the resource's `sid` in the URL to address the resource.. PII: standard |
  | `url` | The absolute URL of the resource.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `voice_fallback_method` | Deprecated. The HTTP method we use to call `voice_fallback_url`. Can be: `GET` or `POST`. Default is `POST`.. Values: `GET`, `POST`. Format: http-method |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `voice_fallback_url` | Deprecated. The URL we call using the `voice_fallback_method` when an error occurs while retrieving or executing the TwiML requested from `voice_url`.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `voice_method` | Deprecated. The HTTP method we use to call `voice_url`. Can be: `GET` or `POST`. Default is `POST`.. Values: `GET`, `POST`. Format: http-method |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `voice_url` | Deprecated. The URL we call using the `voice_method` when the SIM-connected device makes a voice call.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          commands_callback_method: String.t() | nil,
          commands_callback_url: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          e_id: String.t() | nil,
          friendly_name: String.t() | nil,
          iccid: String.t() | nil,
          ip_address: String.t() | nil,
          links: map() | nil,
          rate_plan_sid: String.t() | nil,
          reset_status: String.t(),
          sid: String.t() | nil,
          sms_fallback_method: String.t() | nil,
          sms_fallback_url: String.t() | nil,
          sms_method: String.t() | nil,
          sms_url: String.t() | nil,
          status: String.t(),
          unique_name: String.t() | nil,
          url: String.t() | nil,
          voice_fallback_method: String.t() | nil,
          voice_fallback_url: String.t() | nil,
          voice_method: String.t() | nil,
          voice_url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :commands_callback_method,
    :commands_callback_url,
    :date_created,
    :date_updated,
    :e_id,
    :friendly_name,
    :iccid,
    :ip_address,
    :links,
    :rate_plan_sid,
    :reset_status,
    :sid,
    :sms_fallback_method,
    :sms_fallback_url,
    :sms_method,
    :sms_url,
    :status,
    :unique_name,
    :url,
    :voice_fallback_method,
    :voice_fallback_url,
    :voice_method,
    :voice_url
  ]

  @object_name "wireless.v1.sim"
  def object_name, do: @object_name

  @sid_prefix "DE"
  def sid_prefix, do: @sid_prefix
end
