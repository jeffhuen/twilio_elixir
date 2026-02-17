# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.IpMessaging.V2.Service.Channel.MessageService do
  @moduledoc """


  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListMessage` | Tags: IpMessagingV2Message

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Order` | string |  |
  """
  @spec list(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, service_sid, channel_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/v2/Services/#{service_sid}/Channels/#{channel_sid}/Messages",
           params: params,
           opts: opts,
           base_url: "https://ip-messaging.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "messages")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.IpMessaging.V2.Service.Channel.Message
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
      "messages"
    )
  end

  @doc """


  Operation: `CreateMessage` | Tags: IpMessagingV2Message

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Attributes` | string |  |
  | `Body` | string |  |
  | `DateCreated` | string (date-time) |  |
  | `DateUpdated` | string (date-time) |  |
  | `From` | string |  |
  | `LastUpdatedBy` | string |  |
  | `MediaSid` | string |  |
  """
  @spec create(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.IpMessaging.V2.Service.Channel.Message.t()}
          | {:error, Twilio.Error.t()}
  def create(client, service_sid, channel_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v2/Services/#{service_sid}/Channels/#{channel_sid}/Messages",
             params: params,
             opts: opts,
             base_url: "https://ip-messaging.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.IpMessaging.V2.Service.Channel.Message)}
    end
  end

  @doc """


  Operation: `FetchMessage` | Tags: IpMessagingV2Message
  """
  @spec fetch(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.IpMessaging.V2.Service.Channel.Message.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, service_sid, channel_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v2/Services/#{service_sid}/Channels/#{channel_sid}/Messages/#{sid}",
             opts: opts,
             base_url: "https://ip-messaging.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.IpMessaging.V2.Service.Channel.Message)}
    end
  end

  @doc """


  Operation: `UpdateMessage` | Tags: IpMessagingV2Message

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Attributes` | string |  |
  | `Body` | string |  |
  | `DateCreated` | string (date-time) |  |
  | `DateUpdated` | string (date-time) |  |
  | `From` | string |  |
  | `LastUpdatedBy` | string |  |
  """
  @spec update(Client.t(), String.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.IpMessaging.V2.Service.Channel.Message.t()}
          | {:error, Twilio.Error.t()}
  def update(client, service_sid, channel_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v2/Services/#{service_sid}/Channels/#{channel_sid}/Messages/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://ip-messaging.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.IpMessaging.V2.Service.Channel.Message)}
    end
  end

  @doc """


  Operation: `DeleteMessage` | Tags: IpMessagingV2Message
  """
  @spec delete(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, service_sid, channel_sid, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v2/Services/#{service_sid}/Channels/#{channel_sid}/Messages/#{sid}",
      opts: opts,
      base_url: "https://ip-messaging.twilio.com"
    )
  end
end
