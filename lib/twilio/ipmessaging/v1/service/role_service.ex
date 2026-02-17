# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.IpMessaging.V1.Service.RoleService do
  @moduledoc """


  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListRole` | Tags: IpMessagingV1Role
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, service_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Services/#{service_sid}/Roles",
           params: params,
           opts: opts,
           base_url: "https://ip-messaging.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "roles")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.IpMessaging.V1.Service.Role
               )
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
      "roles"
    )
  end

  @doc """


  Operation: `CreateRole` | Tags: IpMessagingV1Role

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `FriendlyName` | string |  |
  | `Permission` | array |  |
  | `Type` | string |  Values: `channel`, `deployment` |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.IpMessaging.V1.Service.Role.t()} | {:error, Twilio.Error.t()}
  def create(client, service_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Services/#{service_sid}/Roles",
             params: params,
             opts: opts,
             base_url: "https://ip-messaging.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.IpMessaging.V1.Service.Role)}
    end
  end

  @doc """


  Operation: `FetchRole` | Tags: IpMessagingV1Role
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.IpMessaging.V1.Service.Role.t()} | {:error, Twilio.Error.t()}
  def fetch(client, service_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Services/#{service_sid}/Roles/#{sid}",
             opts: opts,
             base_url: "https://ip-messaging.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.IpMessaging.V1.Service.Role)}
    end
  end

  @doc """


  Operation: `UpdateRole` | Tags: IpMessagingV1Role

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Permission` | array |  |
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.IpMessaging.V1.Service.Role.t()} | {:error, Twilio.Error.t()}
  def update(client, service_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Services/#{service_sid}/Roles/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://ip-messaging.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.IpMessaging.V1.Service.Role)}
    end
  end

  @doc """


  Operation: `DeleteRole` | Tags: IpMessagingV1Role
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, service_sid, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Services/#{service_sid}/Roles/#{sid}",
      opts: opts,
      base_url: "https://ip-messaging.twilio.com"
    )
  end
end
