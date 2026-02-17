# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Numbers.V2.RegulatoryCompliance.SupportingDocument do
  @moduledoc """
  SupportingDocument resource.

  SID prefix: `RD`

  Parent: `/RegulatoryCompliance`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Document resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `attributes` | The set of parameters that are the attributes of the Supporting Documents resource which are listed in the Supporting Document Types.. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `errors` | A list of errors that occurred during the registering RC Bundle |
  | `failure_reason` | The failure reason of the Supporting Document Resource. |
  | `friendly_name` | The string that you assigned to describe the resource. |
  | `mime_type` | The image type uploaded in the Supporting Document container. |
  | `sid` | The unique string created by Twilio to identify the Supporting Document resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status` | The verification status of the Supporting Document resource.. Values: `draft`, `pending-review`, `rejected`, `approved`, `expired`, `provisionally-approved` |
  | `type` | The type of the Supporting Document. |
  | `url` | The absolute URL of the Supporting Document resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          attributes: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          errors: list() | nil,
          failure_reason: String.t() | nil,
          friendly_name: String.t() | nil,
          mime_type: String.t() | nil,
          sid: String.t() | nil,
          status: String.t(),
          type: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :attributes,
    :date_created,
    :date_updated,
    :errors,
    :failure_reason,
    :friendly_name,
    :mime_type,
    :sid,
    :status,
    :type,
    :url
  ]

  @object_name "numbers.v2.regulatory_compliance.supporting_document"
  def object_name, do: @object_name

  @sid_prefix "RD"
  def sid_prefix, do: @sid_prefix
end
