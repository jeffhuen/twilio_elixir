# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Events.V1.Type do
  @moduledoc """
  Event Types available

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `date_created` | The date that this Event Type was created, given in ISO 8601 format.. Format: date-time |
  | `date_updated` | The date that this Event Type was updated, given in ISO 8601 format.. Format: date-time |
  | `description` | A human readable description for this Event Type. |
  | `documentation_url` | The URL to the documentation or to the most relevant Twilio Changelog entry of this Event Type. |
  | `links` | Format: uri-map |
  | `schema_id` | A string that uniquely identifies the Schema this Event Type adheres to. |
  | `status` | A string that describes how this Event Type can be used. For example: `available`, `deprecated`, `restricted`, `discontinued`. When the status is `available`, the Event Type can be used normally. |
  | `type` | A string that uniquely identifies this Event Type. |
  | `url` | The URL of this resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          description: String.t() | nil,
          documentation_url: String.t() | nil,
          links: map() | nil,
          schema_id: String.t() | nil,
          status: String.t() | nil,
          type: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :date_created,
    :date_updated,
    :description,
    :documentation_url,
    :links,
    :schema_id,
    :status,
    :type,
    :url
  ]

  @object_name "events.v1.event_type"
  def object_name, do: @object_name
end
