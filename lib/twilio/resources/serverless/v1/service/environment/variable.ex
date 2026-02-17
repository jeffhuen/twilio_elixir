# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Serverless.V1.Service.Environment.Variable do
  @moduledoc """
  A key and value pair that is specific to an Environment.

  SID prefix: `ZV`

  Parent: `/Services/{ServiceSid}/Environments/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Variable resource. |
  | `date_created` | The date and time in GMT when the Variable resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `date_updated` | The date and time in GMT when the Variable resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `environment_sid` | The SID of the Environment in which the Variable exists. |
  | `key` | A string by which the Variable resource can be referenced.. PII: standard |
  | `service_sid` | The SID of the Service that the Variable resource is associated with. |
  | `sid` | The unique string that we created to identify the Variable resource. |
  | `url` | The absolute URL of the Variable resource.. Format: uri |
  | `value` | A string that contains the actual value of the Variable.. PII: standard |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          environment_sid: String.t() | nil,
          key: String.t() | nil,
          service_sid: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil,
          value: String.t() | nil
        }

  defstruct [
    :account_sid,
    :date_created,
    :date_updated,
    :environment_sid,
    :key,
    :service_sid,
    :sid,
    :url,
    :value
  ]

  @object_name "serverless.v1.service.environment.variable"
  def object_name, do: @object_name

  @sid_prefix "ZV"
  def sid_prefix, do: @sid_prefix
end
