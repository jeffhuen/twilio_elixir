# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Taskrouter.V1.Workspace.Workflow.WorkflowCumulativeStatistics do
  @moduledoc """
  WorkflowCumulativeStatistics resource.

  Parent: `/Workspaces/{WorkspaceSid}/Workflows/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Workflow resource. |
  | `avg_task_acceptance_time` | The average time in seconds between Task creation and acceptance. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `end_time` | The end of the interval during which these statistics were calculated, in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `reservations_accepted` | The total number of Reservations accepted by Workers. |
  | `reservations_canceled` | The total number of Reservations that were canceled. |
  | `reservations_created` | The total number of Reservations that were created for Workers. |
  | `reservations_rejected` | The total number of Reservations that were rejected. |
  | `reservations_rescinded` | The total number of Reservations that were rescinded. |
  | `reservations_timed_out` | The total number of Reservations that were timed out. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `split_by_wait_time` | A list of objects that describe the number of Tasks canceled and reservations accepted above and below the thresholds specified in seconds. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `start_time` | The beginning of the interval during which these statistics were calculated, in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `tasks_canceled` | The total number of Tasks that were canceled. |
  | `tasks_completed` | The total number of Tasks that were completed. |
  | `tasks_deleted` | The total number of Tasks that were deleted. |
  | `tasks_entered` | The total number of Tasks that entered the Workflow. |
  | `tasks_moved` | The total number of Tasks that were moved from one queue to another. |
  | `tasks_timed_out_in_workflow` | The total number of Tasks that were timed out of their Workflows (and deleted). |
  | `url` | The absolute URL of the Workflow statistics resource.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `wait_duration_until_accepted` | The wait duration statistics (`avg`, `min`, `max`, `total`) for Tasks that were accepted. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `wait_duration_until_canceled` | The wait duration statistics (`avg`, `min`, `max`, `total`) for Tasks that were canceled. |
  | `workflow_sid` | Returns the list of Tasks that are being controlled by the Workflow with the specified Sid value. |
  | `workspace_sid` | The SID of the Workspace that contains the Workflow. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          avg_task_acceptance_time: integer(),
          end_time: String.t() | nil,
          reservations_accepted: integer(),
          reservations_canceled: integer(),
          reservations_created: integer(),
          reservations_rejected: integer(),
          reservations_rescinded: integer(),
          reservations_timed_out: integer(),
          split_by_wait_time: String.t() | nil,
          start_time: String.t() | nil,
          tasks_canceled: integer(),
          tasks_completed: integer(),
          tasks_deleted: integer(),
          tasks_entered: integer(),
          tasks_moved: integer(),
          tasks_timed_out_in_workflow: integer(),
          url: String.t() | nil,
          wait_duration_until_accepted: String.t() | nil,
          wait_duration_until_canceled: String.t() | nil,
          workflow_sid: String.t() | nil,
          workspace_sid: String.t() | nil
        }

  defstruct [
    :account_sid,
    :avg_task_acceptance_time,
    :end_time,
    :reservations_accepted,
    :reservations_canceled,
    :reservations_created,
    :reservations_rejected,
    :reservations_rescinded,
    :reservations_timed_out,
    :split_by_wait_time,
    :start_time,
    :tasks_canceled,
    :tasks_completed,
    :tasks_deleted,
    :tasks_entered,
    :tasks_moved,
    :tasks_timed_out_in_workflow,
    :url,
    :wait_duration_until_accepted,
    :wait_duration_until_canceled,
    :workflow_sid,
    :workspace_sid
  ]

  @object_name "taskrouter.v1.workspace.workflow.workflow_cumulative_statistics"
  def object_name, do: @object_name
end
