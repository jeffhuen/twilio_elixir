# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Conversations.V1.Conversation.Message do
  @moduledoc """
  A Message resource represents a message in a conversation.

  SID prefix: `IM`

  Parent: `/Conversations/{Sid}`

  ## Sub-resources
  - `channel_metadata` — `/v1/Conversations/{conversation_sid}/Messages/{message_sid}/ChannelMetadata`
  - `delivery_receipts` — `/v1/Conversations/{conversation_sid}/Messages/{message_sid}/Receipts`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The unique ID of the [Account](https://www.twilio.com/docs/iam/api/account) responsible for this message. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `attributes` | A string metadata field you can use to store any data you wish. The string value must contain structurally valid JSON if specified.  **Note** that if the attributes are not set "{}" will be returned.. PII: sensitive |
  | `author` | The channel specific identifier of the message's author. Defaults to `system`.. PII: standard |
  | `body` | The content of the message, can be up to 1,600 characters long.. PII: sensitive |
  | `content_sid` | The unique ID of the multi-channel [Rich Content](https://www.twilio.com/docs/content) template. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `conversation_sid` | The unique ID of the [Conversation](https://www.twilio.com/docs/conversations/api/conversation-resource) for this message. |
  | `date_created` | The date that this resource was created.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date that this resource was last updated. `null` if the message has not been edited.. Format: date-time |
  | `delivery` | An object that contains the summary of delivery statuses for the message to non-chat participants. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `index` | The index of the message within the [Conversation](https://www.twilio.com/docs/conversations/api/conversation-resource).  Indices may skip numbers, but will always be in order of when the message was received. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `links` | Contains an absolute API resource URL to access the delivery & read receipts of this message.. Format: uri-map |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `media` | An array of objects that describe the Message's media, if the message contains media. Each object contains these fields: `content_type` with the MIME type of the media, `filename` with the name of the media, `sid` with the SID of the Media resource, and `size` with the media object's file size in bytes. If the Message has no media, this value is `null`.. PII: standard |
  | `participant_sid` | The unique ID of messages's author participant. Null in case of `system` sent message. |
  | `sid` | A 34 character string that uniquely identifies this resource. |
  | `url` | An absolute API resource API URL for this message.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          attributes: String.t() | nil,
          author: String.t() | nil,
          body: String.t() | nil,
          content_sid: String.t() | nil,
          conversation_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          delivery: String.t() | nil,
          index: integer(),
          links: map() | nil,
          media: list() | nil,
          participant_sid: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :attributes,
    :author,
    :body,
    :content_sid,
    :conversation_sid,
    :date_created,
    :date_updated,
    :delivery,
    :index,
    :links,
    :media,
    :participant_sid,
    :sid,
    :url
  ]

  @object_name "conversations.v1.conversation.conversation_message"
  def object_name, do: @object_name

  @sid_prefix "IM"
  def sid_prefix, do: @sid_prefix
end
