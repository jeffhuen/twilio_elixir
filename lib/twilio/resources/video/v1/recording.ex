# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Video.V1.Recording do
  @moduledoc """
  Single-track, single-media recordings

  SID prefix: `RT`

  ## Sub-resources
  - `media` — `/v1/Recordings/{recording_sid}/Media`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Recording resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `codec` | The codec used to encode the track. Can be: `VP8`, `H264`, `OPUS`, and `PCMU`.. Values: `VP8`, `H264`, `OPUS`, `PCMU` |
  | `container_format` | Values: `mka`, `mkv` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `duration` | The duration of the recording in seconds rounded to the nearest second. Sub-second tracks have a `Duration` property of 1 second |
  | `grouping_sids` | A list of SIDs related to the recording. Includes the `room_sid` and `participant_sid`. |
  | `links` | The URLs of related resources.. Format: uri-map |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `media_external_location` | The URL of the media file associated with the recording when stored externally. See [External S3 Recordings](/docs/video/api/external-s3-recordings) for more details.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `offset` | The time in milliseconds elapsed between an arbitrary point in time, common to all group rooms, and the moment when the source room of this track started. This information provides a synchronization mechanism for recordings belonging to the same room.. Format: int64 |
  | `sid` | The unique string that we created to identify the Recording resource. |
  | `size` | The size of the recorded track, in bytes.. Format: int64 |
  | `source_sid` | The SID of the recording source. For a Room Recording, this value is a `track_sid`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status` | The status of the recording. Can be: `processing`, `completed`, or `deleted`. `processing` indicates the recording is still being captured; `completed` indicates the recording has been captured and is now available for download. `deleted` means the recording media has been deleted from the system, but its metadata is still available.. Values: `processing`, `completed`, `deleted`, `failed` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status_callback` | The URL called using the `status_callback_method` to send status information on every recording event.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status_callback_method` | The HTTP method used to call `status_callback`. Can be: `POST` or `GET`, defaults to `POST`.. Values: `GET`, `POST`. Format: http-method |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `track_name` | The name that was given to the source track of the recording. If no name is given, the `source_sid` is used.. PII: standard |
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
          sid: String.t() | nil,
          size: integer() | nil,
          source_sid: String.t() | nil,
          status: String.t(),
          status_callback: String.t() | nil,
          status_callback_method: String.t() | nil,
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
    :sid,
    :size,
    :source_sid,
    :status,
    :status_callback,
    :status_callback_method,
    :track_name,
    :type,
    :url
  ]

  @object_name "video.v1.recording"
  def object_name, do: @object_name

  @sid_prefix "RT"
  def sid_prefix, do: @sid_prefix
end
