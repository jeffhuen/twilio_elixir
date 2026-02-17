# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Api.V2010.Sms.Shortcode do
  @moduledoc """
  Messaging short codes

  SID prefix: `SC`

  Parent: `/Accounts/{Sid}.json`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created this ShortCode resource. |
  | `api_version` | The API version used to start a new TwiML session when an SMS message is sent to this short code. |
  | `date_created` | The date and time in GMT that this resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  | `date_updated` | The date and time in GMT that this resource was last updated, specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  | `friendly_name` | A string that you assigned to describe this resource. By default, the `FriendlyName` is the short code. |
  | `short_code` | The short code. e.g., 894546. |
  | `sid` | The unique string that that we created to identify this ShortCode resource. |
  | `sms_fallback_method` | The HTTP method we use to call the `sms_fallback_url`. Can be: `GET` or `POST`.. Values: `GET`, `POST`. Format: http-method |
  | `sms_fallback_url` | The URL that we call if an error occurs while retrieving or executing the TwiML from `sms_url`.. Format: uri |
  | `sms_method` | The HTTP method we use to call the `sms_url`. Can be: `GET` or `POST`.. Values: `GET`, `POST`. Format: http-method |
  | `sms_url` | The URL we call when receiving an incoming SMS message to this short code.. Format: uri |
  | `uri` | The URI of this resource, relative to `https://api.twilio.com`. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          api_version: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          short_code: String.t() | nil,
          sid: String.t() | nil,
          sms_fallback_method: String.t() | nil,
          sms_fallback_url: String.t() | nil,
          sms_method: String.t() | nil,
          sms_url: String.t() | nil,
          uri: String.t() | nil
        }

  defstruct [
    :account_sid,
    :api_version,
    :date_created,
    :date_updated,
    :friendly_name,
    :short_code,
    :sid,
    :sms_fallback_method,
    :sms_fallback_url,
    :sms_method,
    :sms_url,
    :uri
  ]

  @object_name "api.v2010.account.short_code"
  def object_name, do: @object_name

  @sid_prefix "SC"
  def sid_prefix, do: @sid_prefix
end
