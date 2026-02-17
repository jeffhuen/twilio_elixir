# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Bulkexports.V1.Export do
  @moduledoc """


  ## Sub-resources
  - `days` — `/v1/Exports/{resource_type}/Days`
  - `export_custom_jobs` — `/v1/Exports/{resource_type}/Jobs`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `links` | Contains a dictionary of URL links to nested resources of this Export.. Format: uri-map |
  | `resource_type` | The type of communication – Messages, Calls, Conferences, and Participants |
  | `url` | The URL of this resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          links: map() | nil,
          resource_type: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:links, :resource_type, :url]

  @object_name "bulkexports.v1.export"
  def object_name, do: @object_name
end
