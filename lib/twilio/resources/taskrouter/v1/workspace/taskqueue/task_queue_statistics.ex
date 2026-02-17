# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Taskrouter.V1.Workspace.Taskqueue.TaskQueueStatistics do
  @moduledoc """


  Parent: `/Workspaces/{WorkspaceSid}/TaskQueues/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the TaskQueue resource. |
  | `cumulative` | An object that contains the cumulative statistics for the TaskQueue. |
  | `realtime` | An object that contains the real-time statistics for the TaskQueue. |
  | `task_queue_sid` | The SID of the TaskQueue from which these statistics were calculated. |
  | `url` | The absolute URL of the TaskQueue statistics resource.. Format: uri |
  | `workspace_sid` | The SID of the Workspace that contains the TaskQueue. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          cumulative: String.t() | nil,
          realtime: String.t() | nil,
          task_queue_sid: String.t() | nil,
          url: String.t() | nil,
          workspace_sid: String.t() | nil
        }

  defstruct [:account_sid, :cumulative, :realtime, :task_queue_sid, :url, :workspace_sid]

  @object_name "taskrouter.v1.workspace.task_queue.task_queue_statistics"
  def object_name, do: @object_name
end
