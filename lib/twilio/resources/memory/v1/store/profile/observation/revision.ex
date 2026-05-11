# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Memory.V1.Store.Profile.Observation.Revision do
  @moduledoc """
  Revision resource.

  A transient and mutable observation memory associated with a profile.

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `content` | The main content of the observation. |
  | `conversationIds` | Array of conversation IDs associated with this observation. |
  | `createdAt` | The timestamp when the observation was created.. Format: date-time |
  | `occurredAt` | The timestamp when the observation originally occurred.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `source` | The source system that generated this observation. Allows letters, numbers, spaces, and URL-safe symbols. Excludes URL-unsafe characters like quotes, angle brackets, and control characters. |
  | `updatedAt` | The timestamp when the observation was last updated.. Format: date-time |
  """

  @type t :: %__MODULE__{
          content: String.t(),
          conversationIds: list(),
          createdAt: String.t(),
          id: String.t(),
          occurredAt: String.t(),
          source: String.t(),
          updatedAt: String.t()
        }

  defstruct [:content, :conversationIds, :createdAt, :id, :occurredAt, :source, :updatedAt]

  @object_name "ObservationInfo"
  def object_name, do: @object_name
end
