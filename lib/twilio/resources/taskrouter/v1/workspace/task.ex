# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Taskrouter.V1.Workspace.Task do
  @moduledoc """
  Task resource.

  SID prefix: `WT`

  Parent: `/Workspaces/{Sid}`

  ## Sub-resources
  - `reservations` — `/v1/Workspaces/{workspace_sid}/Tasks/{task_sid}/Reservations`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Task resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `addons` | An object that contains the [Add-on](https://www.twilio.com/docs/add-ons) data for all installed Add-ons. |
  | `age` | The number of seconds since the Task was created. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `assignment_status` | The current status of the Task's assignment. Can be: `pending`, `reserved`, `assigned`, `canceled`, `wrapping`, or `completed`.. Values: `pending`, `reserved`, `assigned`, `canceled`, `completed`, `wrapping` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `attributes` | The JSON string with custom attributes of the work. **Note** If this property has been assigned a value, it will only be displayed in FETCH action that returns a single resource. Otherwise, it will be null.. PII: sensitive |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ignore_capacity` | A boolean that indicates if the Task should respect a Worker's capacity and availability during assignment. This field can only be used when the `RoutingTarget` field is set to a Worker SID. By setting `IgnoreCapacity` to a value of `true`, `1`, or `yes`, the Task will be routed to the Worker without respecting their capacity and availability. Any other value will enforce the Worker's capacity and availability. The default value of `IgnoreCapacity` is `true` when the `RoutingTarget` is set to a Worker SID.  |
  | `links` | The URLs of related resources.. Format: uri-map |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `priority` | The current priority score of the Task as assigned to a Worker by the workflow. Tasks with higher priority values will be assigned before Tasks with lower values. |
  | `reason` | The reason the Task was canceled or completed, if applicable. |
  | `routing_target` | A SID of a Worker, Queue, or Workflow to route a Task to |
  | `sid` | The unique string that we created to identify the Task resource. |
  | `task_channel_sid` | The SID of the TaskChannel. |
  | `task_channel_unique_name` | The unique name of the TaskChannel. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `task_queue_entered_date` | The date and time in GMT when the Task entered the TaskQueue, specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `task_queue_friendly_name` | The friendly name of the TaskQueue. |
  | `task_queue_sid` | The SID of the TaskQueue. |
  | `timeout` | The amount of time in seconds that the Task can live before being assigned. |
  | `url` | The absolute URL of the Task resource.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `virtual_start_time` | The date and time in GMT indicating the ordering for routing of the Task specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `workflow_friendly_name` | The friendly name of the Workflow that is controlling the Task. |
  | `workflow_sid` | The SID of the Workflow that is controlling the Task. |
  | `workspace_sid` | The SID of the Workspace that contains the Task. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          addons: String.t() | nil,
          age: integer(),
          assignment_status: String.t(),
          attributes: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          ignore_capacity: boolean() | nil,
          links: map() | nil,
          priority: integer(),
          reason: String.t() | nil,
          routing_target: String.t() | nil,
          sid: String.t() | nil,
          task_channel_sid: String.t() | nil,
          task_channel_unique_name: String.t() | nil,
          task_queue_entered_date: String.t() | nil,
          task_queue_friendly_name: String.t() | nil,
          task_queue_sid: String.t() | nil,
          timeout: integer(),
          url: String.t() | nil,
          virtual_start_time: String.t() | nil,
          workflow_friendly_name: String.t() | nil,
          workflow_sid: String.t() | nil,
          workspace_sid: String.t() | nil
        }

  defstruct [
    :account_sid,
    :addons,
    :age,
    :assignment_status,
    :attributes,
    :date_created,
    :date_updated,
    :ignore_capacity,
    :links,
    :priority,
    :reason,
    :routing_target,
    :sid,
    :task_channel_sid,
    :task_channel_unique_name,
    :task_queue_entered_date,
    :task_queue_friendly_name,
    :task_queue_sid,
    :timeout,
    :url,
    :virtual_start_time,
    :workflow_friendly_name,
    :workflow_sid,
    :workspace_sid
  ]

  @object_name "taskrouter.v1.workspace.task"
  def object_name, do: @object_name

  @sid_prefix "WT"
  def sid_prefix, do: @sid_prefix
end
