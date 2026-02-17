# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Taskrouter.V1.Workspace.Worker.WorkerStatisticsService do
  @moduledoc """


  Operations: `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `FetchWorkerInstanceStatistics` | Tags: TaskrouterV1WorkerStatistics

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Minutes` | integer | Only calculate statistics since this many minutes in the past. The default 15 minutes. This is helpful for displaying statistics for the last 15 minutes, 240 minutes (4 hours), and 480 minutes (8 hours) to see trends. |
  | `StartDate` | string (date-time) | Only calculate statistics from this date and time and later, specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format. |
  | `EndDate` | string (date-time) | Only include usage that occurred on or before this date, specified in GMT as an [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date-time. |
  | `TaskChannel` | string | Only calculate statistics on this TaskChannel. Can be the TaskChannel's SID or its `unique_name`, such as `voice`, `sms`, or `default`. |
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Taskrouter.V1.Workspace.Worker.WorkerStatistics.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, workspace_sid, worker_sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/Workspaces/#{workspace_sid}/Workers/#{worker_sid}/Statistics",
             opts: opts,
             base_url: "https://taskrouter.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Taskrouter.V1.Workspace.Worker.WorkerStatistics
       )}
    end
  end
end
