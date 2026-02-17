# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Assistants.V1.Assistant.Knowledge do
  @moduledoc """
  Knowledge resource.

  Parent: `/Assistants/{id}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Knowledge resource. |
  | `date_created` | The date and time in GMT when the Knowledge was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `date_updated` | The date and time in GMT when the Knowledge was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `description` | The type of knowledge source. |
  | `embedding_model` | The embedding model to be used for the knowledge source. |
  | `id` | The description of knowledge. |
  | `knowledge_source_details` | The details of the knowledge source based on the type. |
  | `name` | The name of the knowledge source. |
  | `status` | The status of processing the knowledge source ('QUEUED', 'PROCESSING', 'COMPLETED', 'FAILED') |
  | `type` | The type of knowledge source ('Web', 'Database', 'Text', 'File') |
  | `url` | The url of the knowledge resource. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t(),
          date_created: String.t(),
          date_updated: String.t(),
          description: String.t(),
          embedding_model: String.t(),
          id: String.t(),
          knowledge_source_details: map(),
          name: String.t(),
          status: String.t(),
          type: String.t(),
          url: String.t()
        }

  defstruct [
    :account_sid,
    :date_created,
    :date_updated,
    :description,
    :embedding_model,
    :id,
    :knowledge_source_details,
    :name,
    :status,
    :type,
    :url
  ]

  @object_name "assistants.v1.service.knowledge"
  def object_name, do: @object_name
end
