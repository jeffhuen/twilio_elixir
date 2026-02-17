# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Events.V1.Schema.SchemaVersion do
  @moduledoc """
  Version of the Schema

  Parent: `/Schemas/{Id}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `date_created` | The date the schema version was created, given in ISO 8601 format.. Format: date-time |
  | `id` | The unique identifier of the schema. Each schema can have multiple versions, that share the same id. |
  | `raw` | Format: uri |
  | `schema_version` | The version of this schema. |
  | `url` | The URL of this resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          date_created: String.t() | nil,
          id: String.t() | nil,
          raw: String.t() | nil,
          schema_version: integer(),
          url: String.t() | nil
        }

  defstruct [:date_created, :id, :raw, :schema_version, :url]

  @object_name "events.v1.schema.schema_version"
  def object_name, do: @object_name
end
