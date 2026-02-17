# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Sync.V1.Service.Document.PermissionService do
  @moduledoc """
  Sync document permissions

  Operations: `list`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all Permissions applying to a Sync Document.

  Operation: `ListDocumentPermission` | Tags: SyncV1DocumentPermission
  """
  @spec list(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, service_sid, document_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/v1/Services/#{service_sid}/Documents/#{document_sid}/Permissions",
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
                 Twilio.Resources.Sync.V1.Service.Document.Permission
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all Permissions applying to a Sync Document. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, service_sid, document_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, service_sid, document_sid, Map.merge(params, page_opts), opts)
      end,
      "permissions"
    )
  end

  @doc """
  Fetch a specific Sync Document Permission.

  Operation: `FetchDocumentPermission` | Tags: SyncV1DocumentPermission
  """
  @spec fetch(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Sync.V1.Service.Document.Permission.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, service_sid, document_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/Services/#{service_sid}/Documents/#{document_sid}/Permissions/#{sid}",
             opts: opts,
             base_url: "https://sync.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Sync.V1.Service.Document.Permission)}
    end
  end

  @doc """
  Update an identity's access to a specific Sync Document.

  Operation: `UpdateDocumentPermission` | Tags: SyncV1DocumentPermission

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Manage` | boolean | Whether the identity can delete the Sync Document. Default value is `false`. |
  | `Read` | boolean | Whether the identity can read the Sync Document. Default value is `false`. |
  | `Write` | boolean | Whether the identity can update the Sync Document. Default value is `false`. |
  """
  @spec update(Client.t(), String.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Sync.V1.Service.Document.Permission.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, service_sid, document_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/Services/#{service_sid}/Documents/#{document_sid}/Permissions/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://sync.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Sync.V1.Service.Document.Permission)}
    end
  end

  @doc """
  Delete a specific Sync Document Permission.

  Operation: `DeleteDocumentPermission` | Tags: SyncV1DocumentPermission
  """
  @spec delete(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, service_sid, document_sid, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v1/Services/#{service_sid}/Documents/#{document_sid}/Permissions/#{sid}",
      opts: opts,
      base_url: "https://sync.twilio.com"
    )
  end
end
