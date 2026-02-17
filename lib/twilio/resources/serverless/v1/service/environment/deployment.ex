# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Serverless.V1.Service.Environment.Deployment do
  @moduledoc """
  An association of a Build with an Environment so that the Build is published in the Environment.

  SID prefix: `ZD`

  Parent: `/Services/{ServiceSid}/Environments/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Deployment resource. |
  | `build_sid` | The SID of the Build for the deployment. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the Deployment resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the Deployment resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `environment_sid` | The SID of the Environment for the Deployment. |
  | `service_sid` | The SID of the Service that the Deployment resource is associated with. |
  | `sid` | The unique string that we created to identify the Deployment resource. |
  | `url` | The absolute URL of the Deployment resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          build_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          environment_sid: String.t() | nil,
          service_sid: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :build_sid,
    :date_created,
    :date_updated,
    :environment_sid,
    :service_sid,
    :sid,
    :url
  ]

  @object_name "serverless.v1.service.environment.deployment"
  def object_name, do: @object_name

  @sid_prefix "ZD"
  def sid_prefix, do: @sid_prefix
end
