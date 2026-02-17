# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Verify.V2.Service do
  @moduledoc """


  SID prefix: `VA`

  ## Sub-resources
  - `access_tokens` — `/v2/Services/{service_sid}/AccessTokens`
  - `entities` — `/v2/Services/{service_sid}/Entities`
  - `messaging_configurations` — `/v2/Services/{service_sid}/MessagingConfigurations`
  - `rate_limits` — `/v2/Services/{service_sid}/RateLimits`
  - `verification_checks` — `/v2/Services/{service_sid}/VerificationCheck`
  - `verifications` — `/v2/Services/{service_sid}/Verifications`
  - `webhooks` — `/v2/Services/{service_sid}/Webhooks`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Service resource. |
  | `code_length` | The length of the verification code to generate. |
  | `custom_code_enabled` | Whether to allow sending verifications with a custom code instead of a randomly generated one. |
  | `date_created` | The date and time in GMT when the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `do_not_share_warning_enabled` | Whether to add a security warning at the end of an SMS verification body. Disabled by default and applies only to SMS. Example SMS body: `Your AppName verification code is: 1234. Don’t share this code with anyone; our employees will never ask for the code` |
  | `dtmf_input_required` | Whether to ask the user to press a number before delivering the verify code in a phone call. |
  | `friendly_name` | The name that appears in the body of your verification messages. It can be up to 30 characters long and can include letters, numbers, spaces, dashes, underscores. Phone numbers, special characters or links are NOT allowed. It cannot contain more than 4 (consecutive or non-consecutive) digits. **This value should not contain PII.** |
  | `links` | The URLs of related resources.. Format: uri-map |
  | `lookup_enabled` | Whether to perform a lookup with each verification started and return info about the phone number. |
  | `psd2_enabled` | Whether to pass PSD2 transaction parameters when starting a verification. |
  | `push` | Configurations for the Push factors (channel) created under this Service. |
  | `sid` | The unique string that we created to identify the Service resource. |
  | `skip_sms_to_landlines` | Whether to skip sending SMS verifications to landlines. Requires `lookup_enabled`. |
  | `totp` | Configurations for the TOTP factors (channel) created under this Service. |
  | `tts_name` | The name of an alternative text-to-speech service to use in phone calls. Applies only to TTS languages. |
  | `url` | The absolute URL of the resource.. Format: uri |
  | `verify_event_subscription_enabled` | Whether to allow verifications from the service to reach the stream-events sinks if configured |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          code_length: integer(),
          custom_code_enabled: boolean() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          default_template_sid: String.t() | nil,
          do_not_share_warning_enabled: boolean() | nil,
          dtmf_input_required: boolean() | nil,
          friendly_name: String.t() | nil,
          links: map() | nil,
          lookup_enabled: boolean() | nil,
          passkeys: String.t() | nil,
          psd2_enabled: boolean() | nil,
          push: String.t() | nil,
          sid: String.t() | nil,
          skip_sms_to_landlines: boolean() | nil,
          totp: String.t() | nil,
          tts_name: String.t() | nil,
          url: String.t() | nil,
          verify_event_subscription_enabled: boolean() | nil,
          whatsapp: String.t() | nil
        }

  defstruct [
    :account_sid,
    :code_length,
    :custom_code_enabled,
    :date_created,
    :date_updated,
    :default_template_sid,
    :do_not_share_warning_enabled,
    :dtmf_input_required,
    :friendly_name,
    :links,
    :lookup_enabled,
    :passkeys,
    :psd2_enabled,
    :push,
    :sid,
    :skip_sms_to_landlines,
    :totp,
    :tts_name,
    :url,
    :verify_event_subscription_enabled,
    :whatsapp
  ]

  @object_name "verify.v2.service"
  def object_name, do: @object_name

  @sid_prefix "VA"
  def sid_prefix, do: @sid_prefix
end
