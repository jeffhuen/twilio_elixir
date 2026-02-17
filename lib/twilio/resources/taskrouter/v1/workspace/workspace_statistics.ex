# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Taskrouter.V1.Workspace.WorkspaceStatistics do
  @moduledoc """
  WorkspaceStatistics resource.

  Parent: `/Workspaces/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Workspace resource. |
  | `cumulative` | An object that contains the cumulative statistics for the Workspace. |
  | `realtime` | An object that contains the real-time statistics for the Workspace. |
  | `url` | The absolute URL of the Workspace statistics resource.. Format: uri |
  | `workspace_sid` | The SID of the Workspace. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          cumulative: String.t() | nil,
          realtime: String.t() | nil,
          url: String.t() | nil,
          workspace_sid: String.t() | nil
        }

  defstruct [:account_sid, :cumulative, :realtime, :url, :workspace_sid]

  @object_name "taskrouter.v1.workspace.workspace_statistics"
  def object_name, do: @object_name
end
