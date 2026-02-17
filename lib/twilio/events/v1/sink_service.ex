# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Events.V1.SinkService do
  @moduledoc """
  Sink destination to send events to

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a paginated list of Sinks belonging to the account used to make the request.

  Operation: `ListSink` | Tags: EventsV1Sink

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `InUse` | boolean | A boolean query parameter filtering the results to return sinks used/not used by a subscription. |
  | `Status` | string | A String query parameter filtering the results by status `initialized`, `validating`, `active` or `failed`. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Sinks",
           params: params,
           opts: opts,
           base_url: "https://events.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "sinks")

        {:ok,
         %{
           page
           | items: Deserializer.deserialize_list(page.items, Twilio.Resources.Events.V1.Sink)
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a paginated list of Sinks belonging to the account used to make the request. (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "sinks"
    )
  end

  @doc """
  Create a new Sink

  Operation: `CreateSink` | Tags: EventsV1Sink

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Description` | string | A human readable description for the Sink **This value should not contain PII.** |
  | `SinkConfiguration` | string | The information required for Twilio to connect to the provided Sink encoded as JSON. |
  | `SinkType` | string |  Values: `kinesis`, `webhook`, `segment`, `email` |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Events.V1.Sink.t()} | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Sinks",
             params: params,
             opts: opts,
             base_url: "https://events.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Events.V1.Sink)}
    end
  end

  @doc """
  Fetch a specific Sink.

  Operation: `FetchSink` | Tags: EventsV1Sink
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Events.V1.Sink.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Sinks/#{sid}",
             opts: opts,
             base_url: "https://events.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Events.V1.Sink)}
    end
  end

  @doc """
  Update a specific Sink

  Operation: `UpdateSink` | Tags: EventsV1Sink

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Description` | string | A human readable description for the Sink **This value should not contain PII.** |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Events.V1.Sink.t()} | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Sinks/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://events.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Events.V1.Sink)}
    end
  end

  @doc """
  Delete a specific Sink.

  Operation: `DeleteSink` | Tags: EventsV1Sink
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Sinks/#{sid}",
      opts: opts,
      base_url: "https://events.twilio.com"
    )
  end
end
