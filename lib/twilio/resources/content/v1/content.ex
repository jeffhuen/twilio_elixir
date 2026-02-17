# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Content.V1.Content do
  @moduledoc """
  A Content resource represents rich messaging content.

  SID prefix: `HX`

  ## Sub-resources
  - `approval_create` — `/v1/Content/{content_sid}/ApprovalRequests/whatsapp`
  - `approval_fetch` — `/v1/Content/{content_sid}/ApprovalRequests`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/usage/api/account) that created Content resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `friendly_name` | A string name used to describe the Content resource. Not visible to the end recipient. |
  | `language` | Two-letter (ISO 639-1) language code (e.g., en) identifying the language the Content resource is in. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `links` | A list of links related to the Content resource, such as approval_fetch and approval_create. Format: uri-map |
  | `sid` | The unique string that that we created to identify the Content resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `types` | The [Content types](https://www.twilio.com/docs/content-api/content-types-overview) (e.g. twilio/text) for this Content resource. |
  | `url` | The URL of the resource, relative to `https://content.twilio.com`.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `variables` | Defines the default placeholder values for variables included in the Content resource. e.g. {"1": "Customer_Name"}. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          language: String.t() | nil,
          links: map() | nil,
          sid: String.t() | nil,
          types: map() | nil,
          url: String.t() | nil,
          variables: map() | nil
        }

  defstruct [
    :account_sid,
    :date_created,
    :date_updated,
    :friendly_name,
    :language,
    :links,
    :sid,
    :types,
    :url,
    :variables
  ]

  @object_name "content.v1.content"
  def object_name, do: @object_name

  @sid_prefix "HX"
  def sid_prefix, do: @sid_prefix
end
