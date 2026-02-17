# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Api.V2010.Application do
  @moduledoc """
  An Application instance resource represents an application that you have created with Twilio. An application inside of Twilio is just a set of URLs and other configuration data that tells Twilio how to behave when one of your Twilio numbers receives a call or SMS message.

  SID prefix: `AP`

  Parent: `/Accounts/{Sid}.json`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Application resource. |
  | `api_version` | The API version used to start a new TwiML session. |
  | `date_created` | The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  | `date_updated` | The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  | `friendly_name` | The string that you assigned to describe the resource. |
  | `message_status_callback` | The URL we call using a POST method to send message status information to your application.. Format: uri |
  | `public_application_connect_enabled` | Whether to allow other Twilio accounts to dial this applicaton using Dial verb. Can be: `true` or `false`. |
  | `sid` | The unique string that that we created to identify the Application resource. |
  | `sms_fallback_method` | The HTTP method we use to call `sms_fallback_url`. Can be: `GET` or `POST`.. Values: `GET`, `POST`. Format: http-method |
  | `sms_fallback_url` | The URL that we call when an error occurs while retrieving or executing the TwiML from `sms_url`.. Format: uri |
  | `sms_method` | The HTTP method we use to call `sms_url`. Can be: `GET` or `POST`.. Values: `GET`, `POST`. Format: http-method |
  | `sms_status_callback` | The URL we call using a POST method to send status information to your application about SMS messages that refer to the application.. Format: uri |
  | `sms_url` | The URL we call when the phone number receives an incoming SMS message.. Format: uri |
  | `status_callback` | The URL we call using the `status_callback_method` to send status information to your application.. Format: uri |
  | `status_callback_method` | The HTTP method we use to call `status_callback`. Can be: `GET` or `POST`.. Values: `GET`, `POST`. Format: http-method |
  | `uri` | The URI of the resource, relative to `https://api.twilio.com`. |
  | `voice_caller_id_lookup` | Whether we look up the caller's caller-ID name from the CNAM database (additional charges apply). Can be: `true` or `false`. |
  | `voice_fallback_method` | The HTTP method we use to call `voice_fallback_url`. Can be: `GET` or `POST`.. Values: `GET`, `POST`. Format: http-method |
  | `voice_fallback_url` | The URL that we call when an error occurs retrieving or executing the TwiML requested by `url`.. Format: uri |
  | `voice_method` | The HTTP method we use to call `voice_url`. Can be: `GET` or `POST`.. Values: `GET`, `POST`. Format: http-method |
  | `voice_url` | The URL we call when the phone number assigned to this application receives a call.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          api_version: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          message_status_callback: String.t() | nil,
          public_application_connect_enabled: boolean() | nil,
          sid: String.t() | nil,
          sms_fallback_method: String.t() | nil,
          sms_fallback_url: String.t() | nil,
          sms_method: String.t() | nil,
          sms_status_callback: String.t() | nil,
          sms_url: String.t() | nil,
          status_callback: String.t() | nil,
          status_callback_method: String.t() | nil,
          uri: String.t() | nil,
          voice_caller_id_lookup: boolean() | nil,
          voice_fallback_method: String.t() | nil,
          voice_fallback_url: String.t() | nil,
          voice_method: String.t() | nil,
          voice_url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :api_version,
    :date_created,
    :date_updated,
    :friendly_name,
    :message_status_callback,
    :public_application_connect_enabled,
    :sid,
    :sms_fallback_method,
    :sms_fallback_url,
    :sms_method,
    :sms_status_callback,
    :sms_url,
    :status_callback,
    :status_callback_method,
    :uri,
    :voice_caller_id_lookup,
    :voice_fallback_method,
    :voice_fallback_url,
    :voice_method,
    :voice_url
  ]

  @object_name "api.v2010.account.application"
  def object_name, do: @object_name

  @sid_prefix "AP"
  def sid_prefix, do: @sid_prefix
end
