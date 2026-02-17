# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Chat.V2.Service.UserService do
  @moduledoc """
  Unique chat users within a chat service

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListUser` | Tags: ChatV2User
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, service_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v2/Services/#{service_sid}/Users",
           params: params,
           opts: opts,
           base_url: "https://chat.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "users")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(page.items, Twilio.Resources.Chat.V2.Service.User)
         }}

      error ->
        error
    end
  end

  @doc "Stream:  (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, service_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, service_sid, Map.merge(params, page_opts), opts)
      end,
      "users"
    )
  end

  @doc """


  Operation: `CreateUser` | Tags: ChatV2User

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Identity` | string | The `identity` value that uniquely identifies the new resource's [User](https://www.twilio.com/docs/chat/rest/user-resource) within the [Service](https://www.twilio.com/docs/chat/rest/service-resource). This value is often a username or email address. See the Identity documentation for more info. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Attributes` | string | A valid JSON string that contains application-specific data. |
  | `FriendlyName` | string | A descriptive string that you create to describe the new resource. This value is often used for display purposes. |
  | `RoleSid` | string | The SID of the [Role](https://www.twilio.com/docs/chat/rest/role-resource) to assign to the new User. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Chat.V2.Service.User.t()} | {:error, Twilio.Error.t()}
  def create(client, service_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/Services/#{service_sid}/Users",
             params: params,
             opts: opts,
             base_url: "https://chat.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Chat.V2.Service.User)}
    end
  end

  @doc """


  Operation: `FetchUser` | Tags: ChatV2User
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Chat.V2.Service.User.t()} | {:error, Twilio.Error.t()}
  def fetch(client, service_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v2/Services/#{service_sid}/Users/#{sid}",
             opts: opts,
             base_url: "https://chat.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Chat.V2.Service.User)}
    end
  end

  @doc """


  Operation: `UpdateUser` | Tags: ChatV2User

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Attributes` | string | A valid JSON string that contains application-specific data. |
  | `FriendlyName` | string | A descriptive string that you create to describe the resource. It is often used for display purposes. |
  | `RoleSid` | string | The SID of the [Role](https://www.twilio.com/docs/chat/rest/role-resource) to assign to the User. |
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Chat.V2.Service.User.t()} | {:error, Twilio.Error.t()}
  def update(client, service_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/Services/#{service_sid}/Users/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://chat.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Chat.V2.Service.User)}
    end
  end

  @doc """


  Operation: `DeleteUser` | Tags: ChatV2User
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, service_sid, sid, opts \\ []) do
    Client.request(client, :delete, "/v2/Services/#{service_sid}/Users/#{sid}",
      opts: opts,
      base_url: "https://chat.twilio.com"
    )
  end
end
