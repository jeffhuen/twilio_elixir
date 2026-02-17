# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Taskrouter.V1.Workspace.Workflow do
  @moduledoc """


  SID prefix: `WW`

  Parent: `/Workspaces/{Sid}`

  ## Sub-resources
  - `cumulative_statistics` — `/v1/Workspaces/{workspace_sid}/Workflows/{workflow_sid}/CumulativeStatistics`
  - `real_time_statistics` — `/v1/Workspaces/{workspace_sid}/Workflows/{workflow_sid}/RealTimeStatistics`
  - `statistics` — `/v1/Workspaces/{workspace_sid}/Workflows/{workflow_sid}/Statistics`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Workflow resource. |
  | `assignment_callback_url` | The URL that we call when a task managed by the Workflow is assigned to a Worker. See Assignment Callback URL for more information.. Format: uri |
  | `configuration` | A JSON string that contains the Workflow's configuration. See [Configuring Workflows](https://www.twilio.com/docs/taskrouter/workflow-configuration) for more information. |
  | `date_created` | The date and time in GMT when the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `document_content_type` | The MIME type of the document. |
  | `fallback_assignment_callback_url` | The URL that we call when a call to the `assignment_callback_url` fails.. Format: uri |
  | `friendly_name` | The string that you assigned to describe the Workflow resource. For example, `Customer Support` or `2014 Election Campaign`.. PII: standard |
  | `links` | The URLs of related resources.. Format: uri-map |
  | `sid` | The unique string that we created to identify the Workflow resource. |
  | `task_reservation_timeout` | How long TaskRouter will wait for a confirmation response from your application after it assigns a Task to a Worker. Can be up to `86,400` (24 hours) and the default is `120`. |
  | `url` | The absolute URL of the Workflow resource.. Format: uri |
  | `workspace_sid` | The SID of the Workspace that contains the Workflow. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          assignment_callback_url: String.t() | nil,
          configuration: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          document_content_type: String.t() | nil,
          fallback_assignment_callback_url: String.t() | nil,
          friendly_name: String.t() | nil,
          links: map() | nil,
          sid: String.t() | nil,
          task_reservation_timeout: integer(),
          url: String.t() | nil,
          workspace_sid: String.t() | nil
        }

  defstruct [
    :account_sid,
    :assignment_callback_url,
    :configuration,
    :date_created,
    :date_updated,
    :document_content_type,
    :fallback_assignment_callback_url,
    :friendly_name,
    :links,
    :sid,
    :task_reservation_timeout,
    :url,
    :workspace_sid
  ]

  @object_name "taskrouter.v1.workspace.workflow"
  def object_name, do: @object_name

  @sid_prefix "WW"
  def sid_prefix, do: @sid_prefix
end
