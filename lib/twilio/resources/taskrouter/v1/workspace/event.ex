# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Taskrouter.V1.Workspace.Event do
  @moduledoc """


  SID prefix: `EV`

  Parent: `/Workspaces/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Event resource. |
  | `actor_sid` | The SID of the resource that triggered the event. |
  | `actor_type` | The type of resource that triggered the event. |
  | `actor_url` | The absolute URL of the resource that triggered the event.. Format: uri |
  | `description` | A description of the event. |
  | `event_data` | Data about the event. For more information, see [Event types](https://www.twilio.com/docs/taskrouter/api/event#event-types). |
  | `event_date` | The time the event was sent, specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `event_date_ms` | The time the event was sent in milliseconds.. Format: int64 |
  | `event_type` | The identifier for the event. |
  | `resource_sid` | The SID of the object the event is most relevant to, such as a TaskSid, ReservationSid, or a  WorkerSid. |
  | `resource_type` | The type of object the event is most relevant to, such as a Task, Reservation, or a Worker). |
  | `resource_url` | The URL of the resource the event is most relevant to.. Format: uri |
  | `sid` | The unique string that we created to identify the Event resource. |
  | `source` | Where the Event originated. |
  | `source_ip_address` | The IP from which the Event originated. |
  | `url` | The absolute URL of the Event resource.. Format: uri |
  | `workspace_sid` | The SID of the Workspace that contains the Event. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          actor_sid: String.t() | nil,
          actor_type: String.t() | nil,
          actor_url: String.t() | nil,
          description: String.t() | nil,
          event_data: String.t() | nil,
          event_date: String.t() | nil,
          event_date_ms: integer() | nil,
          event_type: String.t() | nil,
          resource_sid: String.t() | nil,
          resource_type: String.t() | nil,
          resource_url: String.t() | nil,
          sid: String.t() | nil,
          source: String.t() | nil,
          source_ip_address: String.t() | nil,
          url: String.t() | nil,
          workspace_sid: String.t() | nil
        }

  defstruct [
    :account_sid,
    :actor_sid,
    :actor_type,
    :actor_url,
    :description,
    :event_data,
    :event_date,
    :event_date_ms,
    :event_type,
    :resource_sid,
    :resource_type,
    :resource_url,
    :sid,
    :source,
    :source_ip_address,
    :url,
    :workspace_sid
  ]

  @object_name "taskrouter.v1.workspace.event"
  def object_name, do: @object_name

  @sid_prefix "EV"
  def sid_prefix, do: @sid_prefix
end
