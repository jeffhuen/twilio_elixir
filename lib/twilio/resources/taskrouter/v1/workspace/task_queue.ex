# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Taskrouter.V1.Workspace.TaskQueue do
  @moduledoc """
  TaskQueue resource.

  SID prefix: `WQ`

  Parent: `/Workspaces/{Sid}`

  ## Sub-resources
  - `cumulative_statistics` — `/v1/Workspaces/{workspace_sid}/TaskQueues/{task_queue_sid}/CumulativeStatistics`
  - `real_time_statistics` — `/v1/Workspaces/{workspace_sid}/TaskQueues/{task_queue_sid}/RealTimeStatistics`
  - `statistics` — `/v1/Workspaces/{workspace_sid}/TaskQueues/{task_queue_sid}/Statistics`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the TaskQueue resource. |
  | `assignment_activity_name` | The name of the Activity to assign Workers when a task is assigned for them. |
  | `assignment_activity_sid` | The SID of the Activity to assign Workers when a task is assigned for them. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `friendly_name` | The string that you assigned to describe the resource.. PII: standard |
  | `links` | The URLs of related resources.. Format: uri-map |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `max_reserved_workers` | The maximum number of Workers to reserve for the assignment of a task in the queue. Can be an integer between 1 and 50, inclusive and defaults to 1. |
  | `reservation_activity_name` | The name of the Activity to assign Workers once a task is reserved for them. |
  | `reservation_activity_sid` | The SID of the Activity to assign Workers once a task is reserved for them. |
  | `sid` | The unique string that we created to identify the TaskQueue resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `target_workers` | A string describing the Worker selection criteria for any Tasks that enter the TaskQueue. For example `'"language" == "spanish"'` If no TargetWorkers parameter is provided, Tasks will wait in the TaskQueue until they are either deleted or moved to another TaskQueue. Additional examples on how to describing Worker selection criteria below. Defaults to 1==1. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `task_order` | How Tasks will be assigned to Workers. Set this parameter to `LIFO` to assign most recently created Task first or `FIFO` to assign the oldest Task. Default is FIFO. [Click here](https://www.twilio.com/docs/taskrouter/queue-ordering-last-first-out-lifo) to learn more.. Values: `FIFO`, `LIFO` |
  | `url` | The absolute URL of the TaskQueue resource.. Format: uri |
  | `workspace_sid` | The SID of the Workspace that contains the TaskQueue. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          assignment_activity_name: String.t() | nil,
          assignment_activity_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          links: map() | nil,
          max_reserved_workers: integer(),
          reservation_activity_name: String.t() | nil,
          reservation_activity_sid: String.t() | nil,
          sid: String.t() | nil,
          target_workers: String.t() | nil,
          task_order: String.t(),
          url: String.t() | nil,
          workspace_sid: String.t() | nil
        }

  defstruct [
    :account_sid,
    :assignment_activity_name,
    :assignment_activity_sid,
    :date_created,
    :date_updated,
    :friendly_name,
    :links,
    :max_reserved_workers,
    :reservation_activity_name,
    :reservation_activity_sid,
    :sid,
    :target_workers,
    :task_order,
    :url,
    :workspace_sid
  ]

  @object_name "taskrouter.v1.workspace.task_queue"
  def object_name, do: @object_name

  @sid_prefix "WQ"
  def sid_prefix, do: @sid_prefix
end
