# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Trunking.V1.Trunk.Phonenumber do
  @moduledoc """
  Phone numbers associated with trunks

  SID prefix: `PN`

  Parent: `/Trunks/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the PhoneNumber resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `address_requirements` | Whether the phone number requires an [Address](https://www.twilio.com/docs/usage/api/address) registered with Twilio and, if so, what type. Can be: `none`, `any`, `local`, or `foreign`.. Values: `none`, `any`, `local`, `foreign` |
  | `api_version` | The API version used to start a new TwiML session. |
  | `beta` | Whether the phone number is new to the Twilio platform. Can be: `true` or `false`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `capabilities` | The set of Boolean properties that indicate whether a phone number can receive calls or messages.  Capabilities are  `Voice`, `SMS`, and `MMS` and each capability can be: `true` or `false`.. Format: phone-number-capabilities |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `friendly_name` | The string that you assigned to describe the resource.. PII: standard |
  | `links` | The URLs of related resources.. Format: uri-map |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `phone_number` | The phone number in [E.164](https://www.twilio.com/docs/glossary/what-e164) format, which consists of a + followed by the country code and subscriber number.. Format: phone-number |
  | `sid` | The unique string that we created to identify the PhoneNumber resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `sms_application_sid` | The SID of the application that handles SMS messages sent to the phone number. If an `sms_application_sid` is present, we ignore all `sms_*_url` values and use those of the application. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `sms_fallback_method` | The HTTP method we use to call `sms_fallback_url`. Can be: `GET` or `POST`.. Values: `GET`, `POST`. Format: http-method |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `sms_fallback_url` | The URL that we call using the `sms_fallback_method` when an error occurs while retrieving or executing the TwiML from `sms_url`.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `sms_method` | The HTTP method we use to call `sms_url`. Can be: `GET` or `POST`.. Values: `GET`, `POST`. Format: http-method |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `sms_url` | The URL we call using the `sms_method` when the phone number receives an incoming SMS message.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status_callback` | The URL we call using the `status_callback_method` to send status information to your application.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status_callback_method` | The HTTP method we use to call `status_callback`. Can be: `GET` or `POST`.. Values: `GET`, `POST`. Format: http-method |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `trunk_sid` | The SID of the Trunk that handles calls to the phone number. If a `trunk_sid` is present, we ignore all of the voice URLs and voice applications and use those set on the Trunk. Setting a `trunk_sid` will automatically delete your `voice_application_sid` and vice versa. |
  | `url` | The absolute URL of the resource.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `voice_application_sid` | The SID of the application that handles calls to the phone number. If a `voice_application_sid` is present, we ignore all of the voice URLs and use those set on the application. Setting a `voice_application_sid` will automatically delete your `trunk_sid` and vice versa. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `voice_caller_id_lookup` | Whether we look up the caller's caller-ID name from the CNAM database ($0.01 per look up). Can be: `true` or `false`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `voice_fallback_method` | The HTTP method that we use to call `voice_fallback_url`. Can be: `GET` or `POST`.. Values: `GET`, `POST`. Format: http-method |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `voice_fallback_url` | The URL that we call using the `voice_fallback_method` when an error occurs retrieving or executing the TwiML requested by `url`.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `voice_method` | The HTTP method we use to call `voice_url`. Can be: `GET` or `POST`.. Values: `GET`, `POST`. Format: http-method |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `voice_url` | The URL we call using the `voice_method` when the phone number receives a call. The `voice_url` is not be used if a `voice_application_sid` or a `trunk_sid` is set.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          address_requirements: String.t(),
          api_version: String.t() | nil,
          beta: boolean() | nil,
          capabilities: map() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          links: map() | nil,
          phone_number: String.t() | nil,
          sid: String.t() | nil,
          sms_application_sid: String.t() | nil,
          sms_fallback_method: String.t() | nil,
          sms_fallback_url: String.t() | nil,
          sms_method: String.t() | nil,
          sms_url: String.t() | nil,
          status_callback: String.t() | nil,
          status_callback_method: String.t() | nil,
          trunk_sid: String.t() | nil,
          url: String.t() | nil,
          voice_application_sid: String.t() | nil,
          voice_caller_id_lookup: boolean() | nil,
          voice_fallback_method: String.t() | nil,
          voice_fallback_url: String.t() | nil,
          voice_method: String.t() | nil,
          voice_url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :address_requirements,
    :api_version,
    :beta,
    :capabilities,
    :date_created,
    :date_updated,
    :friendly_name,
    :links,
    :phone_number,
    :sid,
    :sms_application_sid,
    :sms_fallback_method,
    :sms_fallback_url,
    :sms_method,
    :sms_url,
    :status_callback,
    :status_callback_method,
    :trunk_sid,
    :url,
    :voice_application_sid,
    :voice_caller_id_lookup,
    :voice_fallback_method,
    :voice_fallback_url,
    :voice_method,
    :voice_url
  ]

  @object_name "trunking.v1.trunk.phone_number"
  def object_name, do: @object_name

  @sid_prefix "PN"
  def sid_prefix, do: @sid_prefix
end
