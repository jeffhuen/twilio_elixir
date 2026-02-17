# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Events.V1.Sink do
  @moduledoc """
  Sink destination to send events to

  SID prefix: `DG`

  ## Sub-resources
  - `sink_test` — `/v1/Sinks/{sid}/Test`
  - `sink_validate` — `/v1/Sinks/{sid}/Validate`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `date_created` | The date that this Sink was created, given in ISO 8601 format.. Format: date-time |
  | `date_updated` | The date that this Sink was updated, given in ISO 8601 format.. Format: date-time |
  | `description` | A human readable description for the Sink |
  | `links` | Contains a dictionary of URL links to nested resources of this Sink.. Format: uri-map |
  | `sid` | A 34 character string that uniquely identifies this Sink. |
  | `sink_configuration` | The information required for Twilio to connect to the provided Sink encoded as JSON. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `sink_type` | The Sink type. Can only be "kinesis" or "webhook" currently.. Values: `kinesis`, `webhook`, `segment`, `email` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status` | The Status of this Sink. One of `initialized`, `validating`, `active` or `failed`.. Values: `initialized`, `validating`, `active`, `failed` |
  | `url` | The URL of this resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          description: String.t() | nil,
          links: map() | nil,
          sid: String.t() | nil,
          sink_configuration: String.t() | nil,
          sink_type: String.t(),
          status: String.t(),
          url: String.t() | nil
        }

  defstruct [
    :date_created,
    :date_updated,
    :description,
    :links,
    :sid,
    :sink_configuration,
    :sink_type,
    :status,
    :url
  ]

  @object_name "events.v1.sink"
  def object_name, do: @object_name

  @sid_prefix "DG"
  def sid_prefix, do: @sid_prefix
end
