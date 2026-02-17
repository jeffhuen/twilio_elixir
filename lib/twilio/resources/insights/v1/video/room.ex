# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Insights.V1.Video.Room do
  @moduledoc """


  ## Sub-resources
  - `participants` — `/v1/Video/Rooms/{room_sid}/Participants`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | Account SID associated with this room. |
  | `codecs` | Codecs used by participants in the room. Can be `VP8`, `H264`, or `VP9`. |
  | `concurrent_participants` | Actual number of concurrent participants. |
  | `create_time` | Creation time of the room.. Format: date-time |
  | `created_method` | How the room was created. Can be `sdk`, `ad_hoc`, or `api`.. Values: `sdk`, `ad_hoc`, `api` |
  | `duration_sec` | Total room duration from create time to end time.. Format: int64 |
  | `edge_location` | Edge location of Twilio media servers for the room. See [the list of public edge locations](https://www.twilio.com/docs/global-infrastructure/edge-locations#public-edge-locations) for the possible values.. Values: `ashburn`, `dublin`, `frankfurt`, `singapore`, `sydney`, `sao_paulo`, `roaming`, `umatilla`, `tokyo` |
  | `end_reason` | Reason the room ended. Can be `room_ended_via_api` or `timeout`.. Values: `room_ended_via_api`, `timeout` |
  | `end_time` | End time for the room.. Format: date-time |
  | `links` | Room subresources.. Format: uri-map |
  | `max_concurrent_participants` | Maximum number of participants allowed in the room at the same time allowed by the application settings. |
  | `max_participants` | Max number of total participants allowed by the application settings. |
  | `media_region` | Region of Twilio media servers for the room. See [the list of possible media servers here](https://www.twilio.com/docs/video/ip-addresses).. Values: `us1`, `us2`, `au1`, `br1`, `ie1`, `jp1`, `sg1`, `in1`, `de1`, `gll` |
  | `processing_state` | Video Log Analyzer resource state. Will be either `in-progress` or `complete`. `in-progress` indicates that more details may be appended to the resource. `complete` indicates no further information will be added.. Values: `complete`, `in_progress`, `timeout`, `not_started` |
  | `recording_enabled` | Boolean indicating if recording is enabled for the room. |
  | `room_name` | Room friendly name. |
  | `room_sid` | Unique identifier for the room. |
  | `room_status` | Status of the room. Can be `in_progress` or `completed`.. Values: `in_progress`, `completed` |
  | `room_type` | Type of room. Can be `go`, `peer_to_peer`, `group`, or `group_small`.. Values: `go`, `peer_to_peer`, `group`, `group_small` |
  | `status_callback` | Webhook provided for status callbacks.. Format: uri |
  | `status_callback_method` | HTTP method provided for status callback URL.. Values: `GET`, `POST`. Format: http-method |
  | `total_participant_duration_sec` | Combined amount of participant time in the room.. Format: int64 |
  | `total_recording_duration_sec` | Combined amount of recorded seconds for participants in the room.. Format: int64 |
  | `unique_participant_identities` | Unique number of participant identities. |
  | `unique_participants` | Number of participants. May include duplicate identities for participants who left and rejoined. |
  | `url` | URL for the room resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          codecs: list() | nil,
          concurrent_participants: integer() | nil,
          create_time: String.t() | nil,
          created_method: String.t() | nil,
          duration_sec: integer() | nil,
          edge_location: String.t() | nil,
          end_reason: String.t() | nil,
          end_time: String.t() | nil,
          links: map() | nil,
          max_concurrent_participants: integer() | nil,
          max_participants: integer() | nil,
          media_region: String.t() | nil,
          processing_state: String.t() | nil,
          recording_enabled: boolean() | nil,
          room_name: String.t() | nil,
          room_sid: String.t() | nil,
          room_status: String.t() | nil,
          room_type: String.t() | nil,
          status_callback: String.t() | nil,
          status_callback_method: String.t() | nil,
          total_participant_duration_sec: integer() | nil,
          total_recording_duration_sec: integer() | nil,
          unique_participant_identities: integer() | nil,
          unique_participants: integer() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :codecs,
    :concurrent_participants,
    :create_time,
    :created_method,
    :duration_sec,
    :edge_location,
    :end_reason,
    :end_time,
    :links,
    :max_concurrent_participants,
    :max_participants,
    :media_region,
    :processing_state,
    :recording_enabled,
    :room_name,
    :room_sid,
    :room_status,
    :room_type,
    :status_callback,
    :status_callback_method,
    :total_participant_duration_sec,
    :total_recording_duration_sec,
    :unique_participant_identities,
    :unique_participants,
    :url
  ]

  @object_name "insights.v1.video_room_summary"
  def object_name, do: @object_name
end
