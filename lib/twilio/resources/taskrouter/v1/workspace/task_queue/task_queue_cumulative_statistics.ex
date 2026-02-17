# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Taskrouter.V1.Workspace.TaskQueue.TaskQueueCumulativeStatistics do
  @moduledoc """
  TaskQueueCumulativeStatistics resource.

  Parent: `/Workspaces/{WorkspaceSid}/TaskQueues/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the TaskQueue resource. |
  | `avg_task_acceptance_time` | The average time in seconds between Task creation and acceptance. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `end_time` | The end of the interval during which these statistics were calculated, in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `reservations_accepted` | The total number of Reservations accepted for Tasks in the TaskQueue. |
  | `reservations_canceled` | The total number of Reservations canceled for Tasks in the TaskQueue. |
  | `reservations_created` | The total number of Reservations created for Tasks in the TaskQueue. |
  | `reservations_rejected` | The total number of Reservations rejected for Tasks in the TaskQueue. |
  | `reservations_rescinded` | The total number of Reservations rescinded. |
  | `reservations_timed_out` | The total number of Reservations that timed out for Tasks in the TaskQueue. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `split_by_wait_time` | A list of objects that describe the number of Tasks canceled and reservations accepted above and below the thresholds specified in seconds. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `start_time` | The beginning of the interval during which these statistics were calculated, in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `task_queue_sid` | The SID of the TaskQueue from which these statistics were calculated. |
  | `tasks_canceled` | The total number of Tasks canceled in the TaskQueue. |
  | `tasks_completed` | The total number of Tasks completed in the TaskQueue. |
  | `tasks_deleted` | The total number of Tasks deleted in the TaskQueue. |
  | `tasks_entered` | The total number of Tasks entered into the TaskQueue. |
  | `tasks_moved` | The total number of Tasks that were moved from one queue to another. |
  | `url` | The absolute URL of the TaskQueue statistics resource.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `wait_duration_in_queue_until_accepted` | The relative wait duration statistics (`avg`, `min`, `max`, `total`) for Tasks accepted while in the TaskQueue. Calculation is based on the time when the Tasks entered the TaskQueue. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `wait_duration_until_accepted` | The wait duration statistics (`avg`, `min`, `max`, `total`) for Tasks accepted while in the TaskQueue. Calculation is based on the time when the Tasks were created. For transfers, the wait duration is counted from the moment ***the Task was created***, and not from when the transfer was initiated. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `wait_duration_until_canceled` | The wait duration statistics (`avg`, `min`, `max`, `total`) for Tasks canceled while in the TaskQueue. |
  | `workspace_sid` | The SID of the Workspace that contains the TaskQueue. |
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
          task_queue_sid: String.t() | nil,
          tasks_canceled: integer(),
          tasks_completed: integer(),
          tasks_deleted: integer(),
          tasks_entered: integer(),
          tasks_moved: integer(),
          url: String.t() | nil,
          wait_duration_in_queue_until_accepted: String.t() | nil,
          wait_duration_until_accepted: String.t() | nil,
          wait_duration_until_canceled: String.t() | nil,
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
    :task_queue_sid,
    :tasks_canceled,
    :tasks_completed,
    :tasks_deleted,
    :tasks_entered,
    :tasks_moved,
    :url,
    :wait_duration_in_queue_until_accepted,
    :wait_duration_until_accepted,
    :wait_duration_until_canceled,
    :workspace_sid
  ]

  @object_name "taskrouter.v1.workspace.task_queue.task_queue_cumulative_statistics"
  def object_name, do: @object_name
end
