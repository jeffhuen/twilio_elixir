# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Taskrouter.V1.Workspace.Workflow.WorkflowStatistics do
  @moduledoc """
  WorkflowStatistics resource.

  Parent: `/Workspaces/{WorkspaceSid}/Workflows/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Workflow resource. |
  | `cumulative` | An object that contains the cumulative statistics for the Workflow. |
  | `realtime` | An object that contains the real-time statistics for the Workflow. |
  | `url` | The absolute URL of the Workflow statistics resource.. Format: uri |
  | `workflow_sid` | Returns the list of Tasks that are being controlled by the Workflow with the specified SID value. |
  | `workspace_sid` | The SID of the Workspace that contains the Workflow. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          cumulative: String.t() | nil,
          realtime: String.t() | nil,
          url: String.t() | nil,
          workflow_sid: String.t() | nil,
          workspace_sid: String.t() | nil
        }

  defstruct [:account_sid, :cumulative, :realtime, :url, :workflow_sid, :workspace_sid]

  @object_name "taskrouter.v1.workspace.workflow.workflow_statistics"
  def object_name, do: @object_name
end
