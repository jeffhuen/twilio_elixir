# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Api.V2010.Usage.Trigger do
  @moduledoc """
  Webhooks that notify you of usage thresholds

  SID prefix: `UT`

  Parent: `/Accounts/{AccountSid}/Usage.json`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that the trigger monitors. |
  | `api_version` | The API version used to create the resource. |
  | `callback_method` | The HTTP method we use to call `callback_url`. Can be: `GET` or `POST`.. Values: `GET`, `POST`. Format: http-method |
  | `callback_url` | The URL we call using the `callback_method` when the trigger fires.. Format: uri. PII: sensitive |
  | `current_value` | The current value of the field the trigger is watching. |
  | `date_created` | The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  | `date_fired` | The date and time in GMT that the trigger was last fired specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  | `date_updated` | The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  | `friendly_name` | The string that you assigned to describe the trigger. |
  | `recurring` | The frequency of a recurring UsageTrigger.  Can be: `daily`, `monthly`, or `yearly` for recurring triggers or empty for non-recurring triggers. A trigger will only fire once during each period. Recurring times are in GMT.. Values: `daily`, `monthly`, `yearly`, `alltime` |
  | `sid` | The unique string that that we created to identify the UsageTrigger resource. |
  | `trigger_by` | The field in the [UsageRecord](https://www.twilio.com/docs/usage/api/usage-record) resource that fires the trigger.  Can be: `count`, `usage`, or `price`, as described in the [UsageRecords documentation](https://www.twilio.com/docs/usage/api/usage-record#usage-count-price).. Values: `count`, `usage`, `price` |
  | `trigger_value` | The value at which the trigger will fire.  Must be a positive, numeric value. |
  | `uri` | The URI of the resource, relative to `https://api.twilio.com`. |
  | `usage_category` | The usage category the trigger watches. Must be one of the supported [usage categories](https://www.twilio.com/docs/usage/api/usage-record#usage-categories). |
  | `usage_record_uri` | The URI of the [UsageRecord](https://www.twilio.com/docs/usage/api/usage-record) resource this trigger watches, relative to `https://api.twilio.com`. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          api_version: String.t() | nil,
          callback_method: String.t() | nil,
          callback_url: String.t() | nil,
          current_value: String.t() | nil,
          date_created: String.t() | nil,
          date_fired: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          recurring: String.t(),
          sid: String.t() | nil,
          trigger_by: String.t(),
          trigger_value: String.t() | nil,
          uri: String.t() | nil,
          usage_category: String.t() | nil,
          usage_record_uri: String.t() | nil
        }

  defstruct [
    :account_sid,
    :api_version,
    :callback_method,
    :callback_url,
    :current_value,
    :date_created,
    :date_fired,
    :date_updated,
    :friendly_name,
    :recurring,
    :sid,
    :trigger_by,
    :trigger_value,
    :uri,
    :usage_category,
    :usage_record_uri
  ]

  @object_name "api.v2010.account.usage.usage_trigger"
  def object_name, do: @object_name

  @sid_prefix "UT"
  def sid_prefix, do: @sid_prefix
end
