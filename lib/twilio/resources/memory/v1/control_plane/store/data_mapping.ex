# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Memory.V1.ControlPlane.Store.DataMapping do
  @moduledoc """
  DataMapping resource.

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `createdAt` | The ISO 8601 timestamp when the  data mapping was created.. Format: date-time |
  | `description` | A human readable description of this resource, up to 512 characters. |
  | `id` | The unique identifier for the data mapping. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `isEnabled` | Flag indicating whether the data mapping is active. When true, data will be ingested and mapped according to the configuration. When false, the data mapping will be inactive and no data will be ingested into the Memory Store. |
  | `updatedAt` | The ISO 8601 timestamp when the data mapping was last updated.. Format: date-time |
  | `version` | The current version number of the DataMapping. Incremented on each successful update. |
  """

  @type t :: %__MODULE__{
          createdAt: String.t(),
          description: String.t(),
          displayName: String.t(),
          id: String.t(),
          isEnabled: boolean(),
          mappingFrom: String.t(),
          mappingTo: String.t(),
          updatedAt: String.t(),
          version: integer()
        }

  defstruct [
    :createdAt,
    :description,
    :displayName,
    :id,
    :isEnabled,
    :mappingFrom,
    :mappingTo,
    :updatedAt,
    :version
  ]

  @object_name "DataMapping"
  def object_name, do: @object_name
end
