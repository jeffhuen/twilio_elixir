# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Taskrouter.V1.Workspace.TaskQueue.TaskQueueBulkRealTimeStatistics do
  @moduledoc """
  TaskQueueBulkRealTimeStatistics resource.

  Parent: `/Workspaces/{WorkspaceSid}/TaskQueues`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the TaskQueue resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `task_queue_data` | The real-time statistics for each requested TaskQueue SID. `task_queue_data` returns the following attributes:  `task_queue_sid`: The SID of the TaskQueue from which these statistics were calculated.  `total_available_workers`: The total number of Workers available for Tasks in the TaskQueue.  `total_eligible_workers`: The total number of Workers eligible for Tasks in the TaskQueue, regardless of their Activity state.  `total_tasks`: The total number of Tasks.  `longest_task_waiting_age`: The age of the longest waiting Task.  `longest_task_waiting_sid`: The SID of the longest waiting Task.  `tasks_by_status`: The number of Tasks grouped by their current status.  `tasks_by_priority`: The number of Tasks grouped by priority.  `activity_statistics`: The number of current Workers grouped by Activity.  |
  | `task_queue_response_count` | The number of TaskQueue statistics received in task_queue_data. |
  | `url` | The absolute URL of the TaskQueue statistics resource.. Format: uri |
  | `workspace_sid` | The SID of the Workspace that contains the TaskQueue. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          task_queue_data: list() | nil,
          task_queue_response_count: integer(),
          url: String.t() | nil,
          workspace_sid: String.t() | nil
        }

  defstruct [:account_sid, :task_queue_data, :task_queue_response_count, :url, :workspace_sid]

  @object_name "taskrouter.v1.workspace.task_queue.task_queue_bulk_real_time_statistics"
  def object_name, do: @object_name
end
