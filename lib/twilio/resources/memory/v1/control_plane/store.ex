# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Memory.V1.ControlPlane.Store do
  @moduledoc """
  Store resource.

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `description` | A human readable description of this resource, up to 128 characters. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `displayName` | Provides a unique and addressable name to be assigned to this Store. This name is assigned by the developer and can be used in addition to the ID. It is intended to be human-readable and unique within the account. |
  | `id` | The unique identifier for the Memory Store |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `intelligenceServiceId` | The ID of the associated intelligence service that was provisioned for memory extraction. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status` | The current status of the Memory Store.  A store begins in the QUEUED state as it is scheduled for processing.  It then moves to PROVISIONING at the beginning of processing. It transitions to ACTIVE once all dependent resources are provisioned, including Conversational Intelligence capabilities.  If there is an issue provisioning resources, the store will move to the FAILED state.. Values: `QUEUED`, `PROVISIONING`, `ACTIVE`, `FAILED` |
  | `version` | The current version number of the Memory Store. Incremented on each successful update. |
  """

  @type t :: %__MODULE__{
          description: String.t(),
          displayName: String.t(),
          id: String.t(),
          intelligenceServiceId: String.t() | nil,
          status: String.t(),
          version: integer()
        }

  defstruct [:description, :displayName, :id, :intelligenceServiceId, :status, :version]

  @object_name "Store"
  def object_name, do: @object_name
end
