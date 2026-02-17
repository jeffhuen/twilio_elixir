# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Api.V2010.Sip.Domain.Auth.Call.AuthCallsCredentialListMapping do
  @moduledoc """
  Credential lists for SIP calls

  SID prefix: `CL`

  Parent: `/Accounts/{AccountSid}/SIP/Domains/{DomainSid}/Auth/Calls.json`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the CredentialListMapping resource. |
  | `date_created` | The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  | `date_updated` | The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  | `friendly_name` | The string that you assigned to describe the resource.. PII: standard |
  | `sid` | The unique string that that we created to identify the CredentialListMapping resource. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          sid: String.t() | nil
        }

  defstruct [:account_sid, :date_created, :date_updated, :friendly_name, :sid]

  @object_name "api.v2010.account.sip.sip_domain.sip_auth.sip_auth_calls.sip_auth_calls_credential_list_mapping"
  def object_name, do: @object_name

  @sid_prefix "CL"
  def sid_prefix, do: @sid_prefix
end
