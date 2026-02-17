# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Taskrouter.V1.Workspace.EventService do
  @moduledoc """
  Service for Event API operations.

  Operations: `list`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListEvent` | Tags: TaskrouterV1Event

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `EndDate` | string (date-time) | Only include Events that occurred on or before this date, specified in GMT as an [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date-time. |
  | `EventType` | string | The type of Events to read. Returns only Events of the type specified. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Minutes` | integer | The period of events to read in minutes. Returns only Events that occurred since this many minutes in the past. The default is `15` minutes. Task Attributes for Events occuring more 43,200 minutes ago will be redacted. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ReservationSid` | string | The SID of the Reservation with the Events to read. Returns only Events that pertain to the specified Reservation. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `StartDate` | string (date-time) | Only include Events from on or after this date and time, specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format. Task Attributes for Events older than 30 days will be redacted. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `TaskQueueSid` | string | The SID of the TaskQueue with the Events to read. Returns only the Events that pertain to the specified TaskQueue. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `TaskSid` | string | The SID of the Task with the Events to read. Returns only the Events that pertain to the specified Task. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `WorkerSid` | string | The SID of the Worker with the Events to read. Returns only the Events that pertain to the specified Worker. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `WorkflowSid` | string | The SID of the Workflow with the Events to read. Returns only the Events that pertain to the specified Workflow. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `TaskChannel` | string | The TaskChannel with the Events to read. Returns only the Events that pertain to the specified TaskChannel. |
  | `Sid` | string | The SID of the Event resource to read. |
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, workspace_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Workspaces/#{workspace_sid}/Events",
           params: params,
           opts: opts,
           base_url: "https://taskrouter.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "events")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Taskrouter.V1.Workspace.Event
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream:  (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, workspace_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, workspace_sid, Map.merge(params, page_opts), opts)
      end,
      "events"
    )
  end

  @doc """


  Operation: `FetchEvent` | Tags: TaskrouterV1Event
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Taskrouter.V1.Workspace.Event.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, workspace_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Workspaces/#{workspace_sid}/Events/#{sid}",
             opts: opts,
             base_url: "https://taskrouter.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Taskrouter.V1.Workspace.Event)}
    end
  end
end
