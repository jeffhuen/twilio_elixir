# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Conversations.V1.Service.Configuration.Webhook do
  @moduledoc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  A service webhook configuration resource manages a service-level set of callback URLs and their configuration for receiving all the corresponding service events.

  Parent: `/Services/{ChatServiceSid}/Configuration`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The unique ID of the [Account](https://www.twilio.com/docs/iam/api/account) responsible for this service. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `chat_service_sid` | The unique ID of the [Conversation Service](https://www.twilio.com/docs/conversations/api/service-resource) this conversation belongs to. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `filters` | The list of events that your configured webhook targets will receive. Events not configured here will not fire. Possible values are `onParticipantAdd`, `onParticipantAdded`, `onDeliveryUpdated`, `onConversationUpdated`, `onConversationRemove`, `onParticipantRemove`, `onConversationUpdate`, `onMessageAdd`, `onMessageRemoved`, `onParticipantUpdated`, `onConversationAdded`, `onMessageAdded`, `onConversationAdd`, `onConversationRemoved`, `onParticipantUpdate`, `onMessageRemove`, `onMessageUpdated`, `onParticipantRemoved`, `onMessageUpdate` or `onConversationStateUpdated`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `method` | The HTTP method to be used when sending a webhook request. One of `GET` or `POST`.. Values: `GET`, `POST` |
  | `post_webhook_url` | The absolute url the post-event webhook request should be sent to.. Format: uri |
  | `pre_webhook_url` | The absolute url the pre-event webhook request should be sent to.. Format: uri |
  | `url` | An absolute API resource URL for this webhook.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          chat_service_sid: String.t() | nil,
          filters: list() | nil,
          method: String.t(),
          post_webhook_url: String.t() | nil,
          pre_webhook_url: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :chat_service_sid,
    :filters,
    :method,
    :post_webhook_url,
    :pre_webhook_url,
    :url
  ]

  @object_name "conversations.v1.service.service_configuration.service_webhook_configuration"
  def object_name, do: @object_name
end
