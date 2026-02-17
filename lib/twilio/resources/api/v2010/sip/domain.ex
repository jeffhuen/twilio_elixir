# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Api.V2010.Sip.Domain do
  @moduledoc """
  Custom DNS hostnames that can accept SIP traffic

  SID prefix: `SD`

  Parent: `/Accounts/{AccountSid}/SIP.json`

  ## Sub-resources
  - `auth` — `/2010-04-01/Accounts/{account_sid}/SIP/Domains/{domain_sid}/Auth.json`
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  - `credential_list_mappings` — `/2010-04-01/Accounts/{account_sid}/SIP/Domains/{domain_sid}/CredentialListMappings.json`
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  - `ip_access_control_list_mappings` — `/2010-04-01/Accounts/{account_sid}/SIP/Domains/{domain_sid}/IpAccessControlListMappings.json`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the SipDomain resource. |
  | `api_version` | The API version used to process the call. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `auth_type` | The types of authentication you have mapped to your domain. Can be: `IP_ACL` and `CREDENTIAL_LIST`. If you have both defined for your domain, both will be returned in a comma delimited string. If `auth_type` is not defined, the domain will not be able to receive any traffic. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `byoc_trunk_sid` | The SID of the BYOC Trunk(Bring Your Own Carrier) resource that the Sip Domain will be associated with. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `domain_name` | The unique address you reserve on Twilio to which you route your SIP traffic. Domain names can contain letters, digits, and "-" and must end with `sip.twilio.com`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `emergency_caller_sid` | Whether an emergency caller sid is configured for the domain. If present, this phone number will be used as the callback for the emergency call. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `emergency_calling_enabled` | Whether emergency calling is enabled for the domain. If enabled, allows emergency calls on the domain from phone numbers with validated addresses. |
  | `friendly_name` | The string that you assigned to describe the resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `secure` | Whether secure SIP is enabled for the domain. If enabled, TLS will be enforced and SRTP will be negotiated on all incoming calls to this sip domain. |
  | `sid` | The unique string that that we created to identify the SipDomain resource. |
  | `sip_registration` | Whether to allow SIP Endpoints to register with the domain to receive calls. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `subresource_uris` | A list of mapping resources associated with the SIP Domain resource identified by their relative URIs.. Format: uri-map |
  | `uri` | The URI of the resource, relative to `https://api.twilio.com`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `voice_fallback_method` | The HTTP method we use to call `voice_fallback_url`. Can be: `GET` or `POST`.. Values: `GET`, `POST`. Format: http-method |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `voice_fallback_url` | The URL that we call when an error occurs while retrieving or executing the TwiML requested from `voice_url`.. Format: uri. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `voice_method` | The HTTP method we use to call `voice_url`. Can be: `GET` or `POST`.. Values: `GET`, `POST`. Format: http-method |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `voice_status_callback_method` | The HTTP method we use to call `voice_status_callback_url`. Either `GET` or `POST`.. Values: `GET`, `POST`. Format: http-method |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `voice_status_callback_url` | The URL that we call to pass status parameters (such as call ended) to your application.. Format: uri. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `voice_url` | The URL we call using the `voice_method` when the domain receives a call.. Format: uri. PII: standard |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          api_version: String.t() | nil,
          auth_type: String.t() | nil,
          byoc_trunk_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          domain_name: String.t() | nil,
          emergency_caller_sid: String.t() | nil,
          emergency_calling_enabled: boolean() | nil,
          friendly_name: String.t() | nil,
          secure: boolean() | nil,
          sid: String.t() | nil,
          sip_registration: boolean() | nil,
          subresource_uris: map() | nil,
          uri: String.t() | nil,
          voice_fallback_method: String.t() | nil,
          voice_fallback_url: String.t() | nil,
          voice_method: String.t() | nil,
          voice_status_callback_method: String.t() | nil,
          voice_status_callback_url: String.t() | nil,
          voice_url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :api_version,
    :auth_type,
    :byoc_trunk_sid,
    :date_created,
    :date_updated,
    :domain_name,
    :emergency_caller_sid,
    :emergency_calling_enabled,
    :friendly_name,
    :secure,
    :sid,
    :sip_registration,
    :subresource_uris,
    :uri,
    :voice_fallback_method,
    :voice_fallback_url,
    :voice_method,
    :voice_status_callback_method,
    :voice_status_callback_url,
    :voice_url
  ]

  @object_name "api.v2010.account.sip.sip_domain"
  def object_name, do: @object_name

  @sid_prefix "SD"
  def sid_prefix, do: @sid_prefix
end
