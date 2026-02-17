# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Conversations.V1.Service.Conversation.Message.Receipt do
  @moduledoc """
  A Service Message Receipt resource represents a delivery/read receipt of a message in a conversation.

  SID prefix: `DY`

  Parent: `/Services/{ChatServiceSid}/Conversations/{ConversationSid}/Messages/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The unique ID of the [Account](https://www.twilio.com/docs/iam/api/account) responsible for this participant. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `channel_message_sid` | A messaging channel-specific identifier for the message delivered to participant e.g. `SMxx` for SMS, `WAxx` for Whatsapp etc.  |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `chat_service_sid` | The SID of the [Conversation Service](https://www.twilio.com/docs/conversations/api/service-resource) the Message resource is associated with. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `conversation_sid` | The unique ID of the [Conversation](https://www.twilio.com/docs/conversations/api/conversation-resource) for this message. |
  | `date_created` | The date that this resource was created.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date that this resource was last updated. `null` if the delivery receipt has not been updated.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `error_code` | The message [delivery error code](https://www.twilio.com/docs/sms/api/message-resource#delivery-related-errors) for a `failed` status,  |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `message_sid` | The SID of the message within a [Conversation](https://www.twilio.com/docs/conversations/api/conversation-resource) the delivery receipt belongs to |
  | `participant_sid` | The unique ID of the participant the delivery receipt belongs to. |
  | `sid` | A 34 character string that uniquely identifies this resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status` | The message delivery status, can be `read`, `failed`, `delivered`, `undelivered`, `sent` or null.. Values: `read`, `failed`, `delivered`, `undelivered`, `sent` |
  | `url` | An absolute API resource URL for this delivery receipt.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          channel_message_sid: String.t() | nil,
          chat_service_sid: String.t() | nil,
          conversation_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          error_code: integer(),
          message_sid: String.t() | nil,
          participant_sid: String.t() | nil,
          sid: String.t() | nil,
          status: String.t(),
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :channel_message_sid,
    :chat_service_sid,
    :conversation_sid,
    :date_created,
    :date_updated,
    :error_code,
    :message_sid,
    :participant_sid,
    :sid,
    :status,
    :url
  ]

  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  @object_name "conversations.v1.service.service_conversation.service_conversation_message.service_conversation_message_receipt"
  def object_name, do: @object_name

  @sid_prefix "DY"
  def sid_prefix, do: @sid_prefix
end
