# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Chat.V2.ServiceService do
  @moduledoc """
  Top level scope for all chat resources

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListService` | Tags: ChatV2Service
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v2/Services",
           params: params,
           opts: opts,
           base_url: "https://chat.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "services")

        {:ok,
         %{
           page
           | items: Deserializer.deserialize_list(page.items, Twilio.Resources.Chat.V2.Service)
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


  Operation: `CreateService` | Tags: ChatV2Service

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `FriendlyName` | string | A descriptive string that you create to describe the new resource. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Chat.V2.Service.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/Services",
             params: params,
             opts: opts,
             base_url: "https://chat.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Chat.V2.Service)}
    end
  end

  @doc """


  Operation: `FetchService` | Tags: ChatV2Service
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Chat.V2.Service.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v2/Services/#{sid}",
             opts: opts,
             base_url: "https://chat.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Chat.V2.Service)}
    end
  end

  @doc """


  Operation: `UpdateService` | Tags: ChatV2Service

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ConsumptionReportInterval` | integer | DEPRECATED. The interval in seconds between consumption reports submission batches from client endpoints. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `DefaultChannelCreatorRoleSid` | string | The channel role assigned to a channel creator when they join a new channel. See the [Role resource](https://www.twilio.com/docs/chat/rest/role-resource) for more info about roles. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `DefaultChannelRoleSid` | string | The channel role assigned to users when they are added to a channel. See the [Role resource](https://www.twilio.com/docs/chat/rest/role-resource) for more info about roles. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `DefaultServiceRoleSid` | string | The service role assigned to users when they are added to the service. See the [Role resource](https://www.twilio.com/docs/chat/rest/role-resource) for more info about roles. |
  | `FriendlyName` | string | A descriptive string that you create to describe the resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Limits.ChannelMembers` | integer | The maximum number of Members that can be added to Channels within this Service. Can be up to 1,000. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Limits.UserChannels` | integer | The maximum number of Channels Users can be a Member of within this Service. Can be up to 1,000. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Media.CompatibilityMessage` | string | The message to send when a media message has no text. Can be used as placeholder message. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Notifications.AddedToChannel.Enabled` | boolean | Whether to send a notification when a member is added to a channel. The default is `false`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Notifications.AddedToChannel.Sound` | string | The name of the sound to play when a member is added to a channel and `notifications.added_to_channel.enabled` is `true`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Notifications.AddedToChannel.Template` | string | The template to use to create the notification text displayed when a member is added to a channel and `notifications.added_to_channel.enabled` is `true`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Notifications.InvitedToChannel.Enabled` | boolean | Whether to send a notification when a user is invited to a channel. The default is `false`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Notifications.InvitedToChannel.Sound` | string | The name of the sound to play when a user is invited to a channel and `notifications.invited_to_channel.enabled` is `true`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Notifications.InvitedToChannel.Template` | string | The template to use to create the notification text displayed when a user is invited to a channel and `notifications.invited_to_channel.enabled` is `true`. |
  | `Notifications.LogEnabled` | boolean | Whether to log notifications. The default is `false`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Notifications.NewMessage.BadgeCountEnabled` | boolean | Whether the new message badge is enabled. The default is `false`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Notifications.NewMessage.Enabled` | boolean | Whether to send a notification when a new message is added to a channel. The default is `false`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Notifications.NewMessage.Sound` | string | The name of the sound to play when a new message is added to a channel and `notifications.new_message.enabled` is `true`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Notifications.NewMessage.Template` | string | The template to use to create the notification text displayed when a new message is added to a channel and `notifications.new_message.enabled` is `true`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Notifications.RemovedFromChannel.Enabled` | boolean | Whether to send a notification to a user when they are removed from a channel. The default is `false`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Notifications.RemovedFromChannel.Sound` | string | The name of the sound to play to a user when they are removed from a channel and `notifications.removed_from_channel.enabled` is `true`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Notifications.RemovedFromChannel.Template` | string | The template to use to create the notification text displayed to a user when they are removed from a channel and `notifications.removed_from_channel.enabled` is `true`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `PostWebhookRetryCount` | integer | The number of times to retry a call to the `post_webhook_url` if the request times out (after 5 seconds) or it receives a 429, 503, or 504 HTTP response. The default is 0, which means the call won't be retried. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `PostWebhookUrl` | string (uri) | The URL for post-event webhooks, which are called by using the `webhook_method`. See [Webhook Events](https://www.twilio.com/docs/chat/webhook-events) for more details. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `PreWebhookRetryCount` | integer | The number of times to retry a call to the `pre_webhook_url` if the request times out (after 5 seconds) or it receives a 429, 503, or 504 HTTP response. Default retry count is 0 times, which means the call won't be retried. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `PreWebhookUrl` | string (uri) | The URL for pre-event webhooks, which are called by using the `webhook_method`. See [Webhook Events](https://www.twilio.com/docs/chat/webhook-events) for more details. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ReachabilityEnabled` | boolean | Whether to enable the [Reachability Indicator](https://www.twilio.com/docs/chat/reachability-indicator) for this Service instance. The default is `false`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ReadStatusEnabled` | boolean | Whether to enable the [Message Consumption Horizon](https://www.twilio.com/docs/chat/consumption-horizon) feature. The default is `true`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `TypingIndicatorTimeout` | integer | How long in seconds after a `started typing` event until clients should assume that user is no longer typing, even if no `ended typing` message was received.  The default is 5 seconds. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `WebhookFilters` | array | The list of webhook events that are enabled for this Service instance. See [Webhook Events](https://www.twilio.com/docs/chat/webhook-events) for more details. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `WebhookMethod` | string (http-method) | The HTTP method to use for calls to the `pre_webhook_url` and `post_webhook_url` webhooks.  Can be: `POST` or `GET` and the default is `POST`. See [Webhook Events](https://www.twilio.com/docs/chat/webhook-events) for more details. Values: `GET`, `POST` |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Chat.V2.Service.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/Services/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://chat.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Chat.V2.Service)}
    end
  end

  @doc """


  Operation: `DeleteService` | Tags: ChatV2Service
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v2/Services/#{sid}",
      opts: opts,
      base_url: "https://chat.twilio.com"
    )
  end
end
