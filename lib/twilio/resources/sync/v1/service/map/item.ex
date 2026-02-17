# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Sync.V1.Service.Map.Item do
  @moduledoc """
  Keys in a sync map

  Parent: `/Services/{ServiceSid}/Maps/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Map Item resource. |
  | `created_by` | The identity of the Map Item's creator. If the Map Item is created from the client SDK, the value matches the Access Token's `identity` field. If the Map Item was created from the REST API, the value is `system`.. PII: standard |
  | `data` | An arbitrary, schema-less object that the Map Item stores. Can be up to 16 KiB in length.. PII: sensitive |
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `date_expires` | The date and time in GMT when the Map Item expires and will be deleted, specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format. If the Map Item does not expire, this value is `null`.  The Map Item might not be deleted immediately after it expires.. Format: date-time |
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `key` | The unique, user-defined key for the Map Item.. PII: standard |
  | `map_sid` | The SID of the Sync Map that contains the Map Item. |
  | `revision` | The current revision of the Map Item, represented as a string. |
  | `service_sid` | The SID of the [Sync Service](https://www.twilio.com/docs/sync/api/service) the resource is associated with. |
  | `url` | The absolute URL of the Map Item resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          created_by: String.t() | nil,
          data: String.t() | nil,
          date_created: String.t() | nil,
          date_expires: String.t() | nil,
          date_updated: String.t() | nil,
          key: String.t() | nil,
          map_sid: String.t() | nil,
          revision: String.t() | nil,
          service_sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :created_by,
    :data,
    :date_created,
    :date_expires,
    :date_updated,
    :key,
    :map_sid,
    :revision,
    :service_sid,
    :url
  ]

  @object_name "sync.v1.service.sync_map.sync_map_item"
  def object_name, do: @object_name
end
