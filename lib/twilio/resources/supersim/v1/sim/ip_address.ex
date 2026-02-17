# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Supersim.V1.Sim.IpAddress do
  @moduledoc """
  IP Addresses for a Super SIM configured to use a VPN connection

  Parent: `/Sims/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `ip_address` | IP address assigned to the given Super SIM |
  | `ip_address_version` | IP address version of the corresponding IP address. Values: `IPv4`, `IPv6` |
  """

  @type t :: %__MODULE__{
          ip_address: String.t() | nil,
          ip_address_version: String.t()
        }

  defstruct [:ip_address, :ip_address_version]

  @object_name "supersim.v1.sim.sim_ip_address"
  def object_name, do: @object_name
end
