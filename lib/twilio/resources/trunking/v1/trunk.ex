# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Trunking.V1.Trunk do
  @moduledoc """
  Represents a SIP trunk

  SID prefix: `TK`

  ## Sub-resources
  - `credentials_lists` — `/v1/Trunks/{trunk_sid}/CredentialLists`
  - `ip_access_control_lists` — `/v1/Trunks/{trunk_sid}/IpAccessControlLists`
  - `origination_urls` — `/v1/Trunks/{trunk_sid}/OriginationUrls`
  - `phone_numbers` — `/v1/Trunks/{trunk_sid}/PhoneNumbers`
  - `recordings` — `/v1/Trunks/{trunk_sid}/Recording`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Trunk resource. |
  | `auth_type` | The types of authentication mapped to the domain. Can be: `IP_ACL` and `CREDENTIAL_LIST`. If both are mapped, the values are returned in a comma delimited list. If empty, the domain will not receive any traffic. |
  | `auth_type_set` | Reserved. |
  | `cnam_lookup_enabled` | Whether Caller ID Name (CNAM) lookup is enabled for the trunk. If enabled, all inbound calls to the SIP Trunk from the United States and Canada automatically perform a CNAM Lookup and display Caller ID data on your phone. See [CNAM Lookups](https://www.twilio.com/docs/sip-trunking#CNAM) for more information. |
  | `date_created` | The date and time in GMT when the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `disaster_recovery_method` | The HTTP method we use to call the `disaster_recovery_url`. Can be: `GET` or `POST`.. Values: `GET`, `POST`. Format: http-method |
  | `disaster_recovery_url` | The URL we call using the `disaster_recovery_method` if an error occurs while sending SIP traffic towards the configured Origination URL. We retrieve TwiML from this URL and execute the instructions like any other normal TwiML call. See [Disaster Recovery](https://www.twilio.com/docs/sip-trunking#disaster-recovery) for more information.. Format: uri. PII: standard |
  | `domain_name` | The unique address you reserve on Twilio to which you route your SIP traffic. Domain names can contain letters, digits, and `-` and must end with `pstn.twilio.com`. See [Termination Settings](https://www.twilio.com/docs/sip-trunking#termination) for more information. |
  | `friendly_name` | The string that you assigned to describe the resource. |
  | `links` | The URLs of related resources.. Format: uri-map |
  | `recording` | The recording settings for the trunk. Can be: `do-not-record`, `record-from-ringing`, `record-from-answer`. If set to `record-from-ringing` or `record-from-answer`, all calls going through the trunk will be recorded. The only way to change recording parameters is on a sub-resource of a Trunk after it has been created. e.g.`/Trunks/[Trunk_SID]/Recording -XPOST -d'Mode=record-from-answer'`. See [Recording](https://www.twilio.com/docs/sip-trunking#recording) for more information. |
  | `secure` | Whether Secure Trunking is enabled for the trunk. If enabled, all calls going through the trunk will be secure using SRTP for media and TLS for signaling. If disabled, then RTP will be used for media. See [Secure Trunking](https://www.twilio.com/docs/sip-trunking#securetrunking) for more information. |
  | `sid` | The unique string that we created to identify the Trunk resource. |
  | `symmetric_rtp_enabled` | Whether Symmetric RTP is enabled for the trunk. When Symmetric RTP is disabled, Twilio will send RTP to the destination negotiated in the SDP. Disabling Symmetric RTP is considered to be more secure and therefore recommended. See [Symmetric RTP](https://www.twilio.com/docs/sip-trunking#symmetric-rtp) for more information. |
  | `transfer_caller_id` | Caller Id for transfer target. Can be: `from-transferee` (default) or `from-transferor`.. Values: `from-transferee`, `from-transferor` |
  | `transfer_mode` | The call transfer settings for the trunk. Can be: `enable-all`, `sip-only` and `disable-all`. See [Transfer](https://www.twilio.com/docs/sip-trunking/call-transfer) for more information.. Values: `disable-all`, `enable-all`, `sip-only` |
  | `url` | The absolute URL of the resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          auth_type: String.t() | nil,
          auth_type_set: list() | nil,
          cnam_lookup_enabled: boolean() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          disaster_recovery_method: String.t() | nil,
          disaster_recovery_url: String.t() | nil,
          domain_name: String.t() | nil,
          friendly_name: String.t() | nil,
          links: map() | nil,
          recording: String.t() | nil,
          secure: boolean() | nil,
          sid: String.t() | nil,
          symmetric_rtp_enabled: boolean() | nil,
          transfer_caller_id: String.t(),
          transfer_mode: String.t(),
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :auth_type,
    :auth_type_set,
    :cnam_lookup_enabled,
    :date_created,
    :date_updated,
    :disaster_recovery_method,
    :disaster_recovery_url,
    :domain_name,
    :friendly_name,
    :links,
    :recording,
    :secure,
    :sid,
    :symmetric_rtp_enabled,
    :transfer_caller_id,
    :transfer_mode,
    :url
  ]

  @object_name "trunking.v1.trunk"
  def object_name, do: @object_name

  @sid_prefix "TK"
  def sid_prefix, do: @sid_prefix
end
