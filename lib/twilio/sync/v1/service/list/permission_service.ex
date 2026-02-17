# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Sync.V1.Service.List.PermissionService do
  @moduledoc """
  Permissions for Sync list items

  Operations: `list`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all Permissions applying to a Sync List.

  Operation: `ListSyncListPermission` | Tags: SyncV1SyncListPermission
  """
  @spec list(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, service_sid, list_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Services/#{service_sid}/Lists/#{list_sid}/Permissions",
           params: params,
           opts: opts,
           base_url: "https://sync.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "permissions")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Sync.V1.Service.List.Permission
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all Permissions applying to a Sync List. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, service_sid, list_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, service_sid, list_sid, Map.merge(params, page_opts), opts)
      end,
      "permissions"
    )
  end

  @doc """
  Fetch a specific Sync List Permission.

  Operation: `FetchSyncListPermission` | Tags: SyncV1SyncListPermission
  """
  @spec fetch(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Sync.V1.Service.List.Permission.t()} | {:error, Twilio.Error.t()}
  def fetch(client, service_sid, list_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/Services/#{service_sid}/Lists/#{list_sid}/Permissions/#{sid}",
             opts: opts,
             base_url: "https://sync.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Sync.V1.Service.List.Permission)}
    end
  end

  @doc """
  Update an identity's access to a specific Sync List.

  Operation: `UpdateSyncListPermission` | Tags: SyncV1SyncListPermission

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Manage` | boolean | Whether the identity can delete the Sync List. Default value is `false`. |
  | `Read` | boolean | Whether the identity can read the Sync List and its Items. Default value is `false`. |
  | `Write` | boolean | Whether the identity can create, update, and delete Items in the Sync List. Default value is `false`. |
  """
  @spec update(Client.t(), String.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Sync.V1.Service.List.Permission.t()} | {:error, Twilio.Error.t()}
  def update(client, service_sid, list_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/Services/#{service_sid}/Lists/#{list_sid}/Permissions/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://sync.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Sync.V1.Service.List.Permission)}
    end
  end

  @doc """
  Delete a specific Sync List Permission.

  Operation: `DeleteSyncListPermission` | Tags: SyncV1SyncListPermission
  """
  @spec delete(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, service_sid, list_sid, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v1/Services/#{service_sid}/Lists/#{list_sid}/Permissions/#{sid}",
      opts: opts,
      base_url: "https://sync.twilio.com"
    )
  end
end
