# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Chat.V2.Service.Channel.InviteService do
  @moduledoc """
  Pending invitations to users to become channel members

  Operations: `list`, `create`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListInvite` | Tags: ChatV2Invite

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Identity` | array | The [User](https://www.twilio.com/docs/chat/rest/user-resource)'s `identity` value of the resources to read. See [access tokens](https://www.twilio.com/docs/chat/create-tokens) for more details. |
  """
  @spec list(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, service_sid, channel_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/v2/Services/#{service_sid}/Channels/#{channel_sid}/Invites",
           params: params,
           opts: opts,
           base_url: "https://chat.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "invites")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Chat.V2.Service.Channel.Invite
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
      "invites"
    )
  end

  @doc """


  Operation: `CreateInvite` | Tags: ChatV2Invite

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Identity` | string | The `identity` value that uniquely identifies the new resource's [User](https://www.twilio.com/docs/chat/rest/user-resource) within the [Service](https://www.twilio.com/docs/chat/rest/service-resource). See [access tokens](https://www.twilio.com/docs/chat/create-tokens) for more info. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `RoleSid` | string | The SID of the [Role](https://www.twilio.com/docs/chat/rest/role-resource) assigned to the new member. |
  """
  @spec create(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Chat.V2.Service.Channel.Invite.t()} | {:error, Twilio.Error.t()}
  def create(client, service_sid, channel_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v2/Services/#{service_sid}/Channels/#{channel_sid}/Invites",
             params: params,
             opts: opts,
             base_url: "https://chat.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Chat.V2.Service.Channel.Invite)}
    end
  end

  @doc """


  Operation: `FetchInvite` | Tags: ChatV2Invite
  """
  @spec fetch(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Chat.V2.Service.Channel.Invite.t()} | {:error, Twilio.Error.t()}
  def fetch(client, service_sid, channel_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v2/Services/#{service_sid}/Channels/#{channel_sid}/Invites/#{sid}",
             opts: opts,
             base_url: "https://chat.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Chat.V2.Service.Channel.Invite)}
    end
  end

  @doc """


  Operation: `DeleteInvite` | Tags: ChatV2Invite
  """
  @spec delete(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, service_sid, channel_sid, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v2/Services/#{service_sid}/Channels/#{channel_sid}/Invites/#{sid}",
      opts: opts,
      base_url: "https://chat.twilio.com"
    )
  end
end
