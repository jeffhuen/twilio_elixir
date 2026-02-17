# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.IpMessaging.V2.Service.User.ChannelService do
  @moduledoc """


  Operations: `list`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListUserChannel` | Tags: IpMessagingV2UserChannel
  """
  @spec list(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, service_sid, user_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v2/Services/#{service_sid}/Users/#{user_sid}/Channels",
           params: params,
           opts: opts,
           base_url: "https://ip-messaging.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "channels")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.IpMessaging.V2.Service.User.Channel
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream:  (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, service_sid, user_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, service_sid, user_sid, Map.merge(params, page_opts), opts)
      end,
      "channels"
    )
  end

  @doc """


  Operation: `FetchUserChannel` | Tags: IpMessagingV2UserChannel
  """
  @spec fetch(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.IpMessaging.V2.Service.User.Channel.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, service_sid, user_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v2/Services/#{service_sid}/Users/#{user_sid}/Channels/#{sid}",
             opts: opts,
             base_url: "https://ip-messaging.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.IpMessaging.V2.Service.User.Channel)}
    end
  end

  @doc """


  Operation: `UpdateUserChannel` | Tags: IpMessagingV2UserChannel

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `LastConsumedMessageIndex` | integer |  |
  | `LastConsumptionTimestamp` | string (date-time) |  |
  | `NotificationLevel` | string |  Values: `default`, `muted` |
  """
  @spec update(Client.t(), String.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.IpMessaging.V2.Service.User.Channel.t()}
          | {:error, Twilio.Error.t()}
  def update(client, service_sid, user_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v2/Services/#{service_sid}/Users/#{user_sid}/Channels/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://ip-messaging.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.IpMessaging.V2.Service.User.Channel)}
    end
  end

  @doc """


  Operation: `DeleteUserChannel` | Tags: IpMessagingV2UserChannel
  """
  @spec delete(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, service_sid, user_sid, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v2/Services/#{service_sid}/Users/#{user_sid}/Channels/#{sid}",
      opts: opts,
      base_url: "https://ip-messaging.twilio.com"
    )
  end
end
