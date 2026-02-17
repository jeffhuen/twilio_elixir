# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Serverless.V1.Service.Function do
  @moduledoc """
  A wrapper that represents a Serverless JavaScript function and groups the different  and groups the different Versions of this code.

  SID prefix: `ZH`

  Parent: `/Services/{Sid}`

  ## Sub-resources
  - `function_versions` — `/v1/Services/{service_sid}/Functions/{function_sid}/Versions`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Function resource. |
  | `date_created` | The date and time in GMT when the Function resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `date_updated` | The date and time in GMT when the Function resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `friendly_name` | The string that you assigned to describe the Function resource. It can be a maximum of 255 characters.. PII: standard |
  | `links` | The URLs of nested resources of the Function resource.. Format: uri-map |
  | `service_sid` | The SID of the Service that the Function resource is associated with. |
  | `sid` | The unique string that we created to identify the Function resource. |
  | `url` | The absolute URL of the Function resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          links: map() | nil,
          service_sid: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :date_created,
    :date_updated,
    :friendly_name,
    :links,
    :service_sid,
    :sid,
    :url
  ]

  @object_name "serverless.v1.service.function"
  def object_name, do: @object_name

  @sid_prefix "ZH"
  def sid_prefix, do: @sid_prefix
end
