# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Serverless.V1.Service.Environment.Log do
  @moduledoc """
  A record of an event that occurred related to a function invocation.

  SID prefix: `NO`

  Parent: `/Services/{ServiceSid}/Environments/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Log resource. |
  | `build_sid` | The SID of the build that corresponds to the log. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the Log resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `deployment_sid` | The SID of the deployment that corresponds to the log. |
  | `environment_sid` | The SID of the environment in which the log occurred. |
  | `function_sid` | The SID of the function whose invocation produced the log. |
  | `level` | The log level. |
  | `message` | The log message. |
  | `request_sid` | The SID of the request associated with the log. |
  | `service_sid` | The SID of the Service that the Log resource is associated with. |
  | `sid` | The unique string that we created to identify the Log resource. |
  | `url` | The absolute URL of the Log resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          build_sid: String.t() | nil,
          date_created: String.t() | nil,
          deployment_sid: String.t() | nil,
          environment_sid: String.t() | nil,
          function_sid: String.t() | nil,
          level: String.t() | nil,
          message: String.t() | nil,
          request_sid: String.t() | nil,
          service_sid: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :build_sid,
    :date_created,
    :deployment_sid,
    :environment_sid,
    :function_sid,
    :level,
    :message,
    :request_sid,
    :service_sid,
    :sid,
    :url
  ]

  @object_name "serverless.v1.service.environment.log"
  def object_name, do: @object_name

  @sid_prefix "NO"
  def sid_prefix, do: @sid_prefix
end
