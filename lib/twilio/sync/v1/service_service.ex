# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Sync.V1.ServiceService do
  @moduledoc """
  Containers for sync objects

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListService` | Tags: SyncV1Service
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Services",
           params: params,
           opts: opts,
           base_url: "https://sync.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "services")

        {:ok,
         %{
           page
           | items: Deserializer.deserialize_list(page.items, Twilio.Resources.Sync.V1.Service)
         }}

      error ->
        error
    end
  end

  @doc "Stream:  (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "services"
    )
  end

  @doc """


  Operation: `CreateService` | Tags: SyncV1Service

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `AclEnabled` | boolean | Whether token identities in the Service must be granted access to Sync objects by using the [Permissions](https://www.twilio.com/docs/sync/api/sync-permissions) resource. |
  | `FriendlyName` | string | A string that you assign to describe the resource. |
  | `ReachabilityDebouncingEnabled` | boolean | Whether every `endpoint_disconnected` event should occur after a configurable delay. The default is `false`, where the `endpoint_disconnected` event occurs immediately after disconnection. When `true`, intervening reconnections can prevent the `endpoint_disconnected` event. |
  | `ReachabilityDebouncingWindow` | integer | The reachability event delay in milliseconds if `reachability_debouncing_enabled` = `true`.  Must be between 1,000 and 30,000 and defaults to 5,000. This is the number of milliseconds after the last running client disconnects, and a Sync identity is declared offline, before the `webhook_url` is called if all endpoints remain offline. A reconnection from the same identity by any endpoint during this interval prevents the call to `webhook_url`. |
  | `ReachabilityWebhooksEnabled` | boolean | Whether the service instance should call `webhook_url` when client endpoints connect to Sync. The default is `false`. |
  | `WebhookUrl` | string (uri) | The URL we should call when Sync objects are manipulated. |
  | `WebhooksFromRestEnabled` | boolean | Whether the Service instance should call `webhook_url` when the REST API is used to update Sync objects. The default is `false`. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Sync.V1.Service.t()} | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Services",
             params: params,
             opts: opts,
             base_url: "https://sync.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Sync.V1.Service)}
    end
  end

  @doc """


  Operation: `FetchService` | Tags: SyncV1Service
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Sync.V1.Service.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Services/#{sid}",
             opts: opts,
             base_url: "https://sync.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Sync.V1.Service)}
    end
  end

  @doc """


  Operation: `UpdateService` | Tags: SyncV1Service

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `AclEnabled` | boolean | Whether token identities in the Service must be granted access to Sync objects by using the [Permissions](https://www.twilio.com/docs/sync/api/sync-permissions) resource. |
  | `FriendlyName` | string | A string that you assign to describe the resource. |
  | `ReachabilityDebouncingEnabled` | boolean | Whether every `endpoint_disconnected` event should occur after a configurable delay. The default is `false`, where the `endpoint_disconnected` event occurs immediately after disconnection. When `true`, intervening reconnections can prevent the `endpoint_disconnected` event. |
  | `ReachabilityDebouncingWindow` | integer | The reachability event delay in milliseconds if `reachability_debouncing_enabled` = `true`.  Must be between 1,000 and 30,000 and defaults to 5,000. This is the number of milliseconds after the last running client disconnects, and a Sync identity is declared offline, before the webhook is called if all endpoints remain offline. A reconnection from the same identity by any endpoint during this interval prevents the webhook from being called. |
  | `ReachabilityWebhooksEnabled` | boolean | Whether the service instance should call `webhook_url` when client endpoints connect to Sync. The default is `false`. |
  | `WebhookUrl` | string (uri) | The URL we should call when Sync objects are manipulated. |
  | `WebhooksFromRestEnabled` | boolean | Whether the Service instance should call `webhook_url` when the REST API is used to update Sync objects. The default is `false`. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Sync.V1.Service.t()} | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Services/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://sync.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Sync.V1.Service)}
    end
  end

  @doc """


  Operation: `DeleteService` | Tags: SyncV1Service
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Services/#{sid}",
      opts: opts,
      base_url: "https://sync.twilio.com"
    )
  end
end
