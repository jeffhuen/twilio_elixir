# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Api.V2010.Incomingphonenumber.Tollfree do
  @moduledoc """
  Incoming toll free phone numbers on a Twilio account/project

  SID prefix: `PN`

  Parent: `/Accounts/{AccountSid}/IncomingPhoneNumbers.json`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `address_requirements` | Whether the phone number requires an [Address](https://www.twilio.com/docs/usage/api/address) registered with Twilio. Can be: `none`, `any`, `local`, or `foreign`.. Values: `none`, `any`, `local`, `foreign` |
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `sms_fallback_url` | The URL that we call when an error occurs while retrieving or executing the TwiML from `sms_url`.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `emergency_status` | The parameter displays if emergency calling is enabled for this number. Active numbers may place emergency calls by dialing valid emergency numbers for the country.. Values: `Active`, `Inactive` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `voice_fallback_method` | The HTTP method we use to call `voice_fallback_url`. Can be: `GET` or `POST`.. Values: `GET`, `POST`. Format: http-method |
  | `beta` | Whether the phone number is new to the Twilio platform. Can be: `true` or `false`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status_callback_method` | The HTTP method we use to call `status_callback`. Can be: `GET` or `POST`.. Values: `GET`, `POST`. Format: http-method |
  | `api_version` | The API version used to start a new TwiML session. |
  | `sms_url` | The URL we call when the phone number receives an incoming SMS message.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `phone_number` | The phone number in [E.164](https://www.twilio.com/docs/glossary/what-e164) format, which consists of a + followed by the country code and subscriber number.. Format: phone-number |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `sms_method` | The HTTP method we use to call `sms_url`. Can be: `GET` or `POST`.. Values: `GET`, `POST`. Format: http-method |
  | `friendly_name` | The string that you assigned to describe the resource.. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `sms_fallback_method` | The HTTP method we use to call `sms_fallback_url`. Can be: `GET` or `POST`.. Values: `GET`, `POST`. Format: http-method |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `capabilities` | The set of Boolean properties that indicate whether a phone number can receive calls or messages.  Capabilities are  `Voice`, `SMS`, and `MMS` and each capability can be: `true` or `false`.. Format: phone-number-capabilities |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `voice_fallback_url` | The URL that we call when an error occurs retrieving or executing the TwiML requested by `url`.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `identity_sid` | The SID of the Identity resource that we associate with the phone number. Some regions require an Identity to meet local regulations. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `bundle_sid` | The SID of the Bundle resource that you associate with the phone number. Some regions require a Bundle to meet local Regulations. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `emergency_address_status` | The status of address registration with emergency services. A registered emergency address will be used during handling of emergency calls from this number.. Values: `registered`, `unregistered`, `pending-registration`, `registration-failure`, `pending-unregistration`, `unregistration-failure` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `sms_application_sid` | The SID of the application that handles SMS messages sent to the phone number. If an `sms_application_sid` is present, we ignore all `sms_*_url` values and use those of the application. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `voice_application_sid` | The SID of the application that handles calls to the phone number. If a `voice_application_sid` is present, we ignore all of the voice urls and use those set on the application. Setting a `voice_application_sid` will automatically delete your `trunk_sid` and vice versa. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `trunk_sid` | The SID of the Trunk that handles calls to the phone number. If a `trunk_sid` is present, we ignore all of the voice urls and voice applications and use those set on the Trunk. Setting a `trunk_sid` will automatically delete your `voice_application_sid` and vice versa. |
  | `address_sid` | The SID of the Address resource associated with the phone number. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `voice_caller_id_lookup` | Whether we look up the caller's caller-ID name from the CNAM database ($0.01 per look up). Can be: `true` or `false`. |
  | `voice_receive_mode` | Values: `voice`, `fax` |
  | `sid` | The unique string that that we created to identify the resource. |
  | `uri` | The URI of the resource, relative to `https://api.twilio.com`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `emergency_address_sid` | The SID of the emergency address configuration that we use for emergency calling from this phone number. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `origin` | The phone number's origin. `twilio` identifies Twilio-owned phone numbers and `hosted` identifies hosted phone numbers. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status_callback` | The URL we call using the `status_callback_method` to send status information to your application.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `voice_method` | The HTTP method we use to call `voice_url`. Can be: `GET` or `POST`.. Values: `GET`, `POST`. Format: http-method |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `voice_url` | The URL we call when the phone number receives a call. The `voice_url` will not be used if a `voice_application_sid` or a `trunk_sid` is set.. Format: uri |
  """

  @type t :: %__MODULE__{
          address_requirements: String.t(),
          account_sid: String.t() | nil,
          date_updated: String.t() | nil,
          sms_fallback_url: String.t() | nil,
          emergency_status: String.t(),
          voice_fallback_method: String.t() | nil,
          beta: boolean() | nil,
          status_callback_method: String.t() | nil,
          api_version: String.t() | nil,
          sms_url: String.t() | nil,
          phone_number: String.t() | nil,
          sms_method: String.t() | nil,
          friendly_name: String.t() | nil,
          sms_fallback_method: String.t() | nil,
          capabilities: map() | nil,
          voice_fallback_url: String.t() | nil,
          identity_sid: String.t() | nil,
          bundle_sid: String.t() | nil,
          emergency_address_status: String.t(),
          date_created: String.t() | nil,
          sms_application_sid: String.t() | nil,
          voice_application_sid: String.t() | nil,
          status: String.t() | nil,
          trunk_sid: String.t() | nil,
          address_sid: String.t() | nil,
          voice_caller_id_lookup: boolean() | nil,
          voice_receive_mode: String.t(),
          sid: String.t() | nil,
          uri: String.t() | nil,
          emergency_address_sid: String.t() | nil,
          origin: String.t() | nil,
          status_callback: String.t() | nil,
          voice_method: String.t() | nil,
          voice_url: String.t() | nil
        }

  # credo:disable-for-next-line Credo.Check.Warning.StructFieldAmount
  defstruct [
    :address_requirements,
    :account_sid,
    :date_updated,
    :sms_fallback_url,
    :emergency_status,
    :voice_fallback_method,
    :beta,
    :status_callback_method,
    :api_version,
    :sms_url,
    :phone_number,
    :sms_method,
    :friendly_name,
    :sms_fallback_method,
    :capabilities,
    :voice_fallback_url,
    :identity_sid,
    :bundle_sid,
    :emergency_address_status,
    :date_created,
    :sms_application_sid,
    :voice_application_sid,
    :status,
    :trunk_sid,
    :address_sid,
    :voice_caller_id_lookup,
    :voice_receive_mode,
    :sid,
    :uri,
    :emergency_address_sid,
    :origin,
    :status_callback,
    :voice_method,
    :voice_url
  ]

  @object_name "api.v2010.account.incoming_phone_number.incoming_phone_number_toll_free"
  def object_name, do: @object_name

  @sid_prefix "PN"
  def sid_prefix, do: @sid_prefix
end
