# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Video.V1.Room do
  @moduledoc """
  Video rooms with one or more participants

  SID prefix: `RM`

  ## Sub-resources
  - `participants` — `/v1/Rooms/{room_sid}/Participants`
  - `recording_rules` — `/v1/Rooms/{room_sid}/RecordingRules`
  - `recordings` — `/v1/Rooms/{room_sid}/Recordings`
  - `transcriptions` — `/v1/Rooms/{room_sid}/Transcriptions`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Room resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `audio_only` | When set to true, indicates that the participants in the room will only publish audio. No video tracks will be allowed. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `duration` | The duration of the room in seconds. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `empty_room_timeout` | Specifies how long (in minutes) a room will remain active after last participant leaves. Can be configured when creating a room via REST API. For Ad-Hoc rooms this value cannot be changed. |
  | `enable_turn` | Deprecated, now always considered to be true. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `end_time` | The UTC end time of the room in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601#UTC) format.. Format: date-time |
  | `large_room` | Indicates if this is a large room. |
  | `links` | The URLs of related resources.. Format: uri-map |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `max_concurrent_published_tracks` | The maximum number of published audio, video, and data tracks all participants combined are allowed to publish in the room at the same time. Check [Programmable Video Limits](https://www.twilio.com/docs/video/programmable-video-limits) for more details. If it is set to 0 it means unconstrained. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `max_participant_duration` | The maximum number of seconds a Participant can be connected to the room. The maximum possible value is 86400 seconds (24 hours). The default is 14400 seconds (4 hours). |
  | `max_participants` | The maximum number of concurrent Participants allowed in the room.  |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `media_region` | The region for the Room's media server.  Can be one of the [available Media Regions](https://www.twilio.com/docs/video/ip-addresses#media-servers). |
  | `record_participants_on_connect` | Whether to start recording when Participants connect. |
  | `sid` | The unique string that Twilio created to identify the Room resource. |
  | `status` | Values: `in-progress`, `completed`, `failed` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status_callback` | The URL Twilio calls using the `status_callback_method` to send status information to your application on every room event. See [Status Callbacks](https://www.twilio.com/docs/video/api/status-callbacks) for more info.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status_callback_method` | The HTTP method Twilio uses to call `status_callback`. Can be `POST` or `GET` and defaults to `POST`.. Values: `GET`, `POST`. Format: http-method |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `type` | Type of room. Use `group` for new implementations. `go`, `peer-to-peer`, and `group-small` are deprecated.. Values: `group`, `go`, `peer-to-peer`, `group-small` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `unique_name` | An application-defined string that uniquely identifies the resource. It can be used as a `room_sid` in place of the resource's `sid` in the URL to address the resource, assuming it does not contain any [reserved characters](https://tools.ietf.org/html/rfc3986#section-2.2) that would need to be URL encoded. This value is unique for `in-progress` rooms. SDK clients can use this name to connect to the room. REST API clients can use this name in place of the Room SID to interact with the room as long as the room is `in-progress`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `unused_room_timeout` | Specifies how long (in minutes) a room will remain active if no one joins. Can be configured when creating a room via REST API. For Ad-Hoc rooms this value cannot be changed. |
  | `url` | The absolute URL of the resource.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `video_codecs` | An array of the video codecs that are supported when publishing a track in the room.  Can be: `VP8` and `H264`. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          audio_only: boolean() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          duration: integer() | nil,
          empty_room_timeout: integer(),
          enable_turn: boolean() | nil,
          end_time: String.t() | nil,
          large_room: boolean() | nil,
          links: map() | nil,
          max_concurrent_published_tracks: integer() | nil,
          max_participant_duration: integer(),
          max_participants: integer(),
          media_region: String.t() | nil,
          record_participants_on_connect: boolean() | nil,
          sid: String.t() | nil,
          status: String.t(),
          status_callback: String.t() | nil,
          status_callback_method: String.t() | nil,
          type: String.t(),
          unique_name: String.t() | nil,
          unused_room_timeout: integer(),
          url: String.t() | nil,
          video_codecs: list() | nil
        }

  defstruct [
    :account_sid,
    :audio_only,
    :date_created,
    :date_updated,
    :duration,
    :empty_room_timeout,
    :enable_turn,
    :end_time,
    :large_room,
    :links,
    :max_concurrent_published_tracks,
    :max_participant_duration,
    :max_participants,
    :media_region,
    :record_participants_on_connect,
    :sid,
    :status,
    :status_callback,
    :status_callback_method,
    :type,
    :unique_name,
    :unused_room_timeout,
    :url,
    :video_codecs
  ]

  @object_name "video.v1.room"
  def object_name, do: @object_name

  @sid_prefix "RM"
  def sid_prefix, do: @sid_prefix
end
