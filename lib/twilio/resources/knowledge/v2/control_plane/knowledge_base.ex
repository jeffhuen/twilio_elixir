# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Knowledge.V2.ControlPlane.KnowledgeBase do
  @moduledoc """
  KnowledgeBase resource.

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `createdAt` | The ISO 8601 timestamp when the Knowledge Base was created.. Format: date-time |
  | `description` | A human readable description of this resource, up to 128 characters. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `displayName` | Provides a unique and addressable name to be assigned to this Knowledge Base. This name is assigned by the developer and can be used in addition to the ID. It is intended to be human-readable and unique within the account. |
  | `id` | The unique identifier for the Knowledge Base |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status` | The provisioning status of the Knowledge Base. Values: `QUEUED`, `PROVISIONING`, `ACTIVE`, `FAILED`, `DELETING` |
  | `updatedAt` | The ISO 8601 timestamp when the Knowledge Base was last updated.. Format: date-time |
  | `version` | The current version number of the Knowledge Base. Incremented on each successful mutable update. |
  """

  @type t :: %__MODULE__{
          createdAt: String.t(),
          description: String.t(),
          displayName: String.t(),
          id: String.t(),
          status: String.t(),
          updatedAt: String.t(),
          version: integer()
        }

  defstruct [:createdAt, :description, :displayName, :id, :status, :updatedAt, :version]

  @object_name "KnowledgeBase"
  def object_name, do: @object_name
end
