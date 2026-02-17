# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Taskrouter.V1.Workspace.Worker.Channel do
  @moduledoc """
  Channel resource.

  SID prefix: `WC`

  Parent: `/Workspaces/{WorkspaceSid}/Workers/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Worker resource. |
  | `assigned_tasks` | The total number of Tasks assigned to Worker for the TaskChannel type. |
  | `available` | Whether the Worker should receive Tasks of the TaskChannel type. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `available_capacity_percentage` | The current percentage of capacity the TaskChannel has available. Can be a number between `0` and `100`. A value of `0` indicates that TaskChannel has no capacity available and a value of `100` means the  Worker is available to receive any Tasks of this TaskChannel type. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `configured_capacity` | The current configured capacity for the WorkerChannel. TaskRouter will not create any reservations after the assigned Tasks for the Worker reaches the value. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `sid` | The unique string that we created to identify the WorkerChannel resource. |
  | `task_channel_sid` | The SID of the TaskChannel. |
  | `task_channel_unique_name` | The unique name of the TaskChannel, such as `voice` or `sms`. |
  | `url` | The absolute URL of the WorkerChannel resource.. Format: uri |
  | `worker_sid` | The SID of the Worker that contains the WorkerChannel. |
  | `workspace_sid` | The SID of the Workspace that contains the WorkerChannel. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          assigned_tasks: integer(),
          available: boolean() | nil,
          available_capacity_percentage: integer(),
          configured_capacity: integer(),
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          sid: String.t() | nil,
          task_channel_sid: String.t() | nil,
          task_channel_unique_name: String.t() | nil,
          url: String.t() | nil,
          worker_sid: String.t() | nil,
          workspace_sid: String.t() | nil
        }

  defstruct [
    :account_sid,
    :assigned_tasks,
    :available,
    :available_capacity_percentage,
    :configured_capacity,
    :date_created,
    :date_updated,
    :sid,
    :task_channel_sid,
    :task_channel_unique_name,
    :url,
    :worker_sid,
    :workspace_sid
  ]

  @object_name "taskrouter.v1.workspace.worker.worker_channel"
  def object_name, do: @object_name

  @sid_prefix "WC"
  def sid_prefix, do: @sid_prefix
end
