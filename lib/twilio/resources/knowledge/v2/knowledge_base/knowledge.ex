# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Knowledge.V2.KnowledgeBase.Knowledge do
  @moduledoc """
  Knowledge resource.

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `createdAt` | The date and time in GMT when the Knowledge was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `description` | A detailed description of the knowledge source and when to use it.  This helps provide context about the content and its intended purpose. |
  | `name` | The name of the knowledge source. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status` | The status of processing the knowledge source ('SCHEDULED', 'QUEUED', 'PROCESSING', 'COMPLETED', 'FAILED').. Values: `SCHEDULED`, `QUEUED`, `PROCESSING`, `COMPLETED`, `FAILED` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `updatedAt` | The date and time in GMT when the Knowledge was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  """

  @type t :: %__MODULE__{
          createdAt: String.t(),
          description: String.t(),
          id: String.t(),
          name: String.t(),
          source: String.t(),
          status: String.t(),
          updatedAt: String.t()
        }

  defstruct [:createdAt, :description, :id, :name, :source, :status, :updatedAt]

  @object_name "Knowledge"
  def object_name, do: @object_name
end
