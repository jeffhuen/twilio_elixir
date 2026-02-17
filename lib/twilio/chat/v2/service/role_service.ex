# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Chat.V2.Service.RoleService do
  @moduledoc """
  Roles determining user or member permissions

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListRole` | Tags: ChatV2Role
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, service_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v2/Services/#{service_sid}/Roles",
           params: params,
           opts: opts,
           base_url: "https://chat.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "roles")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(page.items, Twilio.Resources.Chat.V2.Service.Role)
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


  Operation: `CreateRole` | Tags: ChatV2Role

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `FriendlyName` | string | A descriptive string that you create to describe the new resource. It can be up to 64 characters long. |
  | `Permission` | array | A permission that you grant to the new role. Only one permission can be granted per parameter. To assign more than one permission, repeat this parameter for each permission value. The values for this parameter depend on the role's `type`. |
  | `Type` | string |  Values: `channel`, `deployment` |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Chat.V2.Service.Role.t()} | {:error, Twilio.Error.t()}
  def create(client, service_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/Services/#{service_sid}/Roles",
             params: params,
             opts: opts,
             base_url: "https://chat.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Chat.V2.Service.Role)}
    end
  end

  @doc """


  Operation: `FetchRole` | Tags: ChatV2Role
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Chat.V2.Service.Role.t()} | {:error, Twilio.Error.t()}
  def fetch(client, service_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v2/Services/#{service_sid}/Roles/#{sid}",
             opts: opts,
             base_url: "https://chat.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Chat.V2.Service.Role)}
    end
  end

  @doc """


  Operation: `UpdateRole` | Tags: ChatV2Role

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Permission` | array | A permission that you grant to the role. Only one permission can be granted per parameter. To assign more than one permission, repeat this parameter for each permission value. Note that the update action replaces all previously assigned permissions with those defined in the update action. To remove a permission, do not include it in the subsequent update action. The values for this parameter depend on the role's `type`. |
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Chat.V2.Service.Role.t()} | {:error, Twilio.Error.t()}
  def update(client, service_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/Services/#{service_sid}/Roles/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://chat.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Chat.V2.Service.Role)}
    end
  end

  @doc """


  Operation: `DeleteRole` | Tags: ChatV2Role
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, service_sid, sid, opts \\ []) do
    Client.request(client, :delete, "/v2/Services/#{service_sid}/Roles/#{sid}",
      opts: opts,
      base_url: "https://chat.twilio.com"
    )
  end
end
