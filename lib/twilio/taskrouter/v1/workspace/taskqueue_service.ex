# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Taskrouter.V1.Workspace.TaskqueueService do
  @moduledoc """


  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListTaskQueue` | Tags: TaskrouterV1TaskQueue

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `FriendlyName` | string | The `friendly_name` of the TaskQueue resources to read. |
  | `EvaluateWorkerAttributes` | string | The attributes of the Workers to read. Returns the TaskQueues with Workers that match the attributes specified in this parameter. |
  | `WorkerSid` | string | The SID of the Worker with the TaskQueue resources to read. |
  | `Ordering` | string | Sorting parameter for TaskQueues |
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, workspace_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Workspaces/#{workspace_sid}/TaskQueues",
           params: params,
           opts: opts,
           base_url: "https://taskrouter.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "task_queues")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Taskrouter.V1.Workspace.Taskqueue
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
      "task_queues"
    )
  end

  @doc """


  Operation: `CreateTaskQueue` | Tags: TaskrouterV1TaskQueue

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `FriendlyName` | string | A descriptive string that you create to describe the TaskQueue. For example `Support-Tier 1`, `Sales`, or `Escalation`. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `AssignmentActivitySid` | string | The SID of the Activity to assign Workers when a task is assigned to them. |
  | `MaxReservedWorkers` | integer | The maximum number of Workers to reserve for the assignment of a Task in the queue. Can be an integer between 1 and 50, inclusive and defaults to 1. |
  | `ReservationActivitySid` | string | The SID of the Activity to assign Workers when a task is reserved for them. |
  | `TargetWorkers` | string | A string that describes the Worker selection criteria for any Tasks that enter the TaskQueue. For example, `'"language" == "spanish"'`. The default value is `1==1`. If this value is empty, Tasks will wait in the TaskQueue until they are deleted or moved to another TaskQueue. For more information about Worker selection, see [Describing Worker selection criteria](https://www.twilio.com/docs/taskrouter/api/taskqueues#target-workers). |
  | `TaskOrder` | string |  Values: `FIFO`, `LIFO` |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Taskrouter.V1.Workspace.Taskqueue.t()}
          | {:error, Twilio.Error.t()}
  def create(client, workspace_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Workspaces/#{workspace_sid}/TaskQueues",
             params: params,
             opts: opts,
             base_url: "https://taskrouter.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Taskrouter.V1.Workspace.Taskqueue)}
    end
  end

  @doc """


  Operation: `FetchTaskQueue` | Tags: TaskrouterV1TaskQueue
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Taskrouter.V1.Workspace.Taskqueue.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, workspace_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Workspaces/#{workspace_sid}/TaskQueues/#{sid}",
             opts: opts,
             base_url: "https://taskrouter.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Taskrouter.V1.Workspace.Taskqueue)}
    end
  end

  @doc """


  Operation: `UpdateTaskQueue` | Tags: TaskrouterV1TaskQueue

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `AssignmentActivitySid` | string | The SID of the Activity to assign Workers when a task is assigned for them. |
  | `FriendlyName` | string | A descriptive string that you create to describe the TaskQueue. For example `Support-Tier 1`, `Sales`, or `Escalation`. |
  | `MaxReservedWorkers` | integer | The maximum number of Workers to create reservations for the assignment of a task while in the queue. Maximum of 50. |
  | `ReservationActivitySid` | string | The SID of the Activity to assign Workers when a task is reserved for them. |
  | `TargetWorkers` | string | A string describing the Worker selection criteria for any Tasks that enter the TaskQueue. For example '"language" == "spanish"' If no TargetWorkers parameter is provided, Tasks will wait in the queue until they are either deleted or moved to another queue. Additional examples on how to describing Worker selection criteria below. |
  | `TaskOrder` | string |  Values: `FIFO`, `LIFO` |
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Taskrouter.V1.Workspace.Taskqueue.t()}
          | {:error, Twilio.Error.t()}
  def update(client, workspace_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Workspaces/#{workspace_sid}/TaskQueues/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://taskrouter.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Taskrouter.V1.Workspace.Taskqueue)}
    end
  end

  @doc """


  Operation: `DeleteTaskQueue` | Tags: TaskrouterV1TaskQueue
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, workspace_sid, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Workspaces/#{workspace_sid}/TaskQueues/#{sid}",
      opts: opts,
      base_url: "https://taskrouter.twilio.com"
    )
  end
end
