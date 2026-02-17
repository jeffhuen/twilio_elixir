# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Voice.V1.ByocTrunk do
  @moduledoc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  BYOC Trunks allow you to bring your own voice carrier to Twilio, enabling your calls to use our Programmable Voice APIs.

  SID prefix: `BY`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the BYOC Trunk resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `cnam_lookup_enabled` | Whether Caller ID Name (CNAM) lookup is enabled for the trunk. If enabled, all inbound calls to the BYOC Trunk from the United States and Canada automatically perform a CNAM Lookup and display Caller ID data on your phone. See [CNAM Lookups](https://www.twilio.com/docs/sip-trunking#CNAM) for more information. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `connection_policy_sid` | The SID of the Connection Policy that Twilio will use when routing traffic to your communications infrastructure. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `friendly_name` | The string that you assigned to describe the resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `from_domain_sid` | The SID of the SIP Domain that should be used in the `From` header of originating calls sent to your SIP infrastructure. If your SIP infrastructure allows users to "call back" an incoming call, configure this with a [SIP Domain](https://www.twilio.com/docs/voice/api/sending-sip) to ensure proper routing. If not configured, the from domain will default to "sip.twilio.com". |
  | `sid` | The unique string that that we created to identify the BYOC Trunk resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status_callback_method` | The HTTP method we use to call `status_callback_url`. Either `GET` or `POST`.. Values: `GET`, `POST`. Format: http-method |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status_callback_url` | The URL that we call to pass status parameters (such as call ended) to your application.. Format: uri. PII: standard |
  | `url` | The absolute URL of the resource.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `voice_fallback_method` | The HTTP method we use to call `voice_fallback_url`. Can be: `GET` or `POST`.. Values: `GET`, `POST`. Format: http-method |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `voice_fallback_url` | The URL that we call when an error occurs while retrieving or executing the TwiML requested from `voice_url`.. Format: uri. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `voice_method` | The HTTP method we use to call `voice_url`. Can be: `GET` or `POST`.. Values: `GET`, `POST`. Format: http-method |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `voice_url` | The URL we call using the `voice_method` when the BYOC Trunk receives a call.. Format: uri. PII: standard |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          cnam_lookup_enabled: boolean() | nil,
          connection_policy_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          from_domain_sid: String.t() | nil,
          sid: String.t() | nil,
          status_callback_method: String.t() | nil,
          status_callback_url: String.t() | nil,
          url: String.t() | nil,
          voice_fallback_method: String.t() | nil,
          voice_fallback_url: String.t() | nil,
          voice_method: String.t() | nil,
          voice_url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :cnam_lookup_enabled,
    :connection_policy_sid,
    :date_created,
    :date_updated,
    :friendly_name,
    :from_domain_sid,
    :sid,
    :status_callback_method,
    :status_callback_url,
    :url,
    :voice_fallback_method,
    :voice_fallback_url,
    :voice_method,
    :voice_url
  ]

  @object_name "voice.v1.byoc_trunk"
  def object_name, do: @object_name

  @sid_prefix "BY"
  def sid_prefix, do: @sid_prefix
end
