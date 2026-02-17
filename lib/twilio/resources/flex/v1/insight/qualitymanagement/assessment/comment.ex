# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Flex.V1.Insight.Qualitymanagement.Assessment.Comment do
  @moduledoc """
  Comment resource.

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Flex Insights resource and owns this resource. |
  | `agent_id` | The id of the agent. |
  | `assessment_sid` | The SID of the assessment. |
  | `comment` | The comment added for assessment. |
  | `offset` | The offset |
  | `report` | The flag indicating if this assessment is part of report  |
  | `segment_id` | The id of the segment. |
  | `timestamp` | The timestamp when the record is inserted |
  | `url` | Format: uri |
  | `user_email` | The email id of the user. |
  | `user_name` | The name of the user. |
  | `weight` | The weightage given to this comment |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          agent_id: String.t() | nil,
          assessment_sid: String.t() | nil,
          comment: String.t() | nil,
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
    :assessment_sid,
    :comment,
    :offset,
    :report,
    :segment_id,
    :timestamp,
    :url,
    :user_email,
    :user_name,
    :weight
  ]

  @object_name "flex.v1.insights_assessments_comment"
  def object_name, do: @object_name
end
