# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Voice.V3.Transcription do
  @moduledoc """
  Transcription resource.

  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Status response for a transcription operation. Returns the current state of the operation along with the full transcription resource. Poll this response to track progress from acceptance through to completion or failure. 

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `operationId` | Unique identifier for the transcription operation. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status` | Current status of the transcription operation. PENDING: accepted but not yet started. RUNNING: currently in progress. COMPLETED: successfully completed. FAILED: failed and cannot be completed. . Values: `PENDING`, `RUNNING`, `COMPLETED`, `FAILED` |
  | `statusUrl` | URL to poll for the latest operation status.. Format: uri |
  """

  @type t :: %__MODULE__{
          operationId: String.t(),
          status: String.t(),
          statusUrl: String.t(),
          transcription: String.t()
        }

  defstruct [:operationId, :status, :statusUrl, :transcription]

  @object_name "voice.v3.transcription.LongRunningOperationResponse"
  def object_name, do: @object_name
end
