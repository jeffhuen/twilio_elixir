# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.IpMessaging.V1.ServiceService do
  @moduledoc """
  Service for Service API operations.

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListService` | Tags: IpMessagingV1Service
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Services",
           params: params,
           opts: opts,
           base_url: "https://ip-messaging.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "services")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(page.items, Twilio.Resources.IpMessaging.V1.Service)
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


  Operation: `CreateService` | Tags: IpMessagingV1Service

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `FriendlyName` | string |  |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.IpMessaging.V1.Service.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Services",
             params: params,
             opts: opts,
             base_url: "https://ip-messaging.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.IpMessaging.V1.Service)}
    end
  end

  @doc """


  Operation: `FetchService` | Tags: IpMessagingV1Service
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.IpMessaging.V1.Service.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Services/#{sid}",
             opts: opts,
             base_url: "https://ip-messaging.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.IpMessaging.V1.Service)}
    end
  end

  @doc """


  Operation: `UpdateService` | Tags: IpMessagingV1Service

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `ConsumptionReportInterval` | integer |  |
  | `DefaultChannelCreatorRoleSid` | string |  |
  | `DefaultChannelRoleSid` | string |  |
  | `DefaultServiceRoleSid` | string |  |
  | `FriendlyName` | string |  |
  | `Limits.ChannelMembers` | integer |  |
  | `Limits.UserChannels` | integer |  |
  | `Notifications.AddedToChannel.Enabled` | boolean |  |
  | `Notifications.AddedToChannel.Template` | string |  |
  | `Notifications.InvitedToChannel.Enabled` | boolean |  |
  | `Notifications.InvitedToChannel.Template` | string |  |
  | `Notifications.NewMessage.Enabled` | boolean |  |
  | `Notifications.NewMessage.Template` | string |  |
  | `Notifications.RemovedFromChannel.Enabled` | boolean |  |
  | `Notifications.RemovedFromChannel.Template` | string |  |
  | `PostWebhookUrl` | string (uri) |  |
  | `PreWebhookUrl` | string (uri) |  |
  | `ReachabilityEnabled` | boolean |  |
  | `ReadStatusEnabled` | boolean |  |
  | `TypingIndicatorTimeout` | integer |  |
  | `WebhookFilters` | array |  |
  | `WebhookMethod` | string (http-method) |  Values: `GET`, `POST` |
  | `Webhooks.OnChannelAdd.Method` | string (http-method) |  Values: `GET`, `POST` |
  | `Webhooks.OnChannelAdd.Url` | string (uri) |  |
  | `Webhooks.OnChannelAdded.Method` | string (http-method) |  Values: `GET`, `POST` |
  | `Webhooks.OnChannelAdded.Url` | string (uri) |  |
  | `Webhooks.OnChannelDestroy.Method` | string (http-method) |  Values: `GET`, `POST` |
  | `Webhooks.OnChannelDestroy.Url` | string (uri) |  |
  | `Webhooks.OnChannelDestroyed.Method` | string (http-method) |  Values: `GET`, `POST` |
  | `Webhooks.OnChannelDestroyed.Url` | string (uri) |  |
  | `Webhooks.OnChannelUpdate.Method` | string (http-method) |  Values: `GET`, `POST` |
  | `Webhooks.OnChannelUpdate.Url` | string (uri) |  |
  | `Webhooks.OnChannelUpdated.Method` | string (http-method) |  Values: `GET`, `POST` |
  | `Webhooks.OnChannelUpdated.Url` | string (uri) |  |
  | `Webhooks.OnMemberAdd.Method` | string (http-method) |  Values: `GET`, `POST` |
  | `Webhooks.OnMemberAdd.Url` | string (uri) |  |
  | `Webhooks.OnMemberAdded.Method` | string (http-method) |  Values: `GET`, `POST` |
  | `Webhooks.OnMemberAdded.Url` | string (uri) |  |
  | `Webhooks.OnMemberRemove.Method` | string (http-method) |  Values: `GET`, `POST` |
  | `Webhooks.OnMemberRemove.Url` | string (uri) |  |
  | `Webhooks.OnMemberRemoved.Method` | string (http-method) |  Values: `GET`, `POST` |
  | `Webhooks.OnMemberRemoved.Url` | string (uri) |  |
  | `Webhooks.OnMessageRemove.Method` | string (http-method) |  Values: `GET`, `POST` |
  | `Webhooks.OnMessageRemove.Url` | string (uri) |  |
  | `Webhooks.OnMessageRemoved.Method` | string (http-method) |  Values: `GET`, `POST` |
  | `Webhooks.OnMessageRemoved.Url` | string (uri) |  |
  | `Webhooks.OnMessageSend.Method` | string (http-method) |  Values: `GET`, `POST` |
  | `Webhooks.OnMessageSend.Url` | string (uri) |  |
  | `Webhooks.OnMessageSent.Method` | string (http-method) |  Values: `GET`, `POST` |
  | `Webhooks.OnMessageSent.Url` | string (uri) |  |
  | `Webhooks.OnMessageUpdate.Method` | string (http-method) |  Values: `GET`, `POST` |
  | `Webhooks.OnMessageUpdate.Url` | string (uri) |  |
  | `Webhooks.OnMessageUpdated.Method` | string (http-method) |  Values: `GET`, `POST` |
  | `Webhooks.OnMessageUpdated.Url` | string (uri) |  |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.IpMessaging.V1.Service.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Services/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://ip-messaging.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.IpMessaging.V1.Service)}
    end
  end

  @doc """


  Operation: `DeleteService` | Tags: IpMessagingV1Service
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Services/#{sid}",
      opts: opts,
      base_url: "https://ip-messaging.twilio.com"
    )
  end
end
