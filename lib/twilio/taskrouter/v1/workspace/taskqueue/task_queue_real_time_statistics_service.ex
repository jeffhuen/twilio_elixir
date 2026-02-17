# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Taskrouter.V1.Workspace.Taskqueue.TaskQueueRealTimeStatisticsService do
  @moduledoc """


  Operations: `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `FetchTaskQueueRealTimeStatistics` | Tags: TaskrouterV1TaskQueueRealTimeStatistics

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `TaskChannel` | string | The TaskChannel for which to fetch statistics. Can be the TaskChannel's SID or its `unique_name`, such as `voice`, `sms`, or `default`. |
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok,
           Twilio.Resources.Taskrouter.V1.Workspace.Taskqueue.TaskQueueRealTimeStatistics.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, workspace_sid, task_queue_sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/Workspaces/#{workspace_sid}/TaskQueues/#{task_queue_sid}/RealTimeStatistics",
             opts: opts,
             base_url: "https://taskrouter.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Taskrouter.V1.Workspace.Taskqueue.TaskQueueRealTimeStatistics
       )}
    end
  end
end
