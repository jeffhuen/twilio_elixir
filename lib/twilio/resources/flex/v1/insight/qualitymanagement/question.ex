# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Flex.V1.Insight.Qualitymanagement.Question do
  @moduledoc """


  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Flex Insights resource and owns this resource. |
  | `allow_na` | The flag  to enable for disable NA for answer. |
  | `answer_set` | Set of answers for the question |
  | `answer_set_id` | The answer_set for the question. |
  | `category` | The Category for the question. |
  | `description` | The description for the question. |
  | `question` | The question. |
  | `question_sid` | The SID of the question |
  | `url` | Format: uri |
  | `usage` | Integer value that tells a particular question is used by how many questionnaires |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          allow_na: boolean() | nil,
          answer_set: String.t() | nil,
          answer_set_id: String.t() | nil,
          category: String.t() | nil,
          description: String.t() | nil,
          question: String.t() | nil,
          question_sid: String.t() | nil,
          url: String.t() | nil,
          usage: integer()
        }

  defstruct [
    :account_sid,
    :allow_na,
    :answer_set,
    :answer_set_id,
    :category,
    :description,
    :question,
    :question_sid,
    :url,
    :usage
  ]

  @object_name "flex.v1.insights_questionnaires_question"
  def object_name, do: @object_name
end
