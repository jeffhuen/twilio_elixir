# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Chat.V1.Service.Channel.MemberService do
  @moduledoc """
  Users joined to specific channels

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListMember` | Tags: ChatV1Member

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Identity` | array | The [User](https://www.twilio.com/docs/api/chat/rest/v1/user)'s `identity` value of the resources to read. See [access tokens](https://www.twilio.com/docs/api/chat/guides/create-tokens) for more details. |
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
           base_url: "https://chat.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "members")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Chat.V1.Service.Channel.Member
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


  Operation: `CreateMember` | Tags: ChatV1Member

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Identity` | string | The `identity` value that uniquely identifies the new resource's [User](https://www.twilio.com/docs/api/chat/rest/v1/user) within the [Service](https://www.twilio.com/docs/api/chat/rest/services). See [access tokens](https://www.twilio.com/docs/api/chat/guides/create-tokens) for more details. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `RoleSid` | string | The SID of the [Role](https://www.twilio.com/docs/api/chat/rest/roles) to assign to the member. The default roles are those specified on the [Service](https://www.twilio.com/docs/chat/api/services). |
  """
  @spec create(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Chat.V1.Service.Channel.Member.t()} | {:error, Twilio.Error.t()}
  def create(client, service_sid, channel_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/Services/#{service_sid}/Channels/#{channel_sid}/Members",
             params: params,
             opts: opts,
             base_url: "https://chat.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Chat.V1.Service.Channel.Member)}
    end
  end

  @doc """


  Operation: `FetchMember` | Tags: ChatV1Member
  """
  @spec fetch(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Chat.V1.Service.Channel.Member.t()} | {:error, Twilio.Error.t()}
  def fetch(client, service_sid, channel_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/Services/#{service_sid}/Channels/#{channel_sid}/Members/#{sid}",
             opts: opts,
             base_url: "https://chat.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Chat.V1.Service.Channel.Member)}
    end
  end

  @doc """


  Operation: `UpdateMember` | Tags: ChatV1Member

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `LastConsumedMessageIndex` | integer | The index of the last [Message](https://www.twilio.com/docs/api/chat/rest/messages) that the Member has read within the [Channel](https://www.twilio.com/docs/api/chat/rest/channels). |
  | `RoleSid` | string | The SID of the [Role](https://www.twilio.com/docs/api/chat/rest/roles) to assign to the member. The default roles are those specified on the [Service](https://www.twilio.com/docs/chat/api/services). |
  """
  @spec update(Client.t(), String.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Chat.V1.Service.Channel.Member.t()} | {:error, Twilio.Error.t()}
  def update(client, service_sid, channel_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/Services/#{service_sid}/Channels/#{channel_sid}/Members/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://chat.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Chat.V1.Service.Channel.Member)}
    end
  end

  @doc """


  Operation: `DeleteMember` | Tags: ChatV1Member
  """
  @spec delete(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, service_sid, channel_sid, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v1/Services/#{service_sid}/Channels/#{channel_sid}/Members/#{sid}",
      opts: opts,
      base_url: "https://chat.twilio.com"
    )
  end
end
