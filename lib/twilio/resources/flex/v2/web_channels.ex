# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Flex.V2.WebChannels do
  @moduledoc """
  WebChannels resource.

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `conversation_sid` | The unique string representing the [Conversation resource](https://www.twilio.com/docs/conversations/api/conversation-resource) created. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `identity` | The unique string representing the User created and should be authorized to participate in the Conversation. For more details, see [User Identity & Access Tokens](https://www.twilio.com/docs/conversations/identity).. PII: standard |
  """

  @type t :: %__MODULE__{
          conversation_sid: String.t() | nil,
          identity: String.t() | nil
        }

  defstruct [:conversation_sid, :identity]

  @object_name "flex.v2.web_channel"
  def object_name, do: @object_name
end
