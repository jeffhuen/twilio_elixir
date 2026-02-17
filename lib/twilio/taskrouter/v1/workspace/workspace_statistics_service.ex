# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Taskrouter.V1.Workspace.WorkspaceStatisticsService do
  @moduledoc """


  Operations: `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `FetchWorkspaceStatistics` | Tags: TaskrouterV1WorkspaceStatistics

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Minutes` | integer | Only calculate statistics since this many minutes in the past. The default 15 minutes. This is helpful for displaying statistics for the last 15 minutes, 240 minutes (4 hours), and 480 minutes (8 hours) to see trends. |
  | `StartDate` | string (date-time) | Only calculate statistics from this date and time and later, specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format. |
  | `EndDate` | string (date-time) | Only calculate statistics from this date and time and earlier, specified in GMT as an [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date-time. |
  | `TaskChannel` | string | Only calculate statistics on this TaskChannel. Can be the TaskChannel's SID or its `unique_name`, such as `voice`, `sms`, or `default`. |
  | `SplitByWaitTime` | string | A comma separated list of values that describes the thresholds, in seconds, to calculate statistics on. For each threshold specified, the number of Tasks canceled and reservations accepted above and below the specified thresholds in seconds are computed. For example, `5,30` would show splits of Tasks that were canceled or accepted before and after 5 seconds and before and after 30 seconds. This can be used to show short abandoned Tasks or Tasks that failed to meet an SLA. |
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Taskrouter.V1.Workspace.WorkspaceStatistics.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, workspace_sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Workspaces/#{workspace_sid}/Statistics",
             opts: opts,
             base_url: "https://taskrouter.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Taskrouter.V1.Workspace.WorkspaceStatistics
       )}
    end
  end
end
