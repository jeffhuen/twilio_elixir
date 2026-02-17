# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Video.V1.Room.RoomRecording do
  @moduledoc """
  Single-track, single-media room recordings

  SID prefix: `RT`

  Parent: `/Rooms/{Sid}`

  ## Sub-resources
  - `media` — `/v1/Rooms/{room_sid}/Recordings/{sid}/Media`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the RoomRecording resource. |
  | `codec` | The codec used for the recording. Can be: `VP8` or `H264`.. Values: `VP8`, `H264`, `OPUS`, `PCMU` |
  | `container_format` | Values: `mka`, `mkv` |
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `duration` | The duration of the recording rounded to the nearest second. Sub-second duration tracks have a `duration` of 1 second |
  | `grouping_sids` | A list of SIDs related to the Recording. Includes the `room_sid` and `participant_sid`. |
  | `links` | The URLs of related resources.. Format: uri-map |
  | `media_external_location` | The URL of the media file associated with the recording when stored externally. See [External S3 Recordings](/docs/video/api/external-s3-recordings) for more details.. Format: uri |
  | `offset` | The time in milliseconds elapsed between an arbitrary point in time, common to all group rooms, and the moment when the source room of this track started. This information provides a synchronization mechanism for recordings belonging to the same room.. Format: int64 |
  | `room_sid` | The SID of the Room resource the recording is associated with. |
  | `sid` | The unique string that we created to identify the RoomRecording resource. |
  | `size` | The size of the recorded track in bytes.. Format: int64 |
  | `source_sid` | The SID of the recording source. For a Room Recording, this value is a `track_sid`. |
  | `status` | The status of the recording. Can be: `processing`, `completed`, or `deleted`. `processing` indicates the Recording is still being captured. `completed` indicates the Recording has been captured and is now available for download. `deleted` means the recording media has been deleted from the system, but its metadata is still available for historical purposes.. Values: `processing`, `completed`, `deleted`, `failed` |
  | `track_name` | The name that was given to the source track of the recording. If no name is given, the `source_sid` is used. |
  | `type` | The recording's media type. Can be: `audio` or `video`.. Values: `audio`, `video`, `data` |
  | `url` | The absolute URL of the resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          codec: String.t(),
          container_format: String.t(),
          date_created: String.t() | nil,
          duration: integer() | nil,
          grouping_sids: String.t() | nil,
          links: map() | nil,
          media_external_location: String.t() | nil,
          offset: integer() | nil,
          room_sid: String.t() | nil,
          sid: String.t() | nil,
          size: integer() | nil,
          source_sid: String.t() | nil,
          status: String.t(),
          track_name: String.t() | nil,
          type: String.t(),
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :codec,
    :container_format,
    :date_created,
    :duration,
    :grouping_sids,
    :links,
    :media_external_location,
    :offset,
    :room_sid,
    :sid,
    :size,
    :source_sid,
    :status,
    :track_name,
    :type,
    :url
  ]

  @object_name "video.v1.room.room_recording"
  def object_name, do: @object_name

  @sid_prefix "RT"
  def sid_prefix, do: @sid_prefix
end
