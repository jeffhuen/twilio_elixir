# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Serverless.V1.Service.Build do
  @moduledoc """
  A collection of Function Versions, Asset Versions, Dependencies, and a Runtime that form a deployable unit.

  SID prefix: `ZB`

  Parent: `/Services/{Sid}`

  ## Sub-resources
  - `build_status` — `/v1/Services/{service_sid}/Builds/{sid}/Status`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Build resource. |
  | `asset_versions` | The list of Asset Version resource SIDs that are included in the Build. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the Build resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the Build resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `dependencies` | A list of objects that describe the Dependencies included in the Build. Each object contains the `name` and `version` of the dependency. |
  | `function_versions` | The list of Function Version resource SIDs that are included in the Build. |
  | `links` | Format: uri-map |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `runtime` | The Runtime version that will be used to run the Build resource when it is deployed.. Values: `node8`, `node10`, `node12`, `node14`, `node16`, `node18`, `node20`, `node22` |
  | `service_sid` | The SID of the Service that the Build resource is associated with. |
  | `sid` | The unique string that we created to identify the Build resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status` | The status of the Build. Can be: `building`, `completed`, or `failed`.. Values: `building`, `completed`, `failed` |
  | `url` | The absolute URL of the Build resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          asset_versions: list() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          dependencies: list() | nil,
          function_versions: list() | nil,
          links: map() | nil,
          runtime: String.t(),
          service_sid: String.t() | nil,
          sid: String.t() | nil,
          status: String.t(),
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :asset_versions,
    :date_created,
    :date_updated,
    :dependencies,
    :function_versions,
    :links,
    :runtime,
    :service_sid,
    :sid,
    :status,
    :url
  ]

  @object_name "serverless.v1.service.build"
  def object_name, do: @object_name

  @sid_prefix "ZB"
  def sid_prefix, do: @sid_prefix
end
