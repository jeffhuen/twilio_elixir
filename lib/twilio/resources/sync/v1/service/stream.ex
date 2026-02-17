# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Sync.V1.Service.Stream do
  @moduledoc """
  Stream resource.

  SID prefix: `TO`

  Parent: `/Services/{Sid}`

  ## Sub-resources
  - `messages` — `/v1/Services/{service_sid}/Streams/{stream_sid}/Messages`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Sync Stream resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `created_by` | The identity of the Stream's creator. If the Stream is created from the client SDK, the value matches the Access Token's `identity` field. If the Stream was created from the REST API, the value is 'system'.. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_expires` | The date and time in GMT when the Message Stream expires and will be deleted, specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format. If the Message Stream does not expire, this value is `null`. The Stream might not be deleted immediately after it expires.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `links` | The URLs of the Stream's nested resources.. Format: uri-map |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `service_sid` | The SID of the [Sync Service](https://www.twilio.com/docs/sync/api/service) the resource is associated with. |
  | `sid` | The unique string that we created to identify the Sync Stream resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `unique_name` | An application-defined string that uniquely identifies the resource. It can be used in place of the resource's `sid` in the URL to address the resource.. PII: standard |
  | `url` | The absolute URL of the Message Stream resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          created_by: String.t() | nil,
          date_created: String.t() | nil,
          date_expires: String.t() | nil,
          date_updated: String.t() | nil,
          links: map() | nil,
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
    :service_sid,
    :sid,
    :unique_name,
    :url
  ]

  @object_name "sync.v1.service.sync_stream"
  def object_name, do: @object_name

  @sid_prefix "TO"
  def sid_prefix, do: @sid_prefix
end
