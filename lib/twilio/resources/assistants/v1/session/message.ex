# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Assistants.V1.Session.Message do
  @moduledoc """
  Message resource.

  Parent: `/Sessions/{id}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Message resource. |
  | `assistant_id` | The Assistant ID. |
  | `content` | The content of the message. |
  | `date_created` | The date and time in GMT when the Message was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `date_updated` | The date and time in GMT when the Message was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `id` | The message ID. |
  | `identity` | The identity of the user. |
  | `meta` | The metadata of the message. |
  | `role` | The role of the user associated with the message. |
  | `session_id` | The Session ID. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t(),
          assistant_id: String.t(),
          content: map(),
          date_created: String.t(),
          date_updated: String.t(),
          id: String.t(),
          identity: String.t(),
          meta: map(),
          role: String.t(),
          session_id: String.t()
        }

  defstruct [
    :account_sid,
    :assistant_id,
    :content,
    :date_created,
    :date_updated,
    :id,
    :identity,
    :meta,
    :role,
    :session_id
  ]

  @object_name "assistants.v1.service.message"
  def object_name, do: @object_name
end
