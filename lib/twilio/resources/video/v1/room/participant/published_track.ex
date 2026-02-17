# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Video.V1.Room.Participant.PublishedTrack do
  @moduledoc """
  PublishedTrack resource.

  SID prefix: `MT`

  Parent: `/Rooms/{RoomSid}/Participants/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `enabled` | Whether the track is enabled. |
  | `kind` | The track type. Can be: `audio`, `video` or `data`.. Values: `audio`, `video`, `data` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `name` | The track name. Must be no more than 128 characters, and be unique among the participant's published tracks. |
  | `participant_sid` | The SID of the Participant resource with the published track. |
  | `room_sid` | The SID of the Room resource where the track is published. |
  | `sid` | The unique string that we created to identify the RoomParticipantPublishedTrack resource. |
  | `url` | The absolute URL of the resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          enabled: boolean() | nil,
          kind: String.t(),
          name: String.t() | nil,
          participant_sid: String.t() | nil,
          room_sid: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :date_created,
    :date_updated,
    :enabled,
    :kind,
    :name,
    :participant_sid,
    :room_sid,
    :sid,
    :url
  ]

  @object_name "video.v1.room.room_participant.room_participant_published_track"
  def object_name, do: @object_name

  @sid_prefix "MT"
  def sid_prefix, do: @sid_prefix
end
