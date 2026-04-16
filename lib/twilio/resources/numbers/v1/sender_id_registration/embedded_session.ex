# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Numbers.V1.SenderIdRegistration.EmbeddedSession do
  @moduledoc """
  Create a new Embedded Session for an existing Sender ID Registration

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `id` | Registration identifier (BU-prefixed). |
  | `sessionId` | Session ID for the compliance embeddable. |
  | `sessionToken` | Ephemeral session token for the compliance embeddable. |
  """

  @type t :: %__MODULE__{
          id: String.t(),
          sessionId: String.t(),
          sessionToken: String.t()
        }

  defstruct [:id, :sessionId, :sessionToken]

  @object_name "numbers.v1.create_embedded_session_response"
  def object_name, do: @object_name
end
