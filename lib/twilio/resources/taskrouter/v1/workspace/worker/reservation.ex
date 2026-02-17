# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Taskrouter.V1.Workspace.Worker.Reservation do
  @moduledoc """
  Current and past reservations for a worker

  SID prefix: `WR`

  Parent: `/Workspaces/{WorkspaceSid}/Workers/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the WorkerReservation resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `links` | The URLs of related resources.. Format: uri-map |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `reservation_status` | The current status of the reservation. Can be: `pending`, `accepted`, `rejected`, `timeout`, `canceled`, or `rescinded`.. Values: `pending`, `accepted`, `rejected`, `timeout`, `canceled`, `rescinded`, `wrapping`, `completed` |
  | `sid` | The unique string that we created to identify the WorkerReservation resource. |
  | `task_sid` | The SID of the reserved Task resource. |
  | `url` | The absolute URL of the WorkerReservation resource.. Format: uri |
  | `worker_name` | The `friendly_name` of the Worker that is reserved. |
  | `worker_sid` | The SID of the reserved Worker resource. |
  | `workspace_sid` | The SID of the Workspace that this worker is contained within. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          links: map() | nil,
          reservation_status: String.t(),
          sid: String.t() | nil,
          task_sid: String.t() | nil,
          url: String.t() | nil,
          worker_name: String.t() | nil,
          worker_sid: String.t() | nil,
          workspace_sid: String.t() | nil
        }

  defstruct [
    :account_sid,
    :date_created,
    :date_updated,
    :links,
    :reservation_status,
    :sid,
    :task_sid,
    :url,
    :worker_name,
    :worker_sid,
    :workspace_sid
  ]

  @object_name "taskrouter.v1.workspace.worker.worker_reservation"
  def object_name, do: @object_name

  @sid_prefix "WR"
  def sid_prefix, do: @sid_prefix
end
