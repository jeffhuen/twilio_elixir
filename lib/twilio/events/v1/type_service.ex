# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Events.V1.TypeService do
  @moduledoc """
  Event Types available

  Operations: `list`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a paginated list of all the available Event Types.

  Operation: `ListEventType` | Tags: EventsV1EventType

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `SchemaId` | string | A string parameter filtering the results to return only the Event Types using a given schema. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Types",
           params: params,
           opts: opts,
           base_url: "https://events.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "types")

        {:ok,
         %{
           page
           | items: Deserializer.deserialize_list(page.items, Twilio.Resources.Events.V1.Type)
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a paginated list of all the available Event Types. (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "types"
    )
  end

  @doc """
  Fetch a specific Event Type.

  Operation: `FetchEventType` | Tags: EventsV1EventType
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Events.V1.Type.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Types/#{sid}",
             opts: opts,
             base_url: "https://events.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Events.V1.Type)}
    end
  end
end
