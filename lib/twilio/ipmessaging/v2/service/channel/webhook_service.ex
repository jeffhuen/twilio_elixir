# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.IpMessaging.V2.Service.Channel.WebhookService do
  @moduledoc """
  Service for Webhook API operations.

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListChannelWebhook` | Tags: IpMessagingV2Webhook
  """
  @spec list(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, service_sid, channel_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/v2/Services/#{service_sid}/Channels/#{channel_sid}/Webhooks",
           params: params,
           opts: opts,
           base_url: "https://ip-messaging.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "webhooks")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.IpMessaging.V2.Service.Channel.Webhook
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream:  (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, service_sid, channel_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, service_sid, channel_sid, Map.merge(params, page_opts), opts)
      end,
      "webhooks"
    )
  end

  @doc """


  Operation: `CreateChannelWebhook` | Tags: IpMessagingV2Webhook

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Type` | string |  Values: `webhook`, `trigger`, `studio` |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Configuration.Filters` | array |  |
  | `Configuration.FlowSid` | string |  |
  | `Configuration.Method` | string |  Values: `GET`, `POST` |
  | `Configuration.RetryCount` | integer |  |
  | `Configuration.Triggers` | array |  |
  | `Configuration.Url` | string |  |
  """
  @spec create(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.IpMessaging.V2.Service.Channel.Webhook.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, service_sid, channel_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v2/Services/#{service_sid}/Channels/#{channel_sid}/Webhooks",
             params: params,
             opts: opts,
             base_url: "https://ip-messaging.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.IpMessaging.V2.Service.Channel.Webhook)}
    end
  end

  @doc """


  Operation: `FetchChannelWebhook` | Tags: IpMessagingV2Webhook
  """
  @spec fetch(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.IpMessaging.V2.Service.Channel.Webhook.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, service_sid, channel_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v2/Services/#{service_sid}/Channels/#{channel_sid}/Webhooks/#{sid}",
             opts: opts,
             base_url: "https://ip-messaging.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.IpMessaging.V2.Service.Channel.Webhook)}
    end
  end

  @doc """


  Operation: `UpdateChannelWebhook` | Tags: IpMessagingV2Webhook

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Configuration.Filters` | array |  |
  | `Configuration.FlowSid` | string |  |
  | `Configuration.Method` | string |  Values: `GET`, `POST` |
  | `Configuration.RetryCount` | integer |  |
  | `Configuration.Triggers` | array |  |
  | `Configuration.Url` | string |  |
  """
  @spec update(Client.t(), String.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.IpMessaging.V2.Service.Channel.Webhook.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, service_sid, channel_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v2/Services/#{service_sid}/Channels/#{channel_sid}/Webhooks/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://ip-messaging.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.IpMessaging.V2.Service.Channel.Webhook)}
    end
  end

  @doc """


  Operation: `DeleteChannelWebhook` | Tags: IpMessagingV2Webhook
  """
  @spec delete(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, service_sid, channel_sid, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v2/Services/#{service_sid}/Channels/#{channel_sid}/Webhooks/#{sid}",
      opts: opts,
      base_url: "https://ip-messaging.twilio.com"
    )
  end
end
