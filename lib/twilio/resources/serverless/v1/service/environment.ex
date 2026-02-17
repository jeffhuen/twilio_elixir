# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Serverless.V1.Service.Environment do
  @moduledoc """
  Represents a deployed build of a given set of Functions and/or Assets at a specific URL.

  SID prefix: `ZE`

  Parent: `/Services/{Sid}`

  ## Sub-resources
  - `deployments` — `/v1/Services/{service_sid}/Environments/{environment_sid}/Deployments`
  - `logs` — `/v1/Services/{service_sid}/Environments/{environment_sid}/Logs`
  - `variables` — `/v1/Services/{service_sid}/Environments/{environment_sid}/Variables`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Environment resource. |
  | `build_sid` | The SID of the build deployed in the environment. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the Environment resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the Environment resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `domain_name` | The domain name for all Functions and Assets deployed in the Environment, using the Service unique name, a randomly-generated Service suffix, and an optional Environment domain suffix.. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `domain_suffix` | A URL-friendly name that represents the environment and forms part of the domain name.. PII: standard |
  | `links` | The URLs of the Environment resource's nested resources.. Format: uri-map |
  | `service_sid` | The SID of the Service that the Environment resource is associated with. |
  | `sid` | The unique string that we created to identify the Environment resource. |
  | `unique_name` | A user-defined string that uniquely identifies the Environment resource.. PII: standard |
  | `url` | The absolute URL of the Environment resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          build_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          domain_name: String.t() | nil,
          domain_suffix: String.t() | nil,
          links: map() | nil,
          service_sid: String.t() | nil,
          sid: String.t() | nil,
          unique_name: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :build_sid,
    :date_created,
    :date_updated,
    :domain_name,
    :domain_suffix,
    :links,
    :service_sid,
    :sid,
    :unique_name,
    :url
  ]

  @object_name "serverless.v1.service.environment"
  def object_name, do: @object_name

  @sid_prefix "ZE"
  def sid_prefix, do: @sid_prefix
end
