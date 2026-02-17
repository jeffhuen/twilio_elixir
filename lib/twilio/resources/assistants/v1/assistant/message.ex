# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Assistants.V1.Assistant.Message do
  @moduledoc """
  Message resource.

  Parent: `/Assistants/{id}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `aborted` | This property will denote whether the request was aborted or not. |
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that sent the Message. |
  | `body` | If successful, the body of the generated response |
  | `error` | The error message if generation was not successful |
  | `flagged` | If successful, this property will denote whether the response was flagged or not. |
  | `session_id` | The unique name for the session. |
  | `status` | success or failure based on whether the request successfully generated a response. |
  """

  @type t :: %__MODULE__{
          aborted: boolean(),
          account_sid: String.t(),
          body: String.t(),
          error: String.t(),
          flagged: boolean(),
          session_id: String.t(),
          status: String.t()
        }

  defstruct [:aborted, :account_sid, :body, :error, :flagged, :session_id, :status]

  @object_name "assistants.v1.service.assistant_send_message_response"
  def object_name, do: @object_name
end
