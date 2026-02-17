# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Trunking.V1.Trunk.Ipaccesscontrollist do
  @moduledoc """
  List of IP addresses for accessing a trunk

  SID prefix: `AL`

  Parent: `/Trunks/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the IpAccessControlList resource. |
  | `date_created` | The date and time in GMT when the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `friendly_name` | The string that you assigned to describe the resource. |
  | `sid` | The unique string that we created to identify the IpAccessControlList resource. |
  | `trunk_sid` | The SID of the Trunk the resource is associated with. |
  | `url` | The absolute URL of the resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          sid: String.t() | nil,
          trunk_sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:account_sid, :date_created, :date_updated, :friendly_name, :sid, :trunk_sid, :url]

  @object_name "trunking.v1.trunk.ip_access_control_list"
  def object_name, do: @object_name

  @sid_prefix "AL"
  def sid_prefix, do: @sid_prefix
end
