# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Taskrouter.V1.Workspace.Workflow.WorkflowRealTimeStatistics do
  @moduledoc """


  Parent: `/Workspaces/{WorkspaceSid}/Workflows/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Workflow resource. |
  | `longest_task_waiting_age` | The age of the longest waiting Task. |
  | `longest_task_waiting_sid` | The SID of the longest waiting Task. |
  | `tasks_by_priority` | The number of Tasks by priority. For example: `{"0": "10", "99": "5"}` shows 10 Tasks at priority 0 and 5 at priority 99. |
  | `tasks_by_status` | The number of Tasks by their current status. For example: `{"pending": "1", "reserved": "3", "assigned": "2", "completed": "5"}`. |
  | `total_tasks` | The total number of Tasks. |
  | `url` | The absolute URL of the Workflow statistics resource.. Format: uri |
  | `workflow_sid` | Returns the list of Tasks that are being controlled by the Workflow with the specified SID value. |
  | `workspace_sid` | The SID of the Workspace that contains the Workflow. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          longest_task_waiting_age: integer(),
          longest_task_waiting_sid: String.t() | nil,
          tasks_by_priority: String.t() | nil,
          tasks_by_status: String.t() | nil,
          total_tasks: integer(),
          url: String.t() | nil,
          workflow_sid: String.t() | nil,
          workspace_sid: String.t() | nil
        }

  defstruct [
    :account_sid,
    :longest_task_waiting_age,
    :longest_task_waiting_sid,
    :tasks_by_priority,
    :tasks_by_status,
    :total_tasks,
    :url,
    :workflow_sid,
    :workspace_sid
  ]

  @object_name "taskrouter.v1.workspace.workflow.workflow_real_time_statistics"
  def object_name, do: @object_name
end
