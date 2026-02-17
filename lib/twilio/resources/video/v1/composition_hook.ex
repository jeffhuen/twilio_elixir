# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Video.V1.CompositionHook do
  @moduledoc """
  Recording composition hooks

  SID prefix: `HK`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the CompositionHook resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `audio_sources` | The array of track names to include in the compositions created by the composition hook. A composition triggered by the composition hook includes all audio sources specified in `audio_sources` except those specified in `audio_sources_excluded`. The track names in this property can include an asterisk as a wild card character, which matches zero or more characters in a track name. For example, `student*` includes tracks named `student` as well as `studentTeam`. Please, be aware that either video_layout or audio_sources have to be provided to get a valid creation request. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `audio_sources_excluded` | The array of track names to exclude from the compositions created by the composition hook. A composition triggered by the composition hook includes all audio sources specified in `audio_sources` except for those specified in `audio_sources_excluded`. The track names in this property can include an asterisk as a wild card character, which matches zero or more characters in a track name. For example, `student*` excludes `student` as well as `studentTeam`. This parameter can also be empty.. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `enabled` | Whether the CompositionHook is active. When `true`, the CompositionHook is triggered for every completed Group Room on the account. When `false`, the CompositionHook is never triggered. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `format` | The container format of the media files used by the compositions created by the composition hook. If `mp4` or `webm`, `audio_sources` must have one or more tracks and/or a `video_layout` element must contain a valid `video_sources` list, otherwise an error occurs.. Values: `mp4`, `webm` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `friendly_name` | The string that you assigned to describe the resource. Can be up to 100 characters long and must be unique within the account. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `resolution` | The dimensions of the video image in pixels expressed as columns (width) and rows (height). The string's format is `{width}x{height}`, such as `640x480`. |
  | `sid` | The unique string that we created to identify the CompositionHook resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status_callback` | The URL we call using the `status_callback_method` to send status information to your application.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status_callback_method` | The HTTP method we should use to call `status_callback`. Can be `POST` or `GET` and defaults to `POST`.. Values: `GET`, `POST`. Format: http-method |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `trim` | Whether intervals with no media are clipped, as specified in the POST request that created the CompositionHook resource. Compositions with `trim` enabled are shorter when the Room is created and no Participant joins for a while as well as if all the Participants leave the room and join later, because those gaps will be removed. See [Specifying Video Layouts](https://www.twilio.com/docs/video/api/compositions-resource#specifying-video-layouts) for more info. |
  | `url` | The absolute URL of the resource.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `video_layout` | A JSON object that describes the video layout of the composition in terms of regions as specified in the HTTP POST request that created the CompositionHook resource. See [POST Parameters](https://www.twilio.com/docs/video/api/compositions-resource#http-post-parameters) for more information. Please, be aware that either video_layout or audio_sources have to be provided to get a valid creation request. PII: standard |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          audio_sources: list() | nil,
          audio_sources_excluded: list() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          enabled: boolean() | nil,
          format: String.t(),
          friendly_name: String.t() | nil,
          resolution: String.t() | nil,
          sid: String.t() | nil,
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
    :date_created,
    :date_updated,
    :enabled,
    :format,
    :friendly_name,
    :resolution,
    :sid,
    :status_callback,
    :status_callback_method,
    :trim,
    :url,
    :video_layout
  ]

  @object_name "video.v1.composition_hook"
  def object_name, do: @object_name

  @sid_prefix "HK"
  def sid_prefix, do: @sid_prefix
end
