# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Assistants.V1.Assistant.Tool do
  @moduledoc """
  Tool resource.

  Parent: `/Assistants/{id}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Tool resource. |
  | `date_created` | The date and time in GMT when the Tool was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `date_updated` | The date and time in GMT when the Tool was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `description` | The description of the tool. |
  | `enabled` | True if the tool is enabled. |
  | `id` | The tool ID. |
  | `meta` | The metadata related to method, url, input_schema to used with the Tool. |
  | `name` | The name of the tool. |
  | `requires_auth` | The authentication requirement for the tool. |
  | `type` | The type of the tool. ('WEBHOOK') |
  | `url` | The url of the tool resource. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t(),
          date_created: String.t(),
          date_updated: String.t(),
          description: String.t(),
          enabled: boolean(),
          id: String.t(),
          meta: map(),
          name: String.t(),
          requires_auth: boolean(),
          type: String.t(),
          url: String.t()
        }

  defstruct [
    :account_sid,
    :date_created,
    :date_updated,
    :description,
    :enabled,
    :id,
    :meta,
    :name,
    :requires_auth,
    :type,
    :url
  ]

  @object_name "assistants.v1.service.tool"
  def object_name, do: @object_name
end
