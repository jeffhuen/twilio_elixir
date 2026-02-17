# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Assistants.V1.Knowledge.Status do
  @moduledoc """
  Status resource.

  Parent: `/Knowledge/{id}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Knowledge resource. |
  | `date_updated` | The date and time in GMT when the Knowledge was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `last_status` | The last status of processing the knowledge source ('QUEUED', 'PROCESSING', 'COMPLETED', 'FAILED') |
  | `status` | The status of processing the knowledge source ('QUEUED', 'PROCESSING', 'COMPLETED', 'FAILED') |
  """

  @type t :: %__MODULE__{
          account_sid: String.t(),
          date_updated: String.t(),
          last_status: String.t(),
          status: String.t()
        }

  defstruct [:account_sid, :date_updated, :last_status, :status]

  @object_name "assistants.v1.service.knowledge_status"
  def object_name, do: @object_name
end
