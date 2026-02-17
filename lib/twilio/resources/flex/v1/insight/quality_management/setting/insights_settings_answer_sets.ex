# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Flex.V1.Insight.QualityManagement.Setting.InsightsSettingsAnswerSets do
  @moduledoc """
  InsightsSettingsAnswerSets resource.

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Flex Insights resource and owns this resource. |
  | `answer_set_categories` | The list of answer set categories |
  | `answer_sets` | The lis of answer sets |
  | `not_applicable` | The details for not applicable answer set |
  | `url` | Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          answer_set_categories: String.t() | nil,
          answer_sets: String.t() | nil,
          not_applicable: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:account_sid, :answer_set_categories, :answer_sets, :not_applicable, :url]

  @object_name "flex.v1.insights_settings_answersets"
  def object_name, do: @object_name
end
