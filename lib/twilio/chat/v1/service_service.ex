# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Chat.V1.ServiceService do
  @moduledoc """
  Top level scope for all chat resources

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListService` | Tags: ChatV1Service
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Services",
           params: params,
           opts: opts,
           base_url: "https://chat.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "services")

        {:ok,
         %{
           page
           | items: Deserializer.deserialize_list(page.items, Twilio.Resources.Chat.V1.Service)
         }}

      error ->
        error
    end
  end

  @doc "Stream:  (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "services"
    )
  end

  @doc """


  Operation: `CreateService` | Tags: ChatV1Service

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `FriendlyName` | string | A descriptive string that you create to describe the resource. It can be up to 64 characters long. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Chat.V1.Service.t()} | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Services",
             params: params,
             opts: opts,
             base_url: "https://chat.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Chat.V1.Service)}
    end
  end

  @doc """


  Operation: `FetchService` | Tags: ChatV1Service
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Chat.V1.Service.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Services/#{sid}",
             opts: opts,
             base_url: "https://chat.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Chat.V1.Service)}
    end
  end

  @doc """


  Operation: `UpdateService` | Tags: ChatV1Service

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `ConsumptionReportInterval` | integer | DEPRECATED. The interval in seconds between consumption reports submission batches from client endpoints. |
  | `DefaultChannelCreatorRoleSid` | string | The channel role assigned to a channel creator when they join a new channel. See the [Roles endpoint](https://www.twilio.com/docs/chat/api/roles) for more details. |
  | `DefaultChannelRoleSid` | string | The channel role assigned to users when they are added to a channel. See the [Roles endpoint](https://www.twilio.com/docs/chat/api/roles) for more details. |
  | `DefaultServiceRoleSid` | string | The service role assigned to users when they are added to the service. See the [Roles endpoint](https://www.twilio.com/docs/chat/api/roles) for more details. |
  | `FriendlyName` | string | A descriptive string that you create to describe the resource. It can be up to 64 characters long. |
  | `Limits.ChannelMembers` | integer | The maximum number of Members that can be added to Channels within this Service. Can be up to 1,000. |
  | `Limits.UserChannels` | integer | The maximum number of Channels Users can be a Member of within this Service. Can be up to 1,000. |
  | `Notifications.AddedToChannel.Enabled` | boolean | Whether to send a notification when a member is added to a channel. Can be: `true` or `false` and the default is `false`. |
  | `Notifications.AddedToChannel.Template` | string | The template to use to create the notification text displayed when a member is added to a channel and `notifications.added_to_channel.enabled` is `true`. |
  | `Notifications.InvitedToChannel.Enabled` | boolean | Whether to send a notification when a user is invited to a channel. Can be: `true` or `false` and the default is `false`. |
  | `Notifications.InvitedToChannel.Template` | string | The template to use to create the notification text displayed when a user is invited to a channel and `notifications.invited_to_channel.enabled` is `true`. |
  | `Notifications.NewMessage.Enabled` | boolean | Whether to send a notification when a new message is added to a channel. Can be: `true` or `false` and the default is `false`. |
  | `Notifications.NewMessage.Template` | string | The template to use to create the notification text displayed when a new message is added to a channel and `notifications.new_message.enabled` is `true`. |
  | `Notifications.RemovedFromChannel.Enabled` | boolean | Whether to send a notification to a user when they are removed from a channel. Can be: `true` or `false` and the default is `false`. |
  | `Notifications.RemovedFromChannel.Template` | string | The template to use to create the notification text displayed to a user when they are removed from a channel and `notifications.removed_from_channel.enabled` is `true`. |
  | `PostWebhookUrl` | string (uri) | The URL for post-event webhooks, which are called by using the `webhook_method`. See [Webhook Events](https://www.twilio.com/docs/api/chat/webhooks) for more details. |
  | `PreWebhookUrl` | string (uri) | The URL for pre-event webhooks, which are called by using the `webhook_method`. See [Webhook Events](https://www.twilio.com/docs/api/chat/webhooks) for more details. |
  | `ReachabilityEnabled` | boolean | Whether to enable the [Reachability Indicator](https://www.twilio.com/docs/chat/reachability-indicator) for this Service instance. The default is `false`. |
  | `ReadStatusEnabled` | boolean | Whether to enable the [Message Consumption Horizon](https://www.twilio.com/docs/chat/consumption-horizon) feature. The default is `true`. |
  | `TypingIndicatorTimeout` | integer | How long in seconds after a `started typing` event until clients should assume that user is no longer typing, even if no `ended typing` message was received.  The default is 5 seconds. |
  | `WebhookFilters` | array | The list of WebHook events that are enabled for this Service instance. See [Webhook Events](https://www.twilio.com/docs/chat/webhook-events) for more details. |
  | `WebhookMethod` | string (http-method) | The HTTP method to use for calls to the `pre_webhook_url` and `post_webhook_url` webhooks.  Can be: `POST` or `GET` and the default is `POST`. See [Webhook Events](https://www.twilio.com/docs/chat/webhook-events) for more details. Values: `GET`, `POST` |
  | `Webhooks.OnChannelAdd.Method` | string (http-method) | The HTTP method to use when calling the `webhooks.on_channel_add.url`. Values: `GET`, `POST` |
  | `Webhooks.OnChannelAdd.Url` | string (uri) | The URL of the webhook to call in response to the `on_channel_add` event using the `webhooks.on_channel_add.method` HTTP method. |
  | `Webhooks.OnChannelAdded.Method` | string (http-method) | The URL of the webhook to call in response to the `on_channel_added` event`. Values: `GET`, `POST` |
  | `Webhooks.OnChannelAdded.Url` | string (uri) | The URL of the webhook to call in response to the `on_channel_added` event using the `webhooks.on_channel_added.method` HTTP method. |
  | `Webhooks.OnChannelDestroy.Method` | string (http-method) | The HTTP method to use when calling the `webhooks.on_channel_destroy.url`. Values: `GET`, `POST` |
  | `Webhooks.OnChannelDestroy.Url` | string (uri) | The URL of the webhook to call in response to the `on_channel_destroy` event using the `webhooks.on_channel_destroy.method` HTTP method. |
  | `Webhooks.OnChannelDestroyed.Method` | string (http-method) | The HTTP method to use when calling the `webhooks.on_channel_destroyed.url`. Values: `GET`, `POST` |
  | `Webhooks.OnChannelDestroyed.Url` | string (uri) | The URL of the webhook to call in response to the `on_channel_added` event using the `webhooks.on_channel_destroyed.method` HTTP method. |
  | `Webhooks.OnChannelUpdate.Method` | string (http-method) | The HTTP method to use when calling the `webhooks.on_channel_update.url`. Values: `GET`, `POST` |
  | `Webhooks.OnChannelUpdate.Url` | string (uri) | The URL of the webhook to call in response to the `on_channel_update` event using the `webhooks.on_channel_update.method` HTTP method. |
  | `Webhooks.OnChannelUpdated.Method` | string (http-method) | The HTTP method to use when calling the `webhooks.on_channel_updated.url`. Values: `GET`, `POST` |
  | `Webhooks.OnChannelUpdated.Url` | string (uri) | The URL of the webhook to call in response to the `on_channel_updated` event using the `webhooks.on_channel_updated.method` HTTP method. |
  | `Webhooks.OnMemberAdd.Method` | string (http-method) | The HTTP method to use when calling the `webhooks.on_member_add.url`. Values: `GET`, `POST` |
  | `Webhooks.OnMemberAdd.Url` | string (uri) | The URL of the webhook to call in response to the `on_member_add` event using the `webhooks.on_member_add.method` HTTP method. |
  | `Webhooks.OnMemberAdded.Method` | string (http-method) | The HTTP method to use when calling the `webhooks.on_channel_updated.url`. Values: `GET`, `POST` |
  | `Webhooks.OnMemberAdded.Url` | string (uri) | The URL of the webhook to call in response to the `on_channel_updated` event using the `webhooks.on_channel_updated.method` HTTP method. |
  | `Webhooks.OnMemberRemove.Method` | string (http-method) | The HTTP method to use when calling the `webhooks.on_member_remove.url`. Values: `GET`, `POST` |
  | `Webhooks.OnMemberRemove.Url` | string (uri) | The URL of the webhook to call in response to the `on_member_remove` event using the `webhooks.on_member_remove.method` HTTP method. |
  | `Webhooks.OnMemberRemoved.Method` | string (http-method) | The HTTP method to use when calling the `webhooks.on_member_removed.url`. Values: `GET`, `POST` |
  | `Webhooks.OnMemberRemoved.Url` | string (uri) | The URL of the webhook to call in response to the `on_member_removed` event using the `webhooks.on_member_removed.method` HTTP method. |
  | `Webhooks.OnMessageRemove.Method` | string (http-method) | The HTTP method to use when calling the `webhooks.on_message_remove.url`. Values: `GET`, `POST` |
  | `Webhooks.OnMessageRemove.Url` | string (uri) | The URL of the webhook to call in response to the `on_message_remove` event using the `webhooks.on_message_remove.method` HTTP method. |
  | `Webhooks.OnMessageRemoved.Method` | string (http-method) | The HTTP method to use when calling the `webhooks.on_message_removed.url`. Values: `GET`, `POST` |
  | `Webhooks.OnMessageRemoved.Url` | string (uri) | The URL of the webhook to call in response to the `on_message_removed` event using the `webhooks.on_message_removed.method` HTTP method. |
  | `Webhooks.OnMessageSend.Method` | string (http-method) | The HTTP method to use when calling the `webhooks.on_message_send.url`. Values: `GET`, `POST` |
  | `Webhooks.OnMessageSend.Url` | string (uri) | The URL of the webhook to call in response to the `on_message_send` event using the `webhooks.on_message_send.method` HTTP method. |
  | `Webhooks.OnMessageSent.Method` | string (http-method) | The URL of the webhook to call in response to the `on_message_sent` event`. Values: `GET`, `POST` |
  | `Webhooks.OnMessageSent.Url` | string (uri) | The URL of the webhook to call in response to the `on_message_sent` event using the `webhooks.on_message_sent.method` HTTP method. |
  | `Webhooks.OnMessageUpdate.Method` | string (http-method) | The HTTP method to use when calling the `webhooks.on_message_update.url`. Values: `GET`, `POST` |
  | `Webhooks.OnMessageUpdate.Url` | string (uri) | The URL of the webhook to call in response to the `on_message_update` event using the `webhooks.on_message_update.method` HTTP method. |
  | `Webhooks.OnMessageUpdated.Method` | string (http-method) | The HTTP method to use when calling the `webhooks.on_message_updated.url`. Values: `GET`, `POST` |
  | `Webhooks.OnMessageUpdated.Url` | string (uri) | The URL of the webhook to call in response to the `on_message_updated` event using the `webhooks.on_message_updated.method` HTTP method. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Chat.V1.Service.t()} | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Services/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://chat.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Chat.V1.Service)}
    end
  end

  @doc """


  Operation: `DeleteService` | Tags: ChatV1Service
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Services/#{sid}",
      opts: opts,
      base_url: "https://chat.twilio.com"
    )
  end
end
