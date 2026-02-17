# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Flex.V1.Insight.InsightsSegments do
  @moduledoc """


  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_id` | The unique id for the account. |
  | `agent_id` | The unique id for the agent. |
  | `agent_link` | The link to the agent conversation. |
  | `agent_name` | The name of the agent. |
  | `agent_phone` | The phone number of the agent. |
  | `agent_team_name` | The team name to which agent belongs. |
  | `agent_team_name_in_hierarchy` | he team name to which agent belongs. |
  | `assessment_percentage` | The percentage scored on the Assessments. |
  | `assessment_type` | The type of the assessment. |
  | `customer_link` | The link to the customer conversation. |
  | `customer_name` | The name of the customer. |
  | `customer_phone` | The phone number of the customer. |
  | `date` | The date of the conversation. |
  | `external_id` | The unique id for the conversation. |
  | `external_segment_link` | The hyperlink to recording of the task event. |
  | `external_segment_link_id` | The uuid for the external_segment_link. |
  | `media` | The media identifiers of the conversation. |
  | `segment_id` | To unique id of the segment |
  | `segment_recording_offset` | The offset value for the recording. |
  | `url` | Format: uri |
  """

  @type t :: %__MODULE__{
          account_id: String.t() | nil,
          agent_id: String.t() | nil,
          agent_link: String.t() | nil,
          agent_name: String.t() | nil,
          agent_phone: String.t() | nil,
          agent_team_name: String.t() | nil,
          agent_team_name_in_hierarchy: String.t() | nil,
          assessment_percentage: String.t() | nil,
          assessment_type: String.t() | nil,
          customer_link: String.t() | nil,
          customer_name: String.t() | nil,
          customer_phone: String.t() | nil,
          date: String.t() | nil,
          external_contact: String.t() | nil,
          external_id: String.t() | nil,
          external_segment_link: String.t() | nil,
          external_segment_link_id: String.t() | nil,
          media: String.t() | nil,
          queue: String.t() | nil,
          segment_id: String.t() | nil,
          segment_recording_offset: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_id,
    :agent_id,
    :agent_link,
    :agent_name,
    :agent_phone,
    :agent_team_name,
    :agent_team_name_in_hierarchy,
    :assessment_percentage,
    :assessment_type,
    :customer_link,
    :customer_name,
    :customer_phone,
    :date,
    :external_contact,
    :external_id,
    :external_segment_link,
    :external_segment_link_id,
    :media,
    :queue,
    :segment_id,
    :segment_recording_offset,
    :url
  ]

  @object_name "flex.v1.insights_segments"
  def object_name, do: @object_name
end
