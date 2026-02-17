# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Flex.V1.Insight.Qualitymanagement.Assessments do
  @moduledoc """


  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The unique SID identifier of the Account. |
  | `agent_id` | The id of the Agent |
  | `answer_id` | The id of the answer selected by user |
  | `answer_text` | The answer text selected by user |
  | `assessment` | Assessment Details associated with an assessment |
  | `assessment_sid` | The SID of the assessment |
  | `offset` | Offset of the conversation |
  | `report` | The flag indicating if this assessment is part of report  |
  | `segment_id` | Segment Id of conversation |
  | `url` | Format: uri |
  | `user_email` | The email id of the user. |
  | `user_name` | The name of the user. |
  | `weight` | The weightage given to this comment |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          agent_id: String.t() | nil,
          answer_id: String.t() | nil,
          answer_text: String.t() | nil,
          assessment: String.t() | nil,
          assessment_sid: String.t() | nil,
          offset: String.t() | nil,
          report: boolean() | nil,
          segment_id: String.t() | nil,
          timestamp: String.t() | nil,
          url: String.t() | nil,
          user_email: String.t() | nil,
          user_name: String.t() | nil,
          weight: String.t() | nil
        }

  defstruct [
    :account_sid,
    :agent_id,
    :answer_id,
    :answer_text,
    :assessment,
    :assessment_sid,
    :offset,
    :report,
    :segment_id,
    :timestamp,
    :url,
    :user_email,
    :user_name,
    :weight
  ]

  @object_name "flex.v1.insights_assessments"
  def object_name, do: @object_name
end
