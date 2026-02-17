# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Flex.V1.Insight.Qualitymanagement.InsightsQuestionnaires do
  @moduledoc """


  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Flex Insights resource and owns this resource. |
  | `active` | The flag to enable or disable questionnaire |
  | `description` | The description of this questionnaire |
  | `name` | The name of this category. |
  | `questionnaire_sid` | The sid of this questionnaire |
  | `questions` | The list of questions with category for a questionnaire |
  | `url` | Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          active: boolean() | nil,
          description: String.t() | nil,
          name: String.t() | nil,
          questionnaire_sid: String.t() | nil,
          questions: list() | nil,
          url: String.t() | nil
        }

  defstruct [:account_sid, :active, :description, :name, :questionnaire_sid, :questions, :url]

  @object_name "flex.v1.insights_questionnaires"
  def object_name, do: @object_name
end
