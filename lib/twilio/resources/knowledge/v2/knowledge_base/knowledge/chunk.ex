# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Knowledge.V2.KnowledgeBase.Knowledge.Chunk do
  @moduledoc """
  Chunk resource.

  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Represents a processed content chunk extracted from knowledge source.  Chunks are smaller segments of content that have been parsed and indexed  for semantic search operations, containing the original text content.

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `content` | The chunk content. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `createdAt` | The date and time in GMT when the Chunk was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  """

  @type t :: %__MODULE__{
          content: String.t(),
          createdAt: String.t()
        }

  defstruct [:content, :createdAt]

  @object_name "KnowledgeChunk"
  def object_name, do: @object_name
end
