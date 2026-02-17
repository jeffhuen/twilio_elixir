# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Video.V1.Room.RecordingRules do
  @moduledoc """
  RecordingRules resource.

  Parent: `/Rooms/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `room_sid` | The SID of the Room resource for the Recording Rules |
  | `rules` | A collection of Recording Rules that describe how to include or exclude matching tracks for recording |
  """

  @type t :: %__MODULE__{
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          room_sid: String.t() | nil,
          rules: list() | nil
        }

  defstruct [:date_created, :date_updated, :room_sid, :rules]

  @object_name "video.v1.room.room_recording_rule"
  def object_name, do: @object_name
end
