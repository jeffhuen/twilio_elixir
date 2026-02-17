# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Taskrouter.V1.Workspace.Taskqueue.TaskQueueRealTimeStatistics do
  @moduledoc """


  Parent: `/Workspaces/{WorkspaceSid}/TaskQueues/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the TaskQueue resource. |
  | `activity_statistics` | The number of current Workers by Activity. |
  | `longest_relative_task_age_in_queue` | The relative age in the TaskQueue for the longest waiting Task. Calculation is based on the time when the Task entered the TaskQueue. |
  | `longest_relative_task_sid_in_queue` | The Task SID of the Task waiting in the TaskQueue the longest. Calculation is based on the time when the Task entered the TaskQueue. |
  | `longest_task_waiting_age` | The age of the longest waiting Task. |
  | `longest_task_waiting_sid` | The SID of the longest waiting Task. |
  | `task_queue_sid` | The SID of the TaskQueue from which these statistics were calculated. |
  | `tasks_by_priority` | The number of Tasks by priority. For example: `{"0": "10", "99": "5"}` shows 10 Tasks at priority 0 and 5 at priority 99. |
  | `tasks_by_status` | The number of Tasks by their current status. For example: `{"pending": "1", "reserved": "3", "assigned": "2", "completed": "5"}`. |
  | `total_available_workers` | The total number of Workers in the TaskQueue with an `available` status. Workers with an `available` status may already have active interactions or may have none. |
  | `total_eligible_workers` | The total number of Workers eligible for Tasks in the TaskQueue, independent of their Activity state. |
  | `total_tasks` | The total number of Tasks. |
  | `url` | The absolute URL of the TaskQueue statistics resource.. Format: uri |
  | `workspace_sid` | The SID of the Workspace that contains the TaskQueue. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          activity_statistics: list() | nil,
          longest_relative_task_age_in_queue: integer(),
          longest_relative_task_sid_in_queue: String.t() | nil,
          longest_task_waiting_age: integer(),
          longest_task_waiting_sid: String.t() | nil,
          task_queue_sid: String.t() | nil,
          tasks_by_priority: String.t() | nil,
          tasks_by_status: String.t() | nil,
          total_available_workers: integer(),
          total_eligible_workers: integer(),
          total_tasks: integer(),
          url: String.t() | nil,
          workspace_sid: String.t() | nil
        }

  defstruct [
    :account_sid,
    :activity_statistics,
    :longest_relative_task_age_in_queue,
    :longest_relative_task_sid_in_queue,
    :longest_task_waiting_age,
    :longest_task_waiting_sid,
    :task_queue_sid,
    :tasks_by_priority,
    :tasks_by_status,
    :total_available_workers,
    :total_eligible_workers,
    :total_tasks,
    :url,
    :workspace_sid
  ]

  @object_name "taskrouter.v1.workspace.task_queue.task_queue_real_time_statistics"
  def object_name, do: @object_name
end
