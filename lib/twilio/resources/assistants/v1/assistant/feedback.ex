# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Assistants.V1.Assistant.Feedback do
  @moduledoc """
  Feedback resource.

  Parent: `/Assistants/{id}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Feedback. |
  | `assistant_id` | The Assistant ID. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the Feedback was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the Feedback was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `id` | The Feedback ID. |
  | `message_id` | The Message ID. |
  | `score` | The Score to provide as Feedback (0-1). Format: float |
  | `session_id` | The Session ID. |
  | `text` | The text to be given as feedback. |
  | `user_sid` | The SID of the User created the Feedback. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t(),
          assistant_id: String.t(),
          date_created: String.t(),
          date_updated: String.t(),
          id: String.t(),
          message_id: String.t(),
          score: float(),
          session_id: String.t(),
          text: String.t(),
          user_sid: String.t()
        }

  defstruct [
    :account_sid,
    :assistant_id,
    :date_created,
    :date_updated,
    :id,
    :message_id,
    :score,
    :session_id,
    :text,
    :user_sid
  ]

  @object_name "assistants.v1.service.feedback"
  def object_name, do: @object_name
end
