# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Content.V2.ContentAndApprovals do
  @moduledoc """
  A Content resource represents rich messaging content and its respective approval request status.

  SID prefix: `HX`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/usage/api/account) that created Content resource. |
  | `approval_requests` | The submitted information and approval request status of the Content resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `friendly_name` | A string name used to describe the Content resource. Not visible to the end recipient. |
  | `language` | Two-letter (ISO 639-1) language code (e.g., en) identifying the language the Content resource is in. |
  | `sid` | The unique string that that we created to identify the Content resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `types` | The [Content types](https://www.twilio.com/docs/content/content-types-overview) (e.g. twilio/text) for this Content resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `variables` | Defines the default placeholder values for variables included in the Content resource. e.g. {"1": "Customer_Name"}. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          approval_requests: map() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          language: String.t() | nil,
          sid: String.t() | nil,
          types: map() | nil,
          variables: map() | nil
        }

  defstruct [
    :account_sid,
    :approval_requests,
    :date_created,
    :date_updated,
    :friendly_name,
    :language,
    :sid,
    :types,
    :variables
  ]

  @object_name "content.v1.content_and_approvals"
  def object_name, do: @object_name

  @sid_prefix "HX"
  def sid_prefix, do: @sid_prefix
end
