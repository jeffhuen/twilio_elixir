# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Conversations.V2.ControlPlane.Configuration do
  @moduledoc """
  Configuration resource.

  Default webhook configuration for Conversation-level events under this Configuration.

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `method` | HTTP method used to invoke the webhook URL.. Values: `POST`, `GET` |
  | `url` | Destination URL for webhooks.. Format: uri |
  """

  @type t :: %__MODULE__{
          method: String.t(),
          url: String.t()
        }

  defstruct [:method, :url]

  @object_name "conversations.v2.status_callback_config"
  def object_name, do: @object_name
end
