# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Taskrouter.V1.Workspace.Worker do
  @moduledoc """
  Worker resource.

  SID prefix: `WK`

  Parent: `/Workspaces/{Sid}`

  ## Sub-resources
  - `cumulative_statistics` — `/v1/Workspaces/{workspace_sid}/Workers/CumulativeStatistics`
  - `real_time_statistics` — `/v1/Workspaces/{workspace_sid}/Workers/RealTimeStatistics`
  - `reservations` — `/v1/Workspaces/{workspace_sid}/Workers/{worker_sid}/Reservations`
  - `statistics` — `/v1/Workspaces/{workspace_sid}/Workers/{worker_sid}/Statistics`
  - `worker_channels` — `/v1/Workspaces/{workspace_sid}/Workers/{worker_sid}/Channels`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Worker resource. |
  | `activity_name` | The `friendly_name` of the Worker's current Activity. |
  | `activity_sid` | The SID of the Worker's current Activity. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `attributes` | The JSON string that describes the Worker. For example: `{ "email": "Bob@example.com", "phone": "+5095551234" }`. **Note** If this property has been assigned a value, it will only be displayed in FETCH actions that return a single resource. Otherwise, this property will be null, even if it has a value. This data is passed to the `assignment_callback_url` when TaskRouter assigns a Task to the Worker.. PII: sensitive |
  | `available` | Whether the Worker is available to perform tasks. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_status_changed` | The date and time in GMT of the last change to the Worker's activity specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format. Used to calculate Workflow statistics.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `friendly_name` | The string that you assigned to describe the resource. Friendly names are case insensitive, and unique within the TaskRouter Workspace.. PII: standard |
  | `links` | The URLs of related resources.. Format: uri-map |
  | `sid` | The unique string that we created to identify the Worker resource. |
  | `url` | The absolute URL of the Worker resource.. Format: uri |
  | `workspace_sid` | The SID of the Workspace that contains the Worker. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          activity_name: String.t() | nil,
          activity_sid: String.t() | nil,
          attributes: String.t() | nil,
          available: boolean() | nil,
          date_created: String.t() | nil,
          date_status_changed: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          links: map() | nil,
          sid: String.t() | nil,
          url: String.t() | nil,
          workspace_sid: String.t() | nil
        }

  defstruct [
    :account_sid,
    :activity_name,
    :activity_sid,
    :attributes,
    :available,
    :date_created,
    :date_status_changed,
    :date_updated,
    :friendly_name,
    :links,
    :sid,
    :url,
    :workspace_sid
  ]

  @object_name "taskrouter.v1.workspace.worker"
  def object_name, do: @object_name

  @sid_prefix "WK"
  def sid_prefix, do: @sid_prefix
end
