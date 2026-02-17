# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Taskrouter.V1.Workspace.Worker.WorkerStatistics do
  @moduledoc """


  Parent: `/Workspaces/{WorkspaceSid}/Workers/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Worker resource. |
  | `cumulative` | An object that contains the cumulative statistics for the Worker. |
  | `url` | The absolute URL of the WorkerChannel statistics resource.. Format: uri |
  | `worker_sid` | The SID of the Worker that contains the WorkerChannel. |
  | `workspace_sid` | The SID of the Workspace that contains the WorkerChannel. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          cumulative: String.t() | nil,
          url: String.t() | nil,
          worker_sid: String.t() | nil,
          workspace_sid: String.t() | nil
        }

  defstruct [:account_sid, :cumulative, :url, :worker_sid, :workspace_sid]

  @object_name "taskrouter.v1.workspace.worker.worker_instance_statistics"
  def object_name, do: @object_name
end
