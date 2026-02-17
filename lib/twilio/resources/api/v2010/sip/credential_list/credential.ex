# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Api.V2010.SIP.CredentialList.Credential do
  @moduledoc """
  Username and password information for SIP Domains

  SID prefix: `CR`

  Parent: `/Accounts/{AccountSid}/SIP/CredentialLists/{Sid}.json`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The unique id of the Account that is responsible for this resource. |
  | `credential_list_sid` | The unique id that identifies the credential list that includes this credential. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date that this resource was created, given as GMT in [RFC 2822](https://www.php.net/manual/en/class.datetime.php#datetime.constants.rfc2822) format.. Format: date-time-rfc-2822 |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date that this resource was last updated, given as GMT in [RFC 2822](https://www.php.net/manual/en/class.datetime.php#datetime.constants.rfc2822) format.. Format: date-time-rfc-2822 |
  | `sid` | A 34 character string that uniquely identifies this resource. |
  | `uri` | The URI for this resource, relative to `https://api.twilio.com` |
  | `username` | The username for this credential.. PII: standard |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          credential_list_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          sid: String.t() | nil,
          uri: String.t() | nil,
          username: String.t() | nil
        }

  defstruct [
    :account_sid,
    :credential_list_sid,
    :date_created,
    :date_updated,
    :sid,
    :uri,
    :username
  ]

  @object_name "api.v2010.account.sip.sip_credential_list.sip_credential"
  def object_name, do: @object_name

  @sid_prefix "CR"
  def sid_prefix, do: @sid_prefix
end
