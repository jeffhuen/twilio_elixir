# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Bulkexports.V1.Export.Day do
  @moduledoc """
  Day resource.

  Parent: `/Exports/{ResourceType}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `create_date` | The ISO 8601 format date when resources is created |
  | `day` | The ISO 8601 format date of the resources in the file, for a UTC day |
  | `friendly_name` | The friendly name specified when creating the job |
  | `resource_type` | The type of communication – Messages, Calls, Conferences, and Participants |
  | `size` | The size of the day's data file in bytes |
  """

  @type t :: %__MODULE__{
          create_date: String.t() | nil,
          day: String.t() | nil,
          friendly_name: String.t() | nil,
          resource_type: String.t() | nil,
          size: integer()
        }

  defstruct [:create_date, :day, :friendly_name, :resource_type, :size]

  @object_name "bulkexports.v1.export.day"
  def object_name, do: @object_name
end
