# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.IpMessaging.V2.ServiceService do
  @moduledoc """
  Service for Service API operations.

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListService` | Tags: IpMessagingV2Service
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v2/Services",
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
               Deserializer.deserialize_list(page.items, Twilio.Resources.IpMessaging.V2.Service)
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


  Operation: `CreateService` | Tags: IpMessagingV2Service

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `FriendlyName` | string |  |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.IpMessaging.V2.Service.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/Services",
             params: params,
             opts: opts,
             base_url: "https://ip-messaging.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.IpMessaging.V2.Service)}
    end
  end

  @doc """


  Operation: `FetchService` | Tags: IpMessagingV2Service
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.IpMessaging.V2.Service.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v2/Services/#{sid}",
             opts: opts,
             base_url: "https://ip-messaging.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.IpMessaging.V2.Service)}
    end
  end

  @doc """


  Operation: `UpdateService` | Tags: IpMessagingV2Service

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
  | `Media.CompatibilityMessage` | string |  |
  | `Notifications.AddedToChannel.Enabled` | boolean |  |
  | `Notifications.AddedToChannel.Sound` | string |  |
  | `Notifications.AddedToChannel.Template` | string |  |
  | `Notifications.InvitedToChannel.Enabled` | boolean |  |
  | `Notifications.InvitedToChannel.Sound` | string |  |
  | `Notifications.InvitedToChannel.Template` | string |  |
  | `Notifications.LogEnabled` | boolean |  |
  | `Notifications.NewMessage.BadgeCountEnabled` | boolean |  |
  | `Notifications.NewMessage.Enabled` | boolean |  |
  | `Notifications.NewMessage.Sound` | string |  |
  | `Notifications.NewMessage.Template` | string |  |
  | `Notifications.RemovedFromChannel.Enabled` | boolean |  |
  | `Notifications.RemovedFromChannel.Sound` | string |  |
  | `Notifications.RemovedFromChannel.Template` | string |  |
  | `PostWebhookRetryCount` | integer |  |
  | `PostWebhookUrl` | string (uri) |  |
  | `PreWebhookRetryCount` | integer |  |
  | `PreWebhookUrl` | string (uri) |  |
  | `ReachabilityEnabled` | boolean |  |
  | `ReadStatusEnabled` | boolean |  |
  | `TypingIndicatorTimeout` | integer |  |
  | `WebhookFilters` | array |  |
  | `WebhookMethod` | string (http-method) |  Values: `GET`, `POST` |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.IpMessaging.V2.Service.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/Services/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://ip-messaging.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.IpMessaging.V2.Service)}
    end
  end

  @doc """


  Operation: `DeleteService` | Tags: IpMessagingV2Service
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v2/Services/#{sid}",
      opts: opts,
      base_url: "https://ip-messaging.twilio.com"
    )
  end
end
