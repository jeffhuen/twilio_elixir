# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Bulkexports.V1.Export.Job do
  @moduledoc """


  Parent: `/Exports/{ResourceType}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `details` | The details of a job which is an object that contains an array of status grouped by `status` state.  Each `status` object has a `status` string, a count which is the number of days in that `status`, and list of days in that `status`. The day strings are in the format yyyy-MM-dd. As an example, a currently running job may have a status object for COMPLETED and a `status` object for SUBMITTED each with its own count and list of days. |
  | `email` | The optional email to send the completion notification to |
  | `end_day` | The end day for the export specified when creating the job |
  | `estimated_completion_time` | this is the time estimated until your job is complete. This is calculated each time you request the job list. The time is calculated based on the current rate of job completion (which may vary) and your job queue position |
  | `friendly_name` | The friendly name specified when creating the job |
  | `job_queue_position` | This is the job position from the 1st in line. Your queue position will never increase. As jobs ahead of yours in the queue are processed, the queue position number will decrease |
  | `job_sid` | The unique job_sid returned when the custom export was created |
  | `resource_type` | The type of communication – Messages, Calls, Conferences, and Participants |
  | `start_day` | The start day for the custom export specified when creating the job |
  | `webhook_method` | This is the method used to call the webhook on completion of the job. If this is supplied, `WebhookUrl` must also be supplied. |
  | `webhook_url` | The optional webhook url called on completion of the job. If this is supplied, `WebhookMethod` must also be supplied. |
  """

  @type t :: %__MODULE__{
          details: list() | nil,
          email: String.t() | nil,
          end_day: String.t() | nil,
          estimated_completion_time: String.t() | nil,
          friendly_name: String.t() | nil,
          job_queue_position: String.t() | nil,
          job_sid: String.t() | nil,
          resource_type: String.t() | nil,
          start_day: String.t() | nil,
          webhook_method: String.t() | nil,
          webhook_url: String.t() | nil
        }

  defstruct [
    :details,
    :email,
    :end_day,
    :estimated_completion_time,
    :friendly_name,
    :job_queue_position,
    :job_sid,
    :resource_type,
    :start_day,
    :webhook_method,
    :webhook_url
  ]

  @object_name "bulkexports.v1.export.export_custom_job"
  def object_name, do: @object_name
end
