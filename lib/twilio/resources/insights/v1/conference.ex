# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Insights.V1.Conference do
  @moduledoc """


  ## Sub-resources
  - `conference_participants` — `/v1/Conferences/{conference_sid}/Participants`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The unique SID identifier of the Account. |
  | `conference_sid` | The unique SID identifier of the Conference. |
  | `connect_duration_seconds` | Duration of the between conference start event and conference end event in seconds. |
  | `create_time` | Conference creation date and time in ISO 8601 format.. Format: date-time |
  | `detected_issues` | Potential issues detected by Twilio during the conference. |
  | `duration_seconds` | Conference duration in seconds. |
  | `end_reason` | Conference end reason; e.g. last participant left, modified by API, etc.. Values: `last_participant_left`, `conference_ended_via_api`, `participant_with_end_conference_on_exit_left`, `last_participant_kicked`, `participant_with_end_conference_on_exit_kicked` |
  | `end_time` | Conference end date and time in ISO 8601 format.. Format: date-time |
  | `ended_by` | Call SID of the participant whose actions ended the conference. |
  | `friendly_name` | Custom label for the conference resource, up to 64 characters.. PII: standard |
  | `links` | Contains a dictionary of URL links to nested resources of this Conference.. Format: uri-map |
  | `max_concurrent_participants` | Actual maximum number of concurrent participants in the conference. |
  | `max_participants` | Maximum number of concurrent participants as specified by the configuration. |
  | `mixer_region` | Twilio region where the conference media was mixed.. Values: `us1`, `us2`, `au1`, `br1`, `ie1`, `jp1`, `sg1`, `de1`, `in1` |
  | `mixer_region_requested` | Twilio region where conference mixed was specified to be mixed in configuration.. Values: `us1`, `us2`, `au1`, `br1`, `ie1`, `jp1`, `sg1`, `de1`, `in1` |
  | `processing_state` | Processing state for the Conference Summary resource. Will be `in_progress` while data is being aggregated, `timeout` if Twilio couldn't process the summary in 24hrs, and `complete` once aggregations and analysis has ended.. Values: `complete`, `in_progress`, `timeout` |
  | `recording_enabled` | Boolean. Indicates whether recording was enabled at the conference mixer. |
  | `start_time` | Timestamp in ISO 8601 format when the conference started. Conferences do not start until at least two participants join, at least one of whom has startConferenceOnEnter=true.. Format: date-time |
  | `status` | Status of this Conference; `in_progress`, `not_started`, `completed` or `summary_timeout`. if Twilio don't receive `last_participant_left` event, summary will be timeout after 24 hours. Values: `in_progress`, `not_started`, `completed`, `summary_timeout` |
  | `tag_info` | Object. Contains details about conference tags including severity. |
  | `tags` | Tags for detected conference conditions and participant behaviors which may be of interest. |
  | `unique_participants` | Unique conference participants based on caller ID. |
  | `url` | The URL of this resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          conference_sid: String.t() | nil,
          connect_duration_seconds: integer() | nil,
          create_time: String.t() | nil,
          detected_issues: String.t() | nil,
          duration_seconds: integer() | nil,
          end_reason: String.t() | nil,
          end_time: String.t() | nil,
          ended_by: String.t() | nil,
          friendly_name: String.t() | nil,
          links: map() | nil,
          max_concurrent_participants: integer() | nil,
          max_participants: integer() | nil,
          mixer_region: String.t() | nil,
          mixer_region_requested: String.t() | nil,
          processing_state: String.t() | nil,
          recording_enabled: boolean() | nil,
          start_time: String.t() | nil,
          status: String.t() | nil,
          tag_info: String.t() | nil,
          tags: list() | nil,
          unique_participants: integer() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :conference_sid,
    :connect_duration_seconds,
    :create_time,
    :detected_issues,
    :duration_seconds,
    :end_reason,
    :end_time,
    :ended_by,
    :friendly_name,
    :links,
    :max_concurrent_participants,
    :max_participants,
    :mixer_region,
    :mixer_region_requested,
    :processing_state,
    :recording_enabled,
    :start_time,
    :status,
    :tag_info,
    :tags,
    :unique_participants,
    :url
  ]

  @object_name "insights.v1.conference"
  def object_name, do: @object_name
end
