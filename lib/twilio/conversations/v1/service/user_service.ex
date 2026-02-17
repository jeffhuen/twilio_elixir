# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Conversations.V1.Service.UserService do
  @moduledoc """
  A Service User resource represents a conversation user belonging to a specific conversation service.

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all conversation users in your service

  Operation: `ListServiceUser` | Tags: ConversationsV1User
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, chat_service_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Services/#{chat_service_sid}/Users",
           params: params,
           opts: opts,
           base_url: "https://conversations.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "users")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Conversations.V1.Service.User
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all conversation users in your service (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, chat_service_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, chat_service_sid, Map.merge(params, page_opts), opts)
      end,
      "users"
    )
  end

  @doc """
  Add a new conversation user to your service

  Operation: `CreateServiceUser` | Tags: ConversationsV1User

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Identity` | string | The application-defined string that uniquely identifies the resource's User within the [Conversation Service](https://www.twilio.com/docs/conversations/api/service-resource). This value is often a username or an email address, and is case-sensitive. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Attributes` | string | The JSON Object string that stores application-specific data. If attributes have not been set, `{}` is returned. |
  | `FriendlyName` | string | The string that you assigned to describe the resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `RoleSid` | string | The SID of a service-level [Role](https://www.twilio.com/docs/conversations/api/role-resource) to assign to the user. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Conversations.V1.Service.User.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, chat_service_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Services/#{chat_service_sid}/Users",
             params: params,
             opts: opts,
             base_url: "https://conversations.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Conversations.V1.Service.User)}
    end
  end

  @doc """
  Fetch a conversation user from your service

  Operation: `FetchServiceUser` | Tags: ConversationsV1User
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Conversations.V1.Service.User.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, chat_service_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Services/#{chat_service_sid}/Users/#{sid}",
             opts: opts,
             base_url: "https://conversations.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Conversations.V1.Service.User)}
    end
  end

  @doc """
  Update an existing conversation user in your service

  Operation: `UpdateServiceUser` | Tags: ConversationsV1User

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Attributes` | string | The JSON Object string that stores application-specific data. If attributes have not been set, `{}` is returned. |
  | `FriendlyName` | string | The string that you assigned to describe the resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `RoleSid` | string | The SID of a service-level [Role](https://www.twilio.com/docs/conversations/api/role-resource) to assign to the user. |
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Conversations.V1.Service.User.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, chat_service_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Services/#{chat_service_sid}/Users/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://conversations.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Conversations.V1.Service.User)}
    end
  end

  @doc """
  Remove a conversation user from your service

  Operation: `DeleteServiceUser` | Tags: ConversationsV1User
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, chat_service_sid, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Services/#{chat_service_sid}/Users/#{sid}",
      opts: opts,
      base_url: "https://conversations.twilio.com"
    )
  end
end
