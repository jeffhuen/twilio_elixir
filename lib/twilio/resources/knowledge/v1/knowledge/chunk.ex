# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Knowledge.V1.Knowledge.Chunk do
  @moduledoc """
  Chunk resource.

  Parent: `/Knowledge/{id}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Knowledge resource. |
  | `content` | The chunk content. |
  | `date_created` | The date and time in GMT when the Chunk was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `date_updated` | The date and time in GMT when the Chunk was updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `metadata` | The metadata of the chunk. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t(),
          content: String.t(),
          date_created: String.t(),
          date_updated: String.t(),
          metadata: map()
        }

  defstruct [:account_sid, :content, :date_created, :date_updated, :metadata]

  @object_name "knowledge.v1.service.knowledge_chunk"
  def object_name, do: @object_name
end
