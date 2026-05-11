# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Memory.V1.Store.Profile.Recall do
  @moduledoc """
  Recall resource.

  Response containing retrieved profile memories organized by type.

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `communications` | Array of recent communication context. |
  | `meta` | Metadata about the retrieval operation. |
  | `observations` | Array of observation memories. |
  | `summaries` | Array of summary memories derived from observations at the end of conversations. |
  """

  @type t :: %__MODULE__{
          communications: list(),
          meta: map(),
          observations: list(),
          summaries: list()
        }

  defstruct [:communications, :meta, :observations, :summaries]

  @object_name "MemoryRetrievalResponse"
  def object_name, do: @object_name
end
