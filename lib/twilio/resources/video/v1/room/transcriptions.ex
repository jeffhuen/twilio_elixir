# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Video.V1.Room.Transcriptions do
  @moduledoc """
  transcriptions in video rooms

  Parent: `/Rooms/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Room resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `configuration` | An JSON object that describes the video layout of the composition in terms of regions. See [Specifying Video Layouts](https://www.twilio.com/docs/video/api/compositions-resource#specifying-video-layouts) for more info.. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `duration` | The duration in seconds that the transcriptions were `connected`. Populated only after the transcriptions is `stopped`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `end_time` | The time when the transcriptions disconnected from the room in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601#UTC) format.. Format: date-time |
  | `room_sid` | The SID of the transcriptions's room. |
  | `source_sid` | The SID of the transcriptions's associated call. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `start_time` | The time of transcriptions connected to the room in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601#UTC) format.. Format: date-time |
  | `status` | The status of the transcriptions resource.. Values: `started`, `stopped`, `failed` |
  | `ttid` | The unique string that we created to identify the transcriptions resource. |
  | `url` | The absolute URL of the resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          configuration: map() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          duration: integer() | nil,
          end_time: String.t() | nil,
          room_sid: String.t() | nil,
          source_sid: String.t() | nil,
          start_time: String.t() | nil,
          status: String.t(),
          ttid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :configuration,
    :date_created,
    :date_updated,
    :duration,
    :end_time,
    :room_sid,
    :source_sid,
    :start_time,
    :status,
    :ttid,
    :url
  ]

  @object_name "video.v1.room.room_transcriptions"
  def object_name, do: @object_name
end
