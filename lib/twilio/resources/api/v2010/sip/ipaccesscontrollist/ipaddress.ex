# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Api.V2010.Sip.Ipaccesscontrollist.Ipaddress do
  @moduledoc """
  IP addresses that have access to a SIP Domain

  SID prefix: `IP`

  Parent: `/Accounts/{AccountSid}/SIP/IpAccessControlLists/{Sid}.json`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The unique id of the Account that is responsible for this resource. |
  | `cidr_prefix_length` | An integer representing the length of the CIDR prefix to use with this IP address when accepting traffic. By default the entire IP address is used. |
  | `date_created` | The date that this resource was created, given as GMT in [RFC 2822](https://www.php.net/manual/en/class.datetime.php#datetime.constants.rfc2822) format.. Format: date-time-rfc-2822 |
  | `date_updated` | The date that this resource was last updated, given as GMT in [RFC 2822](https://www.php.net/manual/en/class.datetime.php#datetime.constants.rfc2822) format.. Format: date-time-rfc-2822 |
  | `friendly_name` | A human readable descriptive text for this resource, up to 255 characters long. |
  | `ip_access_control_list_sid` | The unique id of the IpAccessControlList resource that includes this resource. |
  | `ip_address` | An IP address in dotted decimal notation from which you want to accept traffic. Any SIP requests from this IP address will be allowed by Twilio. IPv4 only supported today. |
  | `sid` | A 34 character string that uniquely identifies this resource. |
  | `uri` | The URI for this resource, relative to `https://api.twilio.com` |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          cidr_prefix_length: integer(),
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          ip_access_control_list_sid: String.t() | nil,
          ip_address: String.t() | nil,
          sid: String.t() | nil,
          uri: String.t() | nil
        }

  defstruct [
    :account_sid,
    :cidr_prefix_length,
    :date_created,
    :date_updated,
    :friendly_name,
    :ip_access_control_list_sid,
    :ip_address,
    :sid,
    :uri
  ]

  @object_name "api.v2010.account.sip.sip_ip_access_control_list.sip_ip_address"
  def object_name, do: @object_name

  @sid_prefix "IP"
  def sid_prefix, do: @sid_prefix
end
