# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Preview.Wireless.Sim.Usage do
  @moduledoc """


  Parent: `/Sims/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `url` | Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          commands_costs: String.t() | nil,
          commands_usage: String.t() | nil,
          data_costs: String.t() | nil,
          data_usage: String.t() | nil,
          period: String.t() | nil,
          sim_sid: String.t() | nil,
          sim_unique_name: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :commands_costs,
    :commands_usage,
    :data_costs,
    :data_usage,
    :period,
    :sim_sid,
    :sim_unique_name,
    :url
  ]

  @object_name "preview.wireless.sim.usage"
  def object_name, do: @object_name
end
