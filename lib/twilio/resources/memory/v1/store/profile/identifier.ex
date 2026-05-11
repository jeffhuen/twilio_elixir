# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Memory.V1.Store.Profile.Identifier do
  @moduledoc """
  Identifier resource.

  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  All the known values for a specific identifier type. These are normalized according to the corresponding identifier settings and ordered chronologically. It includes any promoted values from traits and explicitly set values from API calls, both historical and current.

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `idType` | Identifier type defined in Identity Resolution Settings. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `values` | Server managed collection of stored values for the identifier type.  Identifier values are normalized according to the corresponding identifier settings and ordered chronologically. |
  """

  @type t :: %__MODULE__{
          idType: String.t(),
          values: list()
        }

  defstruct [:idType, :values]

  @object_name "IdentifierSet"
  def object_name, do: @object_name
end
