# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Sync.V1.Service.MapService do
  @moduledoc """
  Sync map objects

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListSyncMap` | Tags: SyncV1SyncMap
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, service_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Services/#{service_sid}/Maps",
           params: params,
           opts: opts,
           base_url: "https://sync.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "maps")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(page.items, Twilio.Resources.Sync.V1.Service.Map)
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
      "maps"
    )
  end

  @doc """


  Operation: `CreateSyncMap` | Tags: SyncV1SyncMap

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `CollectionTtl` | integer | How long, [in seconds](https://www.twilio.com/docs/sync/limits#sync-payload-limits), before the Sync Map expires (time-to-live) and is deleted. |
  | `Ttl` | integer | An alias for `collection_ttl`. If both parameters are provided, this value is ignored. |
  | `UniqueName` | string | An application-defined string that uniquely identifies the resource. It can be used as an alternative to the `sid` in the URL path to address the resource. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Sync.V1.Service.Map.t()} | {:error, Twilio.Error.t()}
  def create(client, service_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Services/#{service_sid}/Maps",
             params: params,
             opts: opts,
             base_url: "https://sync.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Sync.V1.Service.Map)}
    end
  end

  @doc """


  Operation: `FetchSyncMap` | Tags: SyncV1SyncMap
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Sync.V1.Service.Map.t()} | {:error, Twilio.Error.t()}
  def fetch(client, service_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Services/#{service_sid}/Maps/#{sid}",
             opts: opts,
             base_url: "https://sync.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Sync.V1.Service.Map)}
    end
  end

  @doc """


  Operation: `UpdateSyncMap` | Tags: SyncV1SyncMap

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `CollectionTtl` | integer | How long, [in seconds](https://www.twilio.com/docs/sync/limits#sync-payload-limits), before the Sync Map expires (time-to-live) and is deleted. |
  | `Ttl` | integer | An alias for `collection_ttl`. If both parameters are provided, this value is ignored. |
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Sync.V1.Service.Map.t()} | {:error, Twilio.Error.t()}
  def update(client, service_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Services/#{service_sid}/Maps/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://sync.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Sync.V1.Service.Map)}
    end
  end

  @doc """


  Operation: `DeleteSyncMap` | Tags: SyncV1SyncMap
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, service_sid, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Services/#{service_sid}/Maps/#{sid}",
      opts: opts,
      base_url: "https://sync.twilio.com"
    )
  end
end
