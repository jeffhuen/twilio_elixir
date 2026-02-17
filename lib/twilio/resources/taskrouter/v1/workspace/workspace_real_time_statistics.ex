# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Taskrouter.V1.Workspace.WorkspaceRealTimeStatistics do
  @moduledoc """
  WorkspaceRealTimeStatistics resource.

  Parent: `/Workspaces/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Workspace resource. |
  | `activity_statistics` | The number of current Workers by Activity. |
  | `longest_task_waiting_age` | The age of the longest waiting Task. |
  | `longest_task_waiting_sid` | The SID of the longest waiting Task. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `tasks_by_priority` | The number of Tasks by priority. For example: `{"0": "10", "99": "5"}` shows 10 Tasks at priority 0 and 5 at priority 99. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `tasks_by_status` | The number of Tasks by their current status. For example: `{"pending": "1", "reserved": "3", "assigned": "2", "completed": "5"}`. |
  | `total_tasks` | The total number of Tasks. |
  | `total_workers` | The total number of Workers in the Workspace. |
  | `url` | The absolute URL of the Workspace statistics resource.. Format: uri |
  | `workspace_sid` | The SID of the Workspace. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          activity_statistics: list() | nil,
          longest_task_waiting_age: integer(),
          longest_task_waiting_sid: String.t() | nil,
          tasks_by_priority: String.t() | nil,
          tasks_by_status: String.t() | nil,
          total_tasks: integer(),
          total_workers: integer(),
          url: String.t() | nil,
          workspace_sid: String.t() | nil
        }

  defstruct [
    :account_sid,
    :activity_statistics,
    :longest_task_waiting_age,
    :longest_task_waiting_sid,
    :tasks_by_priority,
    :tasks_by_status,
    :total_tasks,
    :total_workers,
    :url,
    :workspace_sid
  ]

  @object_name "taskrouter.v1.workspace.workspace_real_time_statistics"
  def object_name, do: @object_name
end
