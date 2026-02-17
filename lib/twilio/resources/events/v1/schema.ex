# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Events.V1.Schema do
  @moduledoc """
  Versioned Schema definitions for Event Types

  ## Sub-resources
  - `versions` — `/v1/Schemas/{id}/Versions`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `id` | The unique identifier of the schema. Each schema can have multiple versions, that share the same id. |
  | `latest_version` | The latest version published of this schema. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `latest_version_date_created` | The date that the latest schema version was created, given in ISO 8601 format.. Format: date-time |
  | `links` | Contains a dictionary of URL links to nested resources of this schema.. Format: uri-map |
  | `url` | The URL of this resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          id: String.t() | nil,
          latest_version: integer(),
          latest_version_date_created: String.t() | nil,
          links: map() | nil,
          url: String.t() | nil
        }

  defstruct [:id, :latest_version, :latest_version_date_created, :links, :url]

  @object_name "events.v1.schema"
  def object_name, do: @object_name
end
