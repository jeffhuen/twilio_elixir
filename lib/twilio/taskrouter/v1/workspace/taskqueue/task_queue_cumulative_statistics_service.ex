# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Taskrouter.V1.Workspace.Taskqueue.TaskQueueCumulativeStatisticsService do
  @moduledoc """


  Operations: `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `FetchTaskQueueCumulativeStatistics` | Tags: TaskrouterV1TaskQueueCumulativeStatistics

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `EndDate` | string (date-time) | Only calculate statistics from this date and time and earlier, specified in GMT as an [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date-time. |
  | `Minutes` | integer | Only calculate statistics since this many minutes in the past. The default is 15 minutes. |
  | `StartDate` | string (date-time) | Only calculate statistics from this date and time and later, specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format. |
  | `TaskChannel` | string | Only calculate cumulative statistics on this TaskChannel. Can be the TaskChannel's SID or its `unique_name`, such as `voice`, `sms`, or `default`. |
  | `SplitByWaitTime` | string | A comma separated list of values that describes the thresholds, in seconds, to calculate statistics on. For each threshold specified, the number of Tasks canceled and reservations accepted above and below the specified thresholds in seconds are computed. TaskRouter will calculate statistics on up to 10,000 Tasks/Reservations for any given threshold. |
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok,
           Twilio.Resources.Taskrouter.V1.Workspace.Taskqueue.TaskQueueCumulativeStatistics.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, workspace_sid, task_queue_sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/Workspaces/#{workspace_sid}/TaskQueues/#{task_queue_sid}/CumulativeStatistics",
             opts: opts,
             base_url: "https://taskrouter.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Taskrouter.V1.Workspace.Taskqueue.TaskQueueCumulativeStatistics
       )}
    end
  end
end
