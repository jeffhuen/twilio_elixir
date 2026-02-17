# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Conversations.V1.Configuration.Webhook do
  @moduledoc """
  A Webhook resource manages a service-level set of callback URLs and their configuration for receiving all conversation events.

  Parent: `/Configuration`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The unique ID of the [Account](https://www.twilio.com/docs/iam/api/account) responsible for this conversation. |
  | `filters` | The list of webhook event triggers that are enabled for this Service: `onMessageAdded`, `onMessageUpdated`, `onMessageRemoved`, `onMessageAdd`, `onMessageUpdate`, `onMessageRemove`, `onConversationUpdated`, `onConversationRemoved`, `onConversationAdd`, `onConversationAdded`, `onConversationRemove`, `onConversationUpdate`, `onConversationStateUpdated`, `onParticipantAdded`, `onParticipantUpdated`, `onParticipantRemoved`, `onParticipantAdd`, `onParticipantRemove`, `onParticipantUpdate`, `onDeliveryUpdated`, `onUserAdded`, `onUserUpdate`, `onUserUpdated` |
  | `method` | The HTTP method to be used when sending a webhook request.. Values: `GET`, `POST` |
  | `post_webhook_url` | The absolute url the post-event webhook request should be sent to. |
  | `pre_webhook_url` | The absolute url the pre-event webhook request should be sent to. |
  | `target` | The routing target of the webhook. Can be ordinary or route internally to Flex. Values: `webhook`, `flex` |
  | `url` | An absolute API resource API resource URL for this webhook.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          filters: list() | nil,
          method: String.t(),
          post_webhook_url: String.t() | nil,
          pre_webhook_url: String.t() | nil,
          target: String.t(),
          url: String.t() | nil
        }

  defstruct [:account_sid, :filters, :method, :post_webhook_url, :pre_webhook_url, :target, :url]

  @object_name "conversations.v1.configuration.configuration_webhook"
  def object_name, do: @object_name
end
