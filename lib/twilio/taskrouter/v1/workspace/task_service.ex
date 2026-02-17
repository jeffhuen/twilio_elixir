# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Taskrouter.V1.Workspace.TaskService do
  @moduledoc """


  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListTask` | Tags: TaskrouterV1Task

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Priority` | integer | The priority value of the Tasks to read. Returns the list of all Tasks in the Workspace with the specified priority. |
  | `AssignmentStatus` | array | The `assignment_status` of the Tasks you want to read. Can be: `pending`, `reserved`, `assigned`, `canceled`, `wrapping`, or `completed`. Returns all Tasks in the Workspace with the specified `assignment_status`. |
  | `WorkflowSid` | string | The SID of the Workflow with the Tasks to read. Returns the Tasks controlled by the Workflow identified by this SID. |
  | `WorkflowName` | string | The friendly name of the Workflow with the Tasks to read. Returns the Tasks controlled by the Workflow identified by this friendly name. |
  | `TaskQueueSid` | string | The SID of the TaskQueue with the Tasks to read. Returns the Tasks waiting in the TaskQueue identified by this SID. |
  | `TaskQueueName` | string | The `friendly_name` of the TaskQueue with the Tasks to read. Returns the Tasks waiting in the TaskQueue identified by this friendly name. |
  | `EvaluateTaskAttributes` | string | The attributes of the Tasks to read. Returns the Tasks that match the attributes specified in this parameter. |
  | `RoutingTarget` | string | A SID of a Worker, Queue, or Workflow to route a Task to |
  | `Ordering` | string | How to order the returned Task resources. By default, Tasks are sorted by ascending DateCreated. This value is specified as: `Attribute:Order`, where `Attribute` can be either `DateCreated`, `Priority`, or `VirtualStartTime` and `Order` can be either `asc` or `desc`. For example, `Priority:desc` returns Tasks ordered in descending order of their Priority. Pairings of sort orders can be specified in a comma-separated list such as `Priority:desc,DateCreated:asc`, which returns the Tasks in descending Priority order and ascending DateCreated Order. The only ordering pairing not allowed is DateCreated and VirtualStartTime. |
  | `HasAddons` | boolean | Whether to read Tasks with Add-ons. If `true`, returns only Tasks with Add-ons. If `false`, returns only Tasks without Add-ons. |
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, workspace_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Workspaces/#{workspace_sid}/Tasks",
           params: params,
           opts: opts,
           base_url: "https://taskrouter.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "tasks")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Taskrouter.V1.Workspace.Task
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
      "tasks"
    )
  end

  @doc """


  Operation: `CreateTask` | Tags: TaskrouterV1Task

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Attributes` | string | A JSON string with the attributes of the new task. This value is passed to the Workflow's `assignment_callback_url` when the Task is assigned to a Worker. For example: `{ "task_type": "call", "twilio_call_sid": "CAxxx", "customer_ticket_number": "12345" }`. |
  | `IgnoreCapacity` | string | A boolean that indicates if the Task should respect a Worker's capacity and availability during assignment. This field can only be used when the `RoutingTarget` field is set to a Worker SID. By setting `IgnoreCapacity` to a value of `true`, `1`, or `yes`, the Task will be routed to the Worker without respecting their capacity and availability. Any other value will enforce the Worker's capacity and availability. The default value of `IgnoreCapacity` is `true` when the `RoutingTarget` is set to a Worker SID.  |
  | `Priority` | integer | The priority to assign the new task and override the default. When supplied, the new Task will have this priority unless it matches a Workflow Target with a Priority set. When not supplied, the new Task will have the priority of the matching Workflow Target. Value can be 0 to 2^31^ (2,147,483,647). |
  | `RoutingTarget` | string | A SID of a Worker, Queue, or Workflow to route a Task to |
  | `TaskChannel` | string | When MultiTasking is enabled, specify the TaskChannel by passing either its `unique_name` or `sid`. Default value is `default`. |
  | `TaskQueueSid` | string | The SID of the TaskQueue in which the Task belongs |
  | `Timeout` | integer | The amount of time in seconds the new task can live before being assigned. Can be up to a maximum of 2 weeks (1,209,600 seconds). The default value is 24 hours (86,400 seconds). On timeout, the `task.canceled` event will fire with description `Task TTL Exceeded`. |
  | `VirtualStartTime` | string (date-time) | The virtual start time to assign the new task and override the default. When supplied, the new task will have this virtual start time. When not supplied, the new task will have the virtual start time equal to `date_created`. Value can't be in the future or before the year of 1900. |
  | `WorkflowSid` | string | The SID of the Workflow that you would like to handle routing for the new Task. If there is only one Workflow defined for the Workspace that you are posting the new task to, this parameter is optional. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Taskrouter.V1.Workspace.Task.t()} | {:error, Twilio.Error.t()}
  def create(client, workspace_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Workspaces/#{workspace_sid}/Tasks",
             params: params,
             opts: opts,
             base_url: "https://taskrouter.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Taskrouter.V1.Workspace.Task)}
    end
  end

  @doc """


  Operation: `FetchTask` | Tags: TaskrouterV1Task
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Taskrouter.V1.Workspace.Task.t()} | {:error, Twilio.Error.t()}
  def fetch(client, workspace_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Workspaces/#{workspace_sid}/Tasks/#{sid}",
             opts: opts,
             base_url: "https://taskrouter.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Taskrouter.V1.Workspace.Task)}
    end
  end

  @doc """


  Operation: `UpdateTask` | Tags: TaskrouterV1Task

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `AssignmentStatus` | string |  Values: `pending`, `reserved`, `assigned`, `canceled`, `completed`, `wrapping` |
  | `Attributes` | string | The JSON string that describes the custom attributes of the task. |
  | `Priority` | integer | The Task's new priority value. When supplied, the Task takes on the specified priority unless it matches a Workflow Target with a Priority set. Value can be 0 to 2^31^ (2,147,483,647). |
  | `Reason` | string | The reason that the Task was canceled or completed. This parameter is required only if the Task is canceled or completed. Setting this value queues the task for deletion and logs the reason. |
  | `TaskChannel` | string | When MultiTasking is enabled, specify the TaskChannel with the task to update. Can be the TaskChannel's SID or its `unique_name`, such as `voice`, `sms`, or `default`. |
  | `VirtualStartTime` | string (date-time) | The task's new virtual start time value. When supplied, the Task takes on the specified virtual start time. Value can't be in the future or before the year of 1900. |
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Taskrouter.V1.Workspace.Task.t()} | {:error, Twilio.Error.t()}
  def update(client, workspace_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Workspaces/#{workspace_sid}/Tasks/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://taskrouter.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Taskrouter.V1.Workspace.Task)}
    end
  end

  @doc """


  Operation: `DeleteTask` | Tags: TaskrouterV1Task
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, workspace_sid, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Workspaces/#{workspace_sid}/Tasks/#{sid}",
      opts: opts,
      base_url: "https://taskrouter.twilio.com"
    )
  end
end
