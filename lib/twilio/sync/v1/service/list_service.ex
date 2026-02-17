# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Sync.V1.Service.ListService do
  @moduledoc """
  Sync list objects

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListSyncList` | Tags: SyncV1SyncList
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, service_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Services/#{service_sid}/Lists",
           params: params,
           opts: opts,
           base_url: "https://sync.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "lists")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(page.items, Twilio.Resources.Sync.V1.Service.List)
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
      "lists"
    )
  end

  @doc """


  Operation: `CreateSyncList` | Tags: SyncV1SyncList

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `CollectionTtl` | integer | How long, [in seconds](https://www.twilio.com/docs/sync/limits#sync-payload-limits), before the Sync List expires (time-to-live) and is deleted. |
  | `Ttl` | integer | Alias for collection_ttl. If both are provided, this value is ignored. |
  | `UniqueName` | string | An application-defined string that uniquely identifies the resource. This value must be unique within its Service and it can be up to 320 characters long. The `unique_name` value can be used as an alternative to the `sid` in the URL path to address the resource. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Sync.V1.Service.List.t()} | {:error, Twilio.Error.t()}
  def create(client, service_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Services/#{service_sid}/Lists",
             params: params,
             opts: opts,
             base_url: "https://sync.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Sync.V1.Service.List)}
    end
  end

  @doc """


  Operation: `FetchSyncList` | Tags: SyncV1SyncList
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Sync.V1.Service.List.t()} | {:error, Twilio.Error.t()}
  def fetch(client, service_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Services/#{service_sid}/Lists/#{sid}",
             opts: opts,
             base_url: "https://sync.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Sync.V1.Service.List)}
    end
  end

  @doc """


  Operation: `UpdateSyncList` | Tags: SyncV1SyncList

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `CollectionTtl` | integer | How long, [in seconds](https://www.twilio.com/docs/sync/limits#sync-payload-limits), before the Sync List expires (time-to-live) and is deleted. |
  | `Ttl` | integer | An alias for `collection_ttl`. If both are provided, this value is ignored. |
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Sync.V1.Service.List.t()} | {:error, Twilio.Error.t()}
  def update(client, service_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Services/#{service_sid}/Lists/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://sync.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Sync.V1.Service.List)}
    end
  end

  @doc """


  Operation: `DeleteSyncList` | Tags: SyncV1SyncList
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, service_sid, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Services/#{service_sid}/Lists/#{sid}",
      opts: opts,
      base_url: "https://sync.twilio.com"
    )
  end
end
