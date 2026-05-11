# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Memory.V1.Store.Profile.Import do
  @moduledoc """
  Import resource.

  Mapping of a CSV header column to the trait fields

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `columnName` | The name of the column in the CSV header |
  | `traitGroup` | The trait group to which this trait belongs |
  | `traitName` | The name of the trait in the trait group |
  """

  @type t :: %__MODULE__{
          columnName: String.t(),
          traitGroup: String.t(),
          traitName: String.t()
        }

  defstruct [:columnName, :traitGroup, :traitName]

  @object_name "ColumnMappingItem"
  def object_name, do: @object_name
end
