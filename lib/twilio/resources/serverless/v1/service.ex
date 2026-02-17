# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Serverless.V1.Service do
  @moduledoc """
  The top-level resource for a Serverless application, which serves as a container for the application environments.

  SID prefix: `ZS`

  ## Sub-resources
  - `assets` — `/v1/Services/{service_sid}/Assets`
  - `builds` — `/v1/Services/{service_sid}/Builds`
  - `environments` — `/v1/Services/{service_sid}/Environments`
  - `functions` — `/v1/Services/{service_sid}/Functions`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Service resource. |
  | `date_created` | The date and time in GMT when the Service resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `date_updated` | The date and time in GMT when the Service resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `domain_base` | The base domain name for this Service, which is a combination of the unique name and a randomly generated string. |
  | `friendly_name` | The string that you assigned to describe the Service resource.. PII: standard |
  | `include_credentials` | Whether to inject Account credentials into a function invocation context. |
  | `links` | The URLs of the Service's nested resources.. Format: uri-map |
  | `sid` | The unique string that we created to identify the Service resource. |
  | `ui_editable` | Whether the Service resource's properties and subresources can be edited via the UI. |
  | `unique_name` | A user-defined string that uniquely identifies the Service resource. It can be used in place of the Service resource's `sid` in the URL to address the Service resource.. PII: standard |
  | `url` | The absolute URL of the Service resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          domain_base: String.t() | nil,
          friendly_name: String.t() | nil,
          include_credentials: boolean() | nil,
          links: map() | nil,
          sid: String.t() | nil,
          ui_editable: boolean() | nil,
          unique_name: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :date_created,
    :date_updated,
    :domain_base,
    :friendly_name,
    :include_credentials,
    :links,
    :sid,
    :ui_editable,
    :unique_name,
    :url
  ]

  @object_name "serverless.v1.service"
  def object_name, do: @object_name

  @sid_prefix "ZS"
  def sid_prefix, do: @sid_prefix
end
