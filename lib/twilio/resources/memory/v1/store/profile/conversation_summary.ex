# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Memory.V1.Store.Profile.ConversationSummary do
  @moduledoc """
  ConversationSummary resource.

  A summary memory derived from conversations.

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `content` | The main content of the summary. |
  | `createdAt` | The timestamp when the summary was created.. Format: date-time |
  | `occurredAt` | The timestamp when the summary was originally created.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `source` | The source system that generated the summary. Allows letters, numbers, spaces, and URL-safe symbols. Excludes URL-unsafe characters like quotes, angle brackets, and control characters. |
  | `updatedAt` | The timestamp when the summary was last updated.. Format: date-time |
  """

  @type t :: %__MODULE__{
          content: String.t(),
          conversationId: String.t(),
          createdAt: String.t(),
          id: String.t(),
          occurredAt: String.t(),
          source: String.t(),
          updatedAt: String.t()
        }

  defstruct [:content, :conversationId, :createdAt, :id, :occurredAt, :source, :updatedAt]

  @object_name "SummaryInfo"
  def object_name, do: @object_name
end
