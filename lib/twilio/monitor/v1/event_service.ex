# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Monitor.V1.EventService do
  @moduledoc """
  Debugger events

  Operations: `list`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Returns a list of events in the account, sorted by event-date.

  Operation: `ListEvent` | Tags: MonitorV1Event

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ActorSid` | string | Only include events initiated by this Actor. Useful for auditing actions taken by specific users or API credentials. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `EventType` | string | Only include events of this [Event Type](https://www.twilio.com/docs/usage/monitor-events#event-types). |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ResourceSid` | string | Only include events that refer to this resource. Useful for discovering the history of a specific resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `SourceIpAddress` | string | Only include events that originated from this IP address. Useful for tracking suspicious activity originating from the API or the Twilio Console. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `StartDate` | string (date-time) | Only include events that occurred on or after this date. Specify the date in GMT and [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `EndDate` | string (date-time) | Only include events that occurred on or before this date. Specify the date in GMT and [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Events",
           params: params,
           opts: opts,
           base_url: "https://monitor.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "events")

        {:ok,
         %{
           page
           | items: Deserializer.deserialize_list(page.items, Twilio.Resources.Monitor.V1.Event)
         }}

      error ->
        error
    end
  end

  @doc "Stream: Returns a list of events in the account, sorted by event-date. (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "events"
    )
  end

  @doc """


  Operation: `FetchEvent` | Tags: MonitorV1Event
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Monitor.V1.Event.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Events/#{sid}",
             opts: opts,
             base_url: "https://monitor.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Monitor.V1.Event)}
    end
  end
end
