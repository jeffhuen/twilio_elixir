# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Assistants.V1.Assistant do
  @moduledoc """
  Assistant resource.

  ## Sub-resources
  - `feedbacks` — `/v1/Assistants/{id}/Feedbacks`
  - `knowledge` — `/v1/Assistants/{id}/Knowledge`
  - `messages` — `/v1/Assistants/{id}/Messages`
  - `tools` — `/v1/Assistants/{id}/Tools`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Assistant resource. |
  | `customer_ai` | The Personalization and Perception Engine settings. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the Assistant was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the Assistant was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `id` | The Assistant ID. |
  | `knowledge` | The list of knowledge sources associated with the assistant. |
  | `model` | The default model used by the assistant. |
  | `name` | The name of the assistant. |
  | `owner` | The owner/company of the assistant. |
  | `personality_prompt` | The personality prompt to be used for assistant. |
  | `tools` | The list of tools associated with the assistant. |
  | `url` | The url of the assistant resource. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t(),
          customer_ai: map(),
          date_created: String.t(),
          date_updated: String.t(),
          id: String.t(),
          knowledge: list(),
          model: String.t(),
          name: String.t(),
          owner: String.t(),
          personality_prompt: String.t(),
          tools: list(),
          url: String.t()
        }

  defstruct [
    :account_sid,
    :customer_ai,
    :date_created,
    :date_updated,
    :id,
    :knowledge,
    :model,
    :name,
    :owner,
    :personality_prompt,
    :tools,
    :url
  ]

  @object_name "assistants.v1.service.assistant_with_tools_and_knowledge"
  def object_name, do: @object_name
end
