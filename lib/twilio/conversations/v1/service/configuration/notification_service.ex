# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Conversations.V1.Service.Configuration.NotificationService do
  @moduledoc """
  A Service Notification resource manages a set of settings to determine push notification behavior at service level.

  Operations: `fetch`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Fetch push notification service settings

  Operation: `FetchServiceNotification` | Tags: ConversationsV1Notification
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Conversations.V1.Service.Configuration.Notification.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, chat_service_sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/Services/#{chat_service_sid}/Configuration/Notifications",
             opts: opts,
             base_url: "https://conversations.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Conversations.V1.Service.Configuration.Notification
       )}
    end
  end

  @doc """
  Update push notification service settings

  Operation: `UpdateServiceNotification` | Tags: ConversationsV1Notification

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `AddedToConversation.Enabled` | boolean | Whether to send a notification when a participant is added to a conversation. The default is `false`. |
  | `AddedToConversation.Sound` | string | The name of the sound to play when a participant is added to a conversation and `added_to_conversation.enabled` is `true`. |
  | `AddedToConversation.Template` | string | The template to use to create the notification text displayed when a participant is added to a conversation and `added_to_conversation.enabled` is `true`. |
  | `LogEnabled` | boolean | Weather the notification logging is enabled. |
  | `NewMessage.BadgeCountEnabled` | boolean | Whether the new message badge is enabled. The default is `false`. |
  | `NewMessage.Enabled` | boolean | Whether to send a notification when a new message is added to a conversation. The default is `false`. |
  | `NewMessage.Sound` | string | The name of the sound to play when a new message is added to a conversation and `new_message.enabled` is `true`. |
  | `NewMessage.Template` | string | The template to use to create the notification text displayed when a new message is added to a conversation and `new_message.enabled` is `true`. |
  | `NewMessage.WithMedia.Enabled` | boolean | Whether to send a notification when a new message with media/file attachments is added to a conversation. The default is `false`. |
  | `NewMessage.WithMedia.Template` | string | The template to use to create the notification text displayed when a new message with media/file attachments is added to a conversation and `new_message.attachments.enabled` is `true`. |
  | `RemovedFromConversation.Enabled` | boolean | Whether to send a notification to a user when they are removed from a conversation. The default is `false`. |
  | `RemovedFromConversation.Sound` | string | The name of the sound to play to a user when they are removed from a conversation and `removed_from_conversation.enabled` is `true`. |
  | `RemovedFromConversation.Template` | string | The template to use to create the notification text displayed to a user when they are removed from a conversation and `removed_from_conversation.enabled` is `true`. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Conversations.V1.Service.Configuration.Notification.t()}
          | {:error, Twilio.Error.t()}
  def update(client, chat_service_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/Services/#{chat_service_sid}/Configuration/Notifications",
             params: params,
             opts: opts,
             base_url: "https://conversations.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Conversations.V1.Service.Configuration.Notification
       )}
    end
  end
end
