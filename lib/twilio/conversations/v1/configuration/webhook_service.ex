# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Conversations.V1.Configuration.WebhookService do
  @moduledoc """
  A Webhook resource manages a service-level set of callback URLs and their configuration for receiving all conversation events.

  Operations: `fetch`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `FetchConfigurationWebhook` | Tags: ConversationsV1Webhook
  """
  @spec fetch(Client.t(), keyword()) ::
          {:ok, Twilio.Resources.Conversations.V1.Configuration.Webhook.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Configuration/Webhooks",
             opts: opts,
             base_url: "https://conversations.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Conversations.V1.Configuration.Webhook)}
    end
  end

  @doc """


  Operation: `UpdateConfigurationWebhook` | Tags: ConversationsV1Webhook

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Filters` | array | The list of webhook event triggers that are enabled for this Service: `onMessageAdded`, `onMessageUpdated`, `onMessageRemoved`, `onMessageAdd`, `onMessageUpdate`, `onMessageRemove`, `onConversationUpdated`, `onConversationRemoved`, `onConversationAdd`, `onConversationAdded`, `onConversationRemove`, `onConversationUpdate`, `onConversationStateUpdated`, `onParticipantAdded`, `onParticipantUpdated`, `onParticipantRemoved`, `onParticipantAdd`, `onParticipantRemove`, `onParticipantUpdate`, `onDeliveryUpdated`, `onUserAdded`, `onUserUpdate`, `onUserUpdated` |
  | `Method` | string | The HTTP method to be used when sending a webhook request. |
  | `PostWebhookUrl` | string | The absolute url the post-event webhook request should be sent to. |
  | `PreWebhookUrl` | string | The absolute url the pre-event webhook request should be sent to. |
  | `Target` | string |  Values: `webhook`, `flex` |
  """
  @spec update(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Conversations.V1.Configuration.Webhook.t()}
          | {:error, Twilio.Error.t()}
  def update(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Configuration/Webhooks",
             params: params,
             opts: opts,
             base_url: "https://conversations.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Conversations.V1.Configuration.Webhook)}
    end
  end
end
