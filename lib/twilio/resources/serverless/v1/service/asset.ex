# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Serverless.V1.Service.Asset do
  @moduledoc """
  A wrapper that represents a static file and groups the different Versions of the static file.

  SID prefix: `ZH`

  Parent: `/Services/{Sid}`

  ## Sub-resources
  - `asset_versions` — `/v1/Services/{service_sid}/Assets/{asset_sid}/Versions`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Asset resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the Asset resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the Asset resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `friendly_name` | The string that you assigned to describe the Asset resource. It can be a maximum of 255 characters.. PII: standard |
  | `links` | The URLs of the Asset resource's nested resources.. Format: uri-map |
  | `service_sid` | The SID of the Service that the Asset resource is associated with. |
  | `sid` | The unique string that we created to identify the Asset resource. |
  | `url` | The absolute URL of the Asset resource.. Format: uri |
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

  @object_name "serverless.v1.service.asset"
  def object_name, do: @object_name

  @sid_prefix "ZH"
  def sid_prefix, do: @sid_prefix
end
