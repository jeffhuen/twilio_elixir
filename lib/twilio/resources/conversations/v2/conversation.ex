# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Conversations.V2.Conversation do
  @moduledoc """
  Conversation resource.

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `accountId` | Account ID. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `addresses` | Communication addresses for this Participant. Address format varies by channel: - SMS/VOICE: E.164 phone number (such as "+18005550100") - EMAIL: Email address (such as "user@example.com") - WHATSAPP: Phone number with whatsapp prefix (such as "whatsapp:+18005550100") - RCS: Sender ID or phone number with rcs prefix (such as "rcs:brand_acme_agent" or "rcs:+18005550100")  |
  | `conversationId` | Conversation ID. |
  | `createdAt` | Timestamp when this Participant was created.. Format: date-time |
  | `id` | Participant ID. |
  | `name` | Participant display name. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `profileId` | Profile ID. Note: This field is only resolved for `CUSTOMER` participant types, not for `HUMAN_AGENT` or `AI_AGENT` participants. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `type` | Type of Participant in the Conversation.. Values: `HUMAN_AGENT`, `CUSTOMER`, `AI_AGENT`, `AGENT`, `UNKNOWN` |
  | `updatedAt` | Timestamp when this Participant was last updated.. Format: date-time |
  """

  @type t :: %__MODULE__{
          accountId: String.t(),
          addresses: list(),
          conversationId: String.t(),
          createdAt: String.t(),
          id: String.t(),
          name: String.t(),
          profileId: String.t(),
          type: String.t(),
          updatedAt: String.t()
        }

  defstruct [
    :accountId,
    :addresses,
    :conversationId,
    :createdAt,
    :id,
    :name,
    :profileId,
    :type,
    :updatedAt
  ]

  @object_name "conversations.v2.participant"
  def object_name, do: @object_name
end
