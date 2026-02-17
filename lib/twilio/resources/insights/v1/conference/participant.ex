# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Insights.V1.Conference.Participant do
  @moduledoc """


  Parent: `/Conferences/{ConferenceSid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The unique SID identifier of the Account. |
  | `call_direction` | Call direction of the participant; inbound or outbound.. Values: `inbound`, `outbound` |
  | `call_sid` | Unique SID identifier of the call that generated the Participant resource. |
  | `call_status` | Call status of the call that generated the participant.. Values: `answered`, `completed`, `busy`, `fail`, `noanswer`, `ringing`, `canceled` |
  | `call_type` | The Call Type of this Conference Participant. One of `carrier`, `client` or `sip`.. Values: `carrier`, `client`, `sip` |
  | `coached_participants` | Call SIDs coached by this participant. |
  | `conference_region` | The Conference Region of this Conference Participant. One of `us1`, `us2`, `au1`, `br1`, `ie1`, `jp1`, `sg1` or `de1`.. Values: `us1`, `us2`, `au1`, `br1`, `ie1`, `jp1`, `sg1`, `de1`, `in1` |
  | `conference_sid` | The unique SID identifier of the Conference. |
  | `country_code` | ISO alpha-2 country code of the participant based on caller ID or called number. |
  | `duration_seconds` | Participant durations in seconds. |
  | `events` | Object containing information of actions taken by participants. Contains a dictionary of URL links to nested resources of this Conference Participant. |
  | `from` | Caller ID of the calling party.. PII: standard |
  | `is_coach` | Boolean. Indicated whether participant was a coach. |
  | `is_moderator` | Boolean. Indicates whether participant had startConferenceOnEnter=true or endConferenceOnExit=true. |
  | `jitter_buffer_size` | The Jitter Buffer Size of this Conference Participant. One of `large`, `small`, `medium` or `off`.. Values: `large`, `small`, `medium`, `off` |
  | `join_time` | ISO 8601 timestamp of participant join event.. Format: date-time |
  | `label` | The user-specified label of this participant.. PII: standard |
  | `leave_time` | ISO 8601 timestamp of participant leave event.. Format: date-time |
  | `metrics` | Object. Contains participant call quality metrics. |
  | `outbound_queue_length` | Add Participant API only. Estimated time in queue at call creation. |
  | `outbound_time_in_queue` | Add Participant API only. Actual time in queue in seconds. |
  | `participant_region` | Twilio region where the participant media originates.. Values: `us1`, `us2`, `au1`, `br1`, `ie1`, `jp1`, `sg1`, `de1`, `in1` |
  | `participant_sid` | SID for this participant. |
  | `processing_state` | Processing state of the Participant Summary. Will be `in_progress` while data is being aggregated, `timeout` if Twilio couldn't process the summary in 24hrs, and `complete` once aggregations and analysis has ended.. Values: `complete`, `in_progress`, `timeout` |
  | `properties` | Participant properties and metadata. |
  | `to` | Called party.. PII: standard |
  | `url` | The URL of this resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          call_direction: String.t() | nil,
          call_sid: String.t() | nil,
          call_status: String.t() | nil,
          call_type: String.t() | nil,
          coached_participants: list() | nil,
          conference_region: String.t() | nil,
          conference_sid: String.t() | nil,
          country_code: String.t() | nil,
          duration_seconds: integer() | nil,
          events: String.t() | nil,
          from: String.t() | nil,
          is_coach: boolean() | nil,
          is_moderator: boolean() | nil,
          jitter_buffer_size: String.t() | nil,
          join_time: String.t() | nil,
          label: String.t() | nil,
          leave_time: String.t() | nil,
          metrics: String.t() | nil,
          outbound_queue_length: integer() | nil,
          outbound_time_in_queue: integer() | nil,
          participant_region: String.t() | nil,
          participant_sid: String.t() | nil,
          processing_state: String.t() | nil,
          properties: String.t() | nil,
          to: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :call_direction,
    :call_sid,
    :call_status,
    :call_type,
    :coached_participants,
    :conference_region,
    :conference_sid,
    :country_code,
    :duration_seconds,
    :events,
    :from,
    :is_coach,
    :is_moderator,
    :jitter_buffer_size,
    :join_time,
    :label,
    :leave_time,
    :metrics,
    :outbound_queue_length,
    :outbound_time_in_queue,
    :participant_region,
    :participant_sid,
    :processing_state,
    :properties,
    :to,
    :url
  ]

  @object_name "insights.v1.conference.conference_participant"
  def object_name, do: @object_name
end
