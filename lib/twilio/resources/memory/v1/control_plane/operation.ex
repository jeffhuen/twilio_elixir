# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Memory.V1.ControlPlane.Operation do
  @moduledoc """
  Operation resource.

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `completedAt` | When the operation completed or failed.. Format: date-time |
  | `createdAt` | When the operation was created.. Format: date-time |
  | `operationId` | The unique identifier for this operation. |
  | `resultUrl` | URL to fetch the resulting resource.. Format: uri |
  | `status` | The current status of the operation.. Values: `PENDING`, `RUNNING`, `CANCELLED`, `COMPLETED`, `FAILED` |
  | `statusUrl` | URI to check operation status.. Format: uri |
  """

  @type t :: %__MODULE__{
          completedAt: String.t(),
          createdAt: String.t(),
          error: map(),
          operationId: String.t(),
          result: String.t(),
          resultUrl: String.t(),
          status: String.t(),
          statusUrl: String.t()
        }

  defstruct [
    :completedAt,
    :createdAt,
    :error,
    :operationId,
    :result,
    :resultUrl,
    :status,
    :statusUrl
  ]

  @object_name "OperationStatus"
  def object_name, do: @object_name
end
