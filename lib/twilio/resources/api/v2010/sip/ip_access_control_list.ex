# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Api.V2010.SIP.IpAccessControlList do
  @moduledoc """
  Access control lists of IP address resources

  SID prefix: `AL`

  Parent: `/Accounts/{AccountSid}/SIP.json`

  ## Sub-resources
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  - `ip_addresses` — `/2010-04-01/Accounts/{account_sid}/SIP/IpAccessControlLists/{ip_access_control_list_sid}/IpAddresses.json`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The unique id of the [Account](https://www.twilio.com/docs/iam/api/account) that owns this resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date that this resource was created, given as GMT in [RFC 2822](https://www.php.net/manual/en/class.datetime.php#datetime.constants.rfc2822) format.. Format: date-time-rfc-2822 |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date that this resource was last updated, given as GMT in [RFC 2822](https://www.php.net/manual/en/class.datetime.php#datetime.constants.rfc2822) format.. Format: date-time-rfc-2822 |
  | `friendly_name` | A human readable descriptive text, up to 255 characters long. |
  | `sid` | A 34 character string that uniquely identifies this resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `subresource_uris` | A list of the IpAddress resources associated with this IP access control list resource.. Format: uri-map |
  | `uri` | The URI for this resource, relative to `https://api.twilio.com` |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          sid: String.t() | nil,
          subresource_uris: map() | nil,
          uri: String.t() | nil
        }

  defstruct [
    :account_sid,
    :date_created,
    :date_updated,
    :friendly_name,
    :sid,
    :subresource_uris,
    :uri
  ]

  @object_name "api.v2010.account.sip.sip_ip_access_control_list"
  def object_name, do: @object_name

  @sid_prefix "AL"
  def sid_prefix, do: @sid_prefix
end
