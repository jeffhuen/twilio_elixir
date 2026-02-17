# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Conversations.V1.Service.Configuration.Notification do
  @moduledoc """
  A Service Notification resource manages a set of settings to determine push notification behavior at service level.

  Parent: `/Services/{ChatServiceSid}/Configuration`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The unique ID of the [Account](https://www.twilio.com/docs/iam/api/account) responsible for this configuration. |
  | `added_to_conversation` | The Push Notification configuration for being added to a Conversation. |
  | `chat_service_sid` | The SID of the [Conversation Service](https://www.twilio.com/docs/conversations/api/service-resource) the Configuration applies to. |
  | `log_enabled` | Weather the notification logging is enabled. |
  | `new_message` | The Push Notification configuration for New Messages. |
  | `removed_from_conversation` | The Push Notification configuration for being removed from a Conversation. |
  | `url` | An absolute API resource URL for this configuration.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          added_to_conversation: String.t() | nil,
          chat_service_sid: String.t() | nil,
          log_enabled: boolean() | nil,
          new_message: String.t() | nil,
          removed_from_conversation: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :added_to_conversation,
    :chat_service_sid,
    :log_enabled,
    :new_message,
    :removed_from_conversation,
    :url
  ]

  @object_name "conversations.v1.service.service_configuration.service_notification"
  def object_name, do: @object_name
end
