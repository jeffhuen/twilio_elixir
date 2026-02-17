# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Video.V1.Composition do
  @moduledoc """
  Recording compositions

  SID prefix: `CJ`

  ## Sub-resources
  - `media` — `/v1/Compositions/{composition_sid}/Media`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Composition resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `audio_sources` | The array of track names to include in the composition. The composition includes all audio sources specified in `audio_sources` except those specified in `audio_sources_excluded`. The track names in this property can include an asterisk as a wild card character, which matches zero or more characters in a track name. For example, `student*` includes tracks named `student` as well as `studentTeam`.. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `audio_sources_excluded` | The array of track names to exclude from the composition. The composition includes all audio sources specified in `audio_sources` except for those specified in `audio_sources_excluded`. The track names in this property can include an asterisk as a wild card character, which matches zero or more characters in a track name. For example, `student*` excludes `student` as well as `studentTeam`. This parameter can also be empty.. PII: standard |
  | `bitrate` | The average bit rate of the composition's media. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_completed` | The date and time in GMT when the composition's media processing task finished, specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_deleted` | The date and time in GMT when the composition generated media was deleted, specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `duration` | The duration of the composition's media file in seconds. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `format` | The container format of the composition's media files as specified in the POST request that created the Composition resource. See [POST Parameters](https://www.twilio.com/docs/video/api/compositions-resource#http-post-parameters) for more information.. Values: `mp4`, `webm` |
  | `links` | The URL of the media file associated with the composition.. Format: uri-map |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `media_external_location` | The URL of the media file associated with the composition when stored externally. See [External S3 Compositions](https://www.twilio.com/docs/video/api/external-s3-compositions) for more details.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `resolution` | The dimensions of the video image in pixels expressed as columns (width) and rows (height). The string's format is `{width}x{height}`, such as `640x480`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `room_sid` | The SID of the Group Room that generated the audio and video tracks used in the composition. All media sources included in a composition must belong to the same Group Room. |
  | `sid` | The unique string that we created to identify the Composition resource. |
  | `size` | The size of the composed media file in bytes.. Format: int64 |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status` | The status of the composition. Can be: `enqueued`, `processing`, `completed`, `deleted` or `failed`. `enqueued` is the initial state and indicates that the composition request has been received and is scheduled for processing; `processing` indicates the composition is being processed; `completed` indicates the composition has been completed and is available for download; `deleted` means the composition media has been deleted from the system, but its metadata is still available for 30 days; `failed` indicates the composition failed to execute the media processing task.. Values: `enqueued`, `processing`, `completed`, `deleted`, `failed` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status_callback` | The URL called using the `status_callback_method` to send status information on every composition event.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status_callback_method` | The HTTP method used to call `status_callback`. Can be: `POST` or `GET`, defaults to `POST`.. Values: `GET`, `POST`. Format: http-method |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `trim` | Whether to remove intervals with no media, as specified in the POST request that created the composition. Compositions with `trim` enabled are shorter when the Room is created and no Participant joins for a while as well as if all the Participants leave the room and join later, because those gaps will be removed. See [Specifying Video Layouts](https://www.twilio.com/docs/video/api/compositions-resource#specifying-video-layouts) for more info. |
  | `url` | The absolute URL of the resource.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `video_layout` | An object that describes the video layout of the composition in terms of regions. See [Specifying Video Layouts](https://www.twilio.com/docs/video/api/compositions-resource#specifying-video-layouts) for more info.. PII: standard |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          audio_sources: list() | nil,
          audio_sources_excluded: list() | nil,
          bitrate: integer(),
          date_completed: String.t() | nil,
          date_created: String.t() | nil,
          date_deleted: String.t() | nil,
          duration: integer(),
          format: String.t(),
          links: map() | nil,
          media_external_location: String.t() | nil,
          resolution: String.t() | nil,
          room_sid: String.t() | nil,
          sid: String.t() | nil,
          size: integer() | nil,
          status: String.t(),
          status_callback: String.t() | nil,
          status_callback_method: String.t() | nil,
          trim: boolean() | nil,
          url: String.t() | nil,
          video_layout: String.t() | nil
        }

  defstruct [
    :account_sid,
    :audio_sources,
    :audio_sources_excluded,
    :bitrate,
    :date_completed,
    :date_created,
    :date_deleted,
    :duration,
    :format,
    :links,
    :media_external_location,
    :resolution,
    :room_sid,
    :sid,
    :size,
    :status,
    :status_callback,
    :status_callback_method,
    :trim,
    :url,
    :video_layout
  ]

  @object_name "video.v1.composition"
  def object_name, do: @object_name

  @sid_prefix "CJ"
  def sid_prefix, do: @sid_prefix
end
