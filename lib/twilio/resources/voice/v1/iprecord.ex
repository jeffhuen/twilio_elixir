# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Voice.V1.Iprecord do
  @moduledoc """
  IP Records hold information about the IP addresses and ranges ([CIDR](https://tools.ietf.org/html/rfc4632) blocks) that your traffic will be associated with.

  SID prefix: `IL`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the IP Record resource. |
  | `cidr_prefix_length` | An integer representing the length of the [CIDR](https://tools.ietf.org/html/rfc4632) prefix to use with this IP address. By default the entire IP address is used, which for IPv4 is value 32. |
  | `date_created` | The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `date_updated` | The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `friendly_name` | The string that you assigned to describe the resource. |
  | `ip_address` | An IP address in dotted decimal notation, IPv4 only.. PII: standard |
  | `sid` | The unique string that we created to identify the IP Record resource. |
  | `url` | The absolute URL of the resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          cidr_prefix_length: integer(),
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          ip_address: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :cidr_prefix_length,
    :date_created,
    :date_updated,
    :friendly_name,
    :ip_address,
    :sid,
    :url
  ]

  @object_name "voice.v1.ip_record"
  def object_name, do: @object_name

  @sid_prefix "IL"
  def sid_prefix, do: @sid_prefix
end
