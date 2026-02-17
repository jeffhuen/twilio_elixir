# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Taskrouter.V1.Workspace.Activity do
  @moduledoc """


  SID prefix: `WA`

  Parent: `/Workspaces/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Activity resource. |
  | `available` | Whether the Worker is eligible to receive a Task when it occupies the Activity. A value of `true`, `1`, or `yes` indicates the Activity is available. All other values indicate that it is not. The value cannot be changed after the Activity is created. |
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `friendly_name` | The string that you assigned to describe the Activity resource. |
  | `links` | Format: uri-map |
  | `sid` | The unique string that we created to identify the Activity resource. |
  | `url` | The absolute URL of the Activity resource.. Format: uri |
  | `workspace_sid` | The SID of the Workspace that contains the Activity. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          available: boolean() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          links: map() | nil,
          sid: String.t() | nil,
          url: String.t() | nil,
          workspace_sid: String.t() | nil
        }

  defstruct [
    :account_sid,
    :available,
    :date_created,
    :date_updated,
    :friendly_name,
    :links,
    :sid,
    :url,
    :workspace_sid
  ]

  @object_name "taskrouter.v1.workspace.activity"
  def object_name, do: @object_name

  @sid_prefix "WA"
  def sid_prefix, do: @sid_prefix
end
