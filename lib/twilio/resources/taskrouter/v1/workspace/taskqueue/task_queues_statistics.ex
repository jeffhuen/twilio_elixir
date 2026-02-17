# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Taskrouter.V1.Workspace.Taskqueue.TaskQueuesStatistics do
  @moduledoc """


  Parent: `/Workspaces/{WorkspaceSid}/TaskQueues`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the TaskQueue resource. |
  | `cumulative` | An object that contains the cumulative statistics for the TaskQueues. |
  | `realtime` | An object that contains the real-time statistics for the TaskQueues. |
  | `task_queue_sid` | The SID of the TaskQueue from which these statistics were calculated. |
  | `workspace_sid` | The SID of the Workspace that contains the TaskQueues. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          cumulative: String.t() | nil,
          realtime: String.t() | nil,
          task_queue_sid: String.t() | nil,
          workspace_sid: String.t() | nil
        }

  defstruct [:account_sid, :cumulative, :realtime, :task_queue_sid, :workspace_sid]

  @object_name "taskrouter.v1.workspace.task_queue.task_queues_statistics"
  def object_name, do: @object_name
end
