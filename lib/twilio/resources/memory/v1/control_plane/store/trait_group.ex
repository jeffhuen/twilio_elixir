# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Memory.V1.ControlPlane.Store.TraitGroup do
  @moduledoc """
  TraitGroup resource.

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `description` | description of the Trait Group |
  | `displayName` | Provides a unique and addressable name to be assigned to this Trait Group |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `traits` | Map of traits that are part of this Trait Group, where the key is the trait name and the value is the trait's definition. |
  | `version` | The current version number of the Trait Group. Incremented on each successful update. |
  """

  @type t :: %__MODULE__{
          description: String.t(),
          displayName: String.t(),
          traits: map(),
          version: integer()
        }

  defstruct [:description, :displayName, :traits, :version]

  @object_name "TraitGroup"
  def object_name, do: @object_name
end
