# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Taskrouter.V1.Workspace.Taskchannel do
  @moduledoc """
  Types of tasks

  SID prefix: `TC`

  Parent: `/Workspaces/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Task Channel resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `channel_optimized_routing` | Whether the Task Channel will prioritize Workers that have been idle. When `true`, Workers that have been idle the longest are prioritized. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `friendly_name` | The string that you assigned to describe the resource. |
  | `links` | The URLs of related resources.. Format: uri-map |
  | `sid` | The unique string that we created to identify the Task Channel resource. |
  | `unique_name` | An application-defined string that uniquely identifies the Task Channel, such as `voice` or `sms`. |
  | `url` | The absolute URL of the Task Channel resource.. Format: uri |
  | `workspace_sid` | The SID of the Workspace that contains the Task Channel. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          channel_optimized_routing: boolean() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          links: map() | nil,
          sid: String.t() | nil,
          unique_name: String.t() | nil,
          url: String.t() | nil,
          workspace_sid: String.t() | nil
        }

  defstruct [
    :account_sid,
    :channel_optimized_routing,
    :date_created,
    :date_updated,
    :friendly_name,
    :links,
    :sid,
    :unique_name,
    :url,
    :workspace_sid
  ]

  @object_name "taskrouter.v1.workspace.task_channel"
  def object_name, do: @object_name

  @sid_prefix "TC"
  def sid_prefix, do: @sid_prefix
end
