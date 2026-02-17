# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.IpMessaging.V1.Service.Channel.MemberService do
  @moduledoc """


  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListMember` | Tags: IpMessagingV1Member

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Identity` | array |  |
  """
  @spec list(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, service_sid, channel_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/v1/Services/#{service_sid}/Channels/#{channel_sid}/Members",
           params: params,
           opts: opts,
           base_url: "https://ip-messaging.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "members")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.IpMessaging.V1.Service.Channel.Member
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
      "members"
    )
  end

  @doc """


  Operation: `CreateMember` | Tags: IpMessagingV1Member

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Identity` | string |  |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `RoleSid` | string |  |
  """
  @spec create(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.IpMessaging.V1.Service.Channel.Member.t()}
          | {:error, Twilio.Error.t()}
  def create(client, service_sid, channel_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/Services/#{service_sid}/Channels/#{channel_sid}/Members",
             params: params,
             opts: opts,
             base_url: "https://ip-messaging.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.IpMessaging.V1.Service.Channel.Member)}
    end
  end

  @doc """


  Operation: `FetchMember` | Tags: IpMessagingV1Member
  """
  @spec fetch(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.IpMessaging.V1.Service.Channel.Member.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, service_sid, channel_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/Services/#{service_sid}/Channels/#{channel_sid}/Members/#{sid}",
             opts: opts,
             base_url: "https://ip-messaging.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.IpMessaging.V1.Service.Channel.Member)}
    end
  end

  @doc """


  Operation: `UpdateMember` | Tags: IpMessagingV1Member

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `LastConsumedMessageIndex` | integer |  |
  | `RoleSid` | string |  |
  """
  @spec update(Client.t(), String.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.IpMessaging.V1.Service.Channel.Member.t()}
          | {:error, Twilio.Error.t()}
  def update(client, service_sid, channel_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/Services/#{service_sid}/Channels/#{channel_sid}/Members/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://ip-messaging.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.IpMessaging.V1.Service.Channel.Member)}
    end
  end

  @doc """


  Operation: `DeleteMember` | Tags: IpMessagingV1Member
  """
  @spec delete(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, service_sid, channel_sid, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v1/Services/#{service_sid}/Channels/#{channel_sid}/Members/#{sid}",
      opts: opts,
      base_url: "https://ip-messaging.twilio.com"
    )
  end
end
