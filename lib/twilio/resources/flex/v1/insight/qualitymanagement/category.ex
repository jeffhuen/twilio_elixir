# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Flex.V1.Insight.Qualitymanagement.Category do
  @moduledoc """


  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Flex Insights resource and owns this resource. |
  | `category_sid` | The SID of the category |
  | `name` | The name of this category. |
  | `url` | Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          category_sid: String.t() | nil,
          name: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:account_sid, :category_sid, :name, :url]

  @object_name "flex.v1.insights_questionnaires_category"
  def object_name, do: @object_name
end
