# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Sync.V1.Service.List.Item do
  @moduledoc """
  Items in a sync list

  Parent: `/Services/{ServiceSid}/Lists/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the List Item resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `created_by` | The identity of the List Item's creator. If the item is created from the client SDK, the value matches the Access Token's `identity` field. If the item was created from the REST API, the value is `system`.. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `data` | An arbitrary, schema-less object that the List Item stores. Can be up to 16 KiB in length.. PII: sensitive |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_expires` | The date and time in GMT when the List Item expires and will be deleted, specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format. If the List Item does not expire, this value is `null`. The List Item resource might not be deleted immediately after it expires.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `index` | The automatically generated index of the List Item. The `index` values of the List Items in a Sync List can have gaps in their sequence. |
  | `list_sid` | The SID of the Sync List that contains the List Item. |
  | `revision` | The current revision of the item, represented as a string. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `service_sid` | The SID of the [Sync Service](https://www.twilio.com/docs/sync/api/service) the resource is associated with. |
  | `url` | The absolute URL of the List Item resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          created_by: String.t() | nil,
          data: String.t() | nil,
          date_created: String.t() | nil,
          date_expires: String.t() | nil,
          date_updated: String.t() | nil,
          index: integer(),
          list_sid: String.t() | nil,
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
    :index,
    :list_sid,
    :revision,
    :service_sid,
    :url
  ]

  @object_name "sync.v1.service.sync_list.sync_list_item"
  def object_name, do: @object_name
end
