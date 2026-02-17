# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Taskrouter.V1.Workspace.TaskQueue.TaskQueueBulkRealTimeStatisticsService do
  @moduledoc """
  Service for TaskQueueBulkRealTimeStatistics API operations.

  Operations: `create`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Fetch a Task Queue Real Time Statistics in bulk for the array of TaskQueue SIDs, support upto 50 in a request.

  Operation: `CreateTaskQueueBulkRealTimeStatistics` | Tags: TaskrouterV1TaskQueueBulkRealTimeStatistics
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok,
           Twilio.Resources.Taskrouter.V1.Workspace.TaskQueue.TaskQueueBulkRealTimeStatistics.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, workspace_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/Workspaces/#{workspace_sid}/TaskQueues/RealTimeStatistics",
             params: params,
             opts: opts,
             base_url: "https://taskrouter.twilio.com",
             content_type: :json
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Taskrouter.V1.Workspace.TaskQueue.TaskQueueBulkRealTimeStatistics
       )}
    end
  end
end
