# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Conversations.V2.Conversation.Participant do
  @moduledoc """
  Participant resource.

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `address` | The address value formatted according to channel type: - SMS/VOICE: E.164 phone number (such as "+18005550100") - WHATSAPP: Phone number with whatsapp prefix (such as "whatsapp:+18005550100") - RCS: Sender ID or phone number with rcs prefix (such as "rcs:brand_acme_agent" or "rcs:+18005550100") - CHAT: Customer-defined string identifier  |
  | `channel` | The channel for Communication.. Values: `VOICE`, `SMS`, `RCS`, `WHATSAPP`, `CHAT` |
  | `channelId` | Channel-specific ID for correlating Communications. |
  """

  @type t :: %__MODULE__{
          address: String.t(),
          channel: String.t(),
          channelId: String.t()
        }

  defstruct [:address, :channel, :channelId]

  @object_name "conversations.v2.address"
  def object_name, do: @object_name
end
