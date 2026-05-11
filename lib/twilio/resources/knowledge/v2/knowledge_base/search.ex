# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Knowledge.V2.KnowledgeBase.Search do
  @moduledoc """
  Search resource.

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `content` | The chunk content. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `createdAt` | The date and time in GMT when the Chunk was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `score` | The score associated with the chunk.. Format: float |
  """

  @type t :: %__MODULE__{
          content: String.t(),
          createdAt: String.t(),
          knowledgeId: String.t(),
          score: float()
        }

  defstruct [:content, :createdAt, :knowledgeId, :score]

  @object_name "KnowledgeChunkResult"
  def object_name, do: @object_name
end
