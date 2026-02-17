# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Insights.V1.Video.Room.Participant do
  @moduledoc """
  Participant resource.

  Parent: `/Video/Rooms/{RoomSid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | Account SID associated with the room. |
  | `codecs` | Codecs detected from the participant. Can be `VP8`, `H264`, or `VP9`. |
  | `duration_sec` | Amount of time in seconds the participant was in the room.. Format: int64 |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `edge_location` | Name of the edge location the participant connected to. See [the list of public edge locations](https://www.twilio.com/docs/global-infrastructure/edge-locations#public-edge-locations) for the possible values.. Values: `ashburn`, `dublin`, `frankfurt`, `singapore`, `sydney`, `sao_paulo`, `roaming`, `umatilla`, `tokyo` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `end_reason` | Reason the participant left the room. See [the list of possible values here](https://www.twilio.com/docs/video/troubleshooting/video-log-analyzer-api#end_reason). |
  | `error_code` | Errors encountered by the participant. |
  | `error_code_url` | Twilio error code dictionary link. |
  | `join_time` | When the participant joined the room.. Format: date-time |
  | `leave_time` | When the participant left the room.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `media_region` | Twilio media region the participant connected to. See [the list of possible media servers here](https://www.twilio.com/docs/video/ip-addresses).. Values: `us1`, `us2`, `au1`, `br1`, `ie1`, `jp1`, `sg1`, `in1`, `de1`, `gll` |
  | `participant_identity` | The application-defined string that uniquely identifies the participant within a Room. |
  | `participant_sid` | Unique identifier for the participant. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `properties` | Object containing information about the participant's data from the room. See [below](https://www.twilio.com/docs/video/troubleshooting/video-log-analyzer-api#properties) for more information. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `publisher_info` | Object containing information about the SDK name and version. See [below](https://www.twilio.com/docs/video/troubleshooting/video-log-analyzer-api#publisher_info) for more information. |
  | `room_sid` | Unique identifier for the room. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status` | Status of the room. Can be `in_progress` or `completed`.. Values: `in_progress`, `connected`, `completed`, `disconnected` |
  | `url` | URL of the participant resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          codecs: list() | nil,
          duration_sec: integer() | nil,
          edge_location: String.t() | nil,
          end_reason: String.t() | nil,
          error_code: integer() | nil,
          error_code_url: String.t() | nil,
          join_time: String.t() | nil,
          leave_time: String.t() | nil,
          media_region: String.t() | nil,
          participant_identity: String.t() | nil,
          participant_sid: String.t() | nil,
          properties: String.t() | nil,
          publisher_info: String.t() | nil,
          room_sid: String.t() | nil,
          status: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :codecs,
    :duration_sec,
    :edge_location,
    :end_reason,
    :error_code,
    :error_code_url,
    :join_time,
    :leave_time,
    :media_region,
    :participant_identity,
    :participant_sid,
    :properties,
    :publisher_info,
    :room_sid,
    :status,
    :url
  ]

  @object_name "insights.v1.video_room_summary.video_participant_summary"
  def object_name, do: @object_name
end
