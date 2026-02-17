# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Flex.V1.Insight.Qualitymanagement.Setting.Commenttag do
  @moduledoc """
  Commenttag resource.

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Flex Insights resource and owns this resource. |
  | `url` | Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          comments: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:account_sid, :comments, :url]

  @object_name "flex.v1.insights_settings_comment"
  def object_name, do: @object_name
end
