# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Api.V2010.Sip.Domain.Credentiallistmapping do
  @moduledoc """
  Credential lists associated with a SIP Domain

  SID prefix: `CL`

  Parent: `/Accounts/{AccountSid}/SIP/Domains/{Sid}.json`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The unique id of the Account that is responsible for this resource. |
  | `date_created` | The date that this resource was created, given as GMT in [RFC 2822](https://www.php.net/manual/en/class.datetime.php#datetime.constants.rfc2822) format.. Format: date-time-rfc-2822 |
  | `date_updated` | The date that this resource was last updated, given as GMT in [RFC 2822](https://www.php.net/manual/en/class.datetime.php#datetime.constants.rfc2822) format.. Format: date-time-rfc-2822 |
  | `domain_sid` | The unique string that is created to identify the SipDomain resource. |
  | `friendly_name` | A human readable descriptive text for this resource, up to 64 characters long. |
  | `sid` | A 34 character string that uniquely identifies this resource. |
  | `uri` | The URI for this resource, relative to `https://api.twilio.com` |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          domain_sid: String.t() | nil,
          friendly_name: String.t() | nil,
          sid: String.t() | nil,
          uri: String.t() | nil
        }

  defstruct [:account_sid, :date_created, :date_updated, :domain_sid, :friendly_name, :sid, :uri]

  @object_name "api.v2010.account.sip.sip_domain.sip_credential_list_mapping"
  def object_name, do: @object_name

  @sid_prefix "CL"
  def sid_prefix, do: @sid_prefix
end
