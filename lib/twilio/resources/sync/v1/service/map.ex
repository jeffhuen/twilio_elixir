# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Sync.V1.Service.Map do
  @moduledoc """
  Sync map objects

  SID prefix: `MP`

  Parent: `/Services/{Sid}`

  ## Sub-resources
  - `items` — `/v1/Services/{service_sid}/Maps/{map_sid}/Items`
  - `permissions` — `/v1/Services/{service_sid}/Maps/{map_sid}/Permissions`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Sync Map resource. |
  | `created_by` | The identity of the Sync Map's creator. If the Sync Map is created from the client SDK, the value matches the Access Token's `identity` field. If the Sync Map was created from the REST API, the value is `system`.. PII: standard |
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `date_expires` | The date and time in GMT when the Sync Map expires and will be deleted, specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format. If the Sync Map does not expire, this value is `null`. The Sync Map might not be deleted immediately after it expires.. Format: date-time |
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `links` | The URLs of the Sync Map's nested resources.. Format: uri-map |
  | `revision` | The current revision of the Sync Map, represented as a string. |
  | `service_sid` | The SID of the [Sync Service](https://www.twilio.com/docs/sync/api/service) the resource is associated with. |
  | `sid` | The unique string that we created to identify the Sync Map resource. |
  | `unique_name` | An application-defined string that uniquely identifies the resource. It can be used in place of the resource's `sid` in the URL to address the resource.. PII: standard |
  | `url` | The absolute URL of the Sync Map resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          created_by: String.t() | nil,
          date_created: String.t() | nil,
          date_expires: String.t() | nil,
          date_updated: String.t() | nil,
          links: map() | nil,
          revision: String.t() | nil,
          service_sid: String.t() | nil,
          sid: String.t() | nil,
          unique_name: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :created_by,
    :date_created,
    :date_expires,
    :date_updated,
    :links,
    :revision,
    :service_sid,
    :sid,
    :unique_name,
    :url
  ]

  @object_name "sync.v1.service.sync_map"
  def object_name, do: @object_name

  @sid_prefix "MP"
  def sid_prefix, do: @sid_prefix
end
