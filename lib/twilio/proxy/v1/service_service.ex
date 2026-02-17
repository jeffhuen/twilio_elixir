# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Proxy.V1.ServiceService do
  @moduledoc """


  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all Services for Twilio Proxy. A maximum of 100 records will be returned per page.

  Operation: `ListService` | Tags: ProxyV1Service
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Services",
           params: params,
           opts: opts,
           base_url: "https://proxy.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "services")

        {:ok,
         %{
           page
           | items: Deserializer.deserialize_list(page.items, Twilio.Resources.Proxy.V1.Service)
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all Services for Twilio Proxy. A maximum of 100 records will be returned per page. (lazy auto-pagination)."
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
  Create a new Service for Twilio Proxy

  Operation: `CreateService` | Tags: ProxyV1Service

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `UniqueName` | string | An application-defined string that uniquely identifies the resource. This value must be 191 characters or fewer in length and be unique. **This value should not have PII.** |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `CallbackUrl` | string (uri) | The URL we should call when the interaction status changes. |
  | `ChatInstanceSid` | string | The SID of the Chat Service Instance managed by Proxy Service. The Chat Service enables Proxy to forward SMS and channel messages to this chat instance. This is a one-to-one relationship. |
  | `DefaultTtl` | integer | The default `ttl` value to set for Sessions created in the Service. The TTL (time to live) is measured in seconds after the Session's last create or last Interaction. The default value of `0` indicates an unlimited Session length. You can override a Session's default TTL value by setting its `ttl` value. |
  | `GeoMatchLevel` | string |  Values: `area-code`, `overlay`, `radius`, `country` |
  | `InterceptCallbackUrl` | string (uri) | The URL we call on each interaction. If we receive a 403 status, we block the interaction; otherwise the interaction continues. |
  | `NumberSelectionBehavior` | string |  Values: `avoid-sticky`, `prefer-sticky` |
  | `OutOfSessionCallbackUrl` | string (uri) | The URL we should call when an inbound call or SMS action occurs on a closed or non-existent Session. If your server (or a Twilio [function](https://www.twilio.com/en-us/serverless/functions)) responds with valid [TwiML](https://www.twilio.com/docs/voice/twiml), we will process it. This means it is possible, for example, to play a message for a call, send an automated text message response, or redirect a call to another Phone Number. See [Out-of-Session Callback Response Guide](https://www.twilio.com/docs/proxy/out-session-callback-response-guide) for more information. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Proxy.V1.Service.t()} | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Services",
             params: params,
             opts: opts,
             base_url: "https://proxy.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Proxy.V1.Service)}
    end
  end

  @doc """
  Fetch a specific Service.

  Operation: `FetchService` | Tags: ProxyV1Service
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Proxy.V1.Service.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Services/#{sid}",
             opts: opts,
             base_url: "https://proxy.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Proxy.V1.Service)}
    end
  end

  @doc """
  Update a specific Service.

  Operation: `UpdateService` | Tags: ProxyV1Service

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `CallbackUrl` | string (uri) | The URL we should call when the interaction status changes. |
  | `ChatInstanceSid` | string | The SID of the Chat Service Instance managed by Proxy Service. The Chat Service enables Proxy to forward SMS and channel messages to this chat instance. This is a one-to-one relationship. |
  | `DefaultTtl` | integer | The default `ttl` value to set for Sessions created in the Service. The TTL (time to live) is measured in seconds after the Session's last create or last Interaction. The default value of `0` indicates an unlimited Session length. You can override a Session's default TTL value by setting its `ttl` value. |
  | `GeoMatchLevel` | string |  Values: `area-code`, `overlay`, `radius`, `country` |
  | `InterceptCallbackUrl` | string (uri) | The URL we call on each interaction. If we receive a 403 status, we block the interaction; otherwise the interaction continues. |
  | `NumberSelectionBehavior` | string |  Values: `avoid-sticky`, `prefer-sticky` |
  | `OutOfSessionCallbackUrl` | string (uri) | The URL we should call when an inbound call or SMS action occurs on a closed or non-existent Session. If your server (or a Twilio [function](https://www.twilio.com/en-us/serverless/functions)) responds with valid [TwiML](https://www.twilio.com/docs/voice/twiml), we will process it. This means it is possible, for example, to play a message for a call, send an automated text message response, or redirect a call to another Phone Number. See [Out-of-Session Callback Response Guide](https://www.twilio.com/docs/proxy/out-session-callback-response-guide) for more information. |
  | `UniqueName` | string | An application-defined string that uniquely identifies the resource. This value must be 191 characters or fewer in length and be unique. **This value should not have PII.** |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Proxy.V1.Service.t()} | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Services/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://proxy.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Proxy.V1.Service)}
    end
  end

  @doc """
  Delete a specific Service.

  Operation: `DeleteService` | Tags: ProxyV1Service
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Services/#{sid}",
      opts: opts,
      base_url: "https://proxy.twilio.com"
    )
  end
end
