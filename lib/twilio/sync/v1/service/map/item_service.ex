# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Sync.V1.Service.Map.ItemService do
  @moduledoc """
  Keys in a sync map

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListSyncMapItem` | Tags: SyncV1SyncMapItem

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Order` | string | How to order the Map Items returned by their `key` value. Can be: `asc` (ascending) or `desc` (descending) and the default is ascending. Map Items are [ordered lexicographically](https://en.wikipedia.org/wiki/Lexicographical_order) by Item key. |
  | `From` | string | The `key` of the first Sync Map Item resource to read. See also `bounds`. |
  | `Bounds` | string | Whether to include the Map Item referenced by the `from` parameter. Can be: `inclusive` to include the Map Item referenced by the `from` parameter or `exclusive` to start with the next Map Item. The default value is `inclusive`. |
  """
  @spec list(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, service_sid, map_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Services/#{service_sid}/Maps/#{map_sid}/Items",
           params: params,
           opts: opts,
           base_url: "https://sync.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "items")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Sync.V1.Service.Map.Item
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream:  (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, service_sid, map_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, service_sid, map_sid, Map.merge(params, page_opts), opts)
      end,
      "items"
    )
  end

  @doc """


  Operation: `CreateSyncMapItem` | Tags: SyncV1SyncMapItem

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Data` | string | A JSON string that represents an arbitrary, schema-less object that the Map Item stores. Can be up to 16 KiB in length. |
  | `Key` | string | The unique, user-defined key for the Map Item. Can be up to 320 characters long. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `CollectionTtl` | integer | How long, [in seconds](https://www.twilio.com/docs/sync/limits#sync-payload-limits), before the Map Item's parent Sync Map expires (time-to-live) and is deleted. |
  | `ItemTtl` | integer | How long, [in seconds](https://www.twilio.com/docs/sync/limits#sync-payload-limits), before the Map Item expires (time-to-live) and is deleted. |
  | `Ttl` | integer | An alias for `item_ttl`. If both parameters are provided, this value is ignored. |
  """
  @spec create(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Sync.V1.Service.Map.Item.t()} | {:error, Twilio.Error.t()}
  def create(client, service_sid, map_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Services/#{service_sid}/Maps/#{map_sid}/Items",
             params: params,
             opts: opts,
             base_url: "https://sync.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Sync.V1.Service.Map.Item)}
    end
  end

  @doc """


  Operation: `FetchSyncMapItem` | Tags: SyncV1SyncMapItem
  """
  @spec fetch(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Sync.V1.Service.Map.Item.t()} | {:error, Twilio.Error.t()}
  def fetch(client, service_sid, map_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/Services/#{service_sid}/Maps/#{map_sid}/Items/#{sid}",
             opts: opts,
             base_url: "https://sync.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Sync.V1.Service.Map.Item)}
    end
  end

  @doc """


  Operation: `UpdateSyncMapItem` | Tags: SyncV1SyncMapItem

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `CollectionTtl` | integer | How long, [in seconds](https://www.twilio.com/docs/sync/limits#sync-payload-limits), before the Map Item's parent Sync Map expires (time-to-live) and is deleted. This parameter can only be used when the Map Item's `data` or `ttl` is updated in the same request. |
  | `Data` | string | A JSON string that represents an arbitrary, schema-less object that the Map Item stores. Can be up to 16 KiB in length. |
  | `ItemTtl` | integer | How long, [in seconds](https://www.twilio.com/docs/sync/limits#sync-payload-limits), before the Map Item expires (time-to-live) and is deleted. |
  | `Ttl` | integer | An alias for `item_ttl`. If both parameters are provided, this value is ignored. |
  """
  @spec update(Client.t(), String.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Sync.V1.Service.Map.Item.t()} | {:error, Twilio.Error.t()}
  def update(client, service_sid, map_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/Services/#{service_sid}/Maps/#{map_sid}/Items/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://sync.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Sync.V1.Service.Map.Item)}
    end
  end

  @doc """


  Operation: `DeleteSyncMapItem` | Tags: SyncV1SyncMapItem
  """
  @spec delete(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, service_sid, map_sid, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Services/#{service_sid}/Maps/#{map_sid}/Items/#{sid}",
      opts: opts,
      base_url: "https://sync.twilio.com"
    )
  end
end
