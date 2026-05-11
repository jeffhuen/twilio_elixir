# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Memory.V1.Store.Profile.Trait do
  @moduledoc """
  Trait resource.

  Full metadata about a trait, beyond the name value pair.

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `name` | The name of the trait. |
  | `timestamp` | The time the trait was created or last updated.. Format: date-time |
  | `traitGroup` | The trait group name to which this trait belongs. |
  """

  @type t :: %__MODULE__{
          name: String.t(),
          timestamp: String.t(),
          traitGroup: String.t(),
          value: String.t()
        }

  defstruct [:name, :timestamp, :traitGroup, :value]

  @object_name "FullTrait"
  def object_name, do: @object_name
end
