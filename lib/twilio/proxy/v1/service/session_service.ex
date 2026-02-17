# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Proxy.V1.Service.SessionService do
  @moduledoc """


  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all Sessions for the Service. A maximum of 100 records will be returned per page.

  Operation: `ListSession` | Tags: ProxyV1Session
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, service_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Services/#{service_sid}/Sessions",
           params: params,
           opts: opts,
           base_url: "https://proxy.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "sessions")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Proxy.V1.Service.Session
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all Sessions for the Service. A maximum of 100 records will be returned per page. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, service_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, service_sid, Map.merge(params, page_opts), opts)
      end,
      "sessions"
    )
  end

  @doc """
  Create a new Session

  Operation: `CreateSession` | Tags: ProxyV1Session

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `DateExpiry` | string (date-time) | The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date when the Session should expire. If this is value is present, it overrides the `ttl` value. |
  | `Mode` | string |  Values: `message-only`, `voice-only`, `voice-and-message` |
  | `Participants` | array | The Participant objects to include in the new session. |
  | `Status` | string |  Values: `open`, `in-progress`, `closed`, `failed`, `unknown` |
  | `Ttl` | integer | The time, in seconds, when the session will expire. The time is measured from the last Session create or the Session's last Interaction. |
  | `UniqueName` | string | An application-defined string that uniquely identifies the resource. This value must be 191 characters or fewer in length and be unique. **This value should not have PII.** |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Proxy.V1.Service.Session.t()} | {:error, Twilio.Error.t()}
  def create(client, service_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Services/#{service_sid}/Sessions",
             params: params,
             opts: opts,
             base_url: "https://proxy.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Proxy.V1.Service.Session)}
    end
  end

  @doc """
  Fetch a specific Session.

  Operation: `FetchSession` | Tags: ProxyV1Session
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Proxy.V1.Service.Session.t()} | {:error, Twilio.Error.t()}
  def fetch(client, service_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Services/#{service_sid}/Sessions/#{sid}",
             opts: opts,
             base_url: "https://proxy.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Proxy.V1.Service.Session)}
    end
  end

  @doc """
  Update a specific Session.

  Operation: `UpdateSession` | Tags: ProxyV1Session

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `DateExpiry` | string (date-time) | The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date when the Session should expire. If this is value is present, it overrides the `ttl` value. |
  | `Status` | string |  Values: `open`, `in-progress`, `closed`, `failed`, `unknown` |
  | `Ttl` | integer | The time, in seconds, when the session will expire. The time is measured from the last Session create or the Session's last Interaction. |
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Proxy.V1.Service.Session.t()} | {:error, Twilio.Error.t()}
  def update(client, service_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Services/#{service_sid}/Sessions/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://proxy.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Proxy.V1.Service.Session)}
    end
  end

  @doc """
  Delete a specific Session.

  Operation: `DeleteSession` | Tags: ProxyV1Session
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, service_sid, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Services/#{service_sid}/Sessions/#{sid}",
      opts: opts,
      base_url: "https://proxy.twilio.com"
    )
  end
end
