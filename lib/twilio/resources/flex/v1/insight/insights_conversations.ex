# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Flex.V1.Insight.InsightsConversations do
  @moduledoc """


  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_id` | The id of the account. |
  | `conversation_id` | The unique id of the conversation |
  | `segment_count` | The count of segments for a conversation |
  | `segments` | The Segments of a conversation |
  """

  @type t :: %__MODULE__{
          account_id: String.t() | nil,
          conversation_id: String.t() | nil,
          segment_count: integer(),
          segments: list() | nil
        }

  defstruct [:account_id, :conversation_id, :segment_count, :segments]

  @object_name "flex.v1.insights_conversations"
  def object_name, do: @object_name
end
