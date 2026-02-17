# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Sync.V1.Service.List do
  @moduledoc """
  Sync list objects

  SID prefix: `ES`

  Parent: `/Services/{Sid}`

  ## Sub-resources
  - `items` — `/v1/Services/{service_sid}/Lists/{list_sid}/Items`
  - `permissions` — `/v1/Services/{service_sid}/Lists/{list_sid}/Permissions`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Sync List resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `created_by` | The identity of the Sync List's creator. If the Sync List is created from the client SDK, the value matches the Access Token's `identity` field. If the Sync List was created from the REST API, the value is `system`.. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_expires` | The date and time in GMT when the Sync List expires and will be deleted, specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format. If the Sync List does not expire, this value is `null`. The Sync List might not be deleted immediately after it expires.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `links` | The URLs of the Sync List's nested resources.. Format: uri-map |
  | `revision` | The current revision of the Sync List, represented as a string. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `service_sid` | The SID of the [Sync Service](https://www.twilio.com/docs/sync/api/service) the resource is associated with. |
  | `sid` | The unique string that we created to identify the Sync List resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `unique_name` | An application-defined string that uniquely identifies the resource. It can be used in place of the resource's `sid` in the URL to address the resource.. PII: standard |
  | `url` | The absolute URL of the Sync List resource.. Format: uri |
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

  @object_name "sync.v1.service.sync_list"
  def object_name, do: @object_name

  @sid_prefix "ES"
  def sid_prefix, do: @sid_prefix
end
