# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Taskrouter.V1.Workspace do
  @moduledoc """
  Workspace resource.

  SID prefix: `WS`

  ## Sub-resources
  - `activities` — `/v1/Workspaces/{workspace_sid}/Activities`
  - `cumulative_statistics` — `/v1/Workspaces/{workspace_sid}/CumulativeStatistics`
  - `events` — `/v1/Workspaces/{workspace_sid}/Events`
  - `real_time_statistics` — `/v1/Workspaces/{workspace_sid}/RealTimeStatistics`
  - `statistics` — `/v1/Workspaces/{workspace_sid}/Statistics`
  - `task_channels` — `/v1/Workspaces/{workspace_sid}/TaskChannels`
  - `task_queues` — `/v1/Workspaces/{workspace_sid}/TaskQueues`
  - `tasks` — `/v1/Workspaces/{workspace_sid}/Tasks`
  - `workers` — `/v1/Workspaces/{workspace_sid}/Workers`
  - `workflows` — `/v1/Workspaces/{workspace_sid}/Workflows`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Workspace resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `default_activity_name` | The name of the default activity. |
  | `default_activity_sid` | The SID of the Activity that will be used when new Workers are created in the Workspace. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `event_callback_url` | The URL we call when an event occurs. If provided, the Workspace will publish events to this URL, for example, to collect data for reporting. See [Workspace Events](https://www.twilio.com/docs/taskrouter/api/event) for more information. This parameter supports Twilio's [Webhooks (HTTP callbacks) Connection Overrides](https://www.twilio.com/docs/usage/webhooks/webhooks-connection-overrides).. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `events_filter` | The list of Workspace events for which to call `event_callback_url`. For example, if `EventsFilter=task.created, task.canceled, worker.activity.update`, then TaskRouter will call event_callback_url only when a task is created, canceled, or a Worker activity is updated. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `friendly_name` | The string that you assigned to describe the Workspace resource. For example `Customer Support` or `2014 Election Campaign`.. PII: standard |
  | `links` | The URLs of related resources.. Format: uri-map |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `multi_task_enabled` | Whether multi-tasking is enabled. The default is `true`, which enables multi-tasking. Multi-tasking allows Workers to handle multiple Tasks simultaneously. When enabled (`true`), each Worker can receive parallel reservations up to the per-channel maximums defined in the Workers section. In single-tasking each Worker would only receive a new reservation when the previous task is completed. Learn more at [Multitasking](https://www.twilio.com/docs/taskrouter/multitasking). |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `prioritize_queue_order` | The type of TaskQueue to prioritize when Workers are receiving Tasks from both types of TaskQueues. Can be: `LIFO` or `FIFO` and the default is `FIFO`. For more information, see [Queue Ordering](https://www.twilio.com/docs/taskrouter/queue-ordering-last-first-out-lifo).. Values: `FIFO`, `LIFO` |
  | `sid` | The unique string that we created to identify the Workspace resource. |
  | `timeout_activity_name` | The name of the timeout activity. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `timeout_activity_sid` | The SID of the Activity that will be assigned to a Worker when a Task reservation times out without a response. |
  | `url` | The absolute URL of the Workspace resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          default_activity_name: String.t() | nil,
          default_activity_sid: String.t() | nil,
          event_callback_url: String.t() | nil,
          events_filter: String.t() | nil,
          friendly_name: String.t() | nil,
          links: map() | nil,
          multi_task_enabled: boolean() | nil,
          prioritize_queue_order: String.t(),
          sid: String.t() | nil,
          timeout_activity_name: String.t() | nil,
          timeout_activity_sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :date_created,
    :date_updated,
    :default_activity_name,
    :default_activity_sid,
    :event_callback_url,
    :events_filter,
    :friendly_name,
    :links,
    :multi_task_enabled,
    :prioritize_queue_order,
    :sid,
    :timeout_activity_name,
    :timeout_activity_sid,
    :url
  ]

  @object_name "taskrouter.v1.workspace"
  def object_name, do: @object_name

  @sid_prefix "WS"
  def sid_prefix, do: @sid_prefix
end
