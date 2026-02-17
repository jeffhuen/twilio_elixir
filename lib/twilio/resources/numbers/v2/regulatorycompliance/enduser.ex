# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Numbers.V2.Regulatorycompliance.Enduser do
  @moduledoc """
  Enduser resource.

  SID prefix: `IT`

  Parent: `/RegulatoryCompliance`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the End User resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `attributes` | The set of parameters that are the attributes of the End Users resource which are listed in the End User Types.. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `friendly_name` | The string that you assigned to describe the resource. |
  | `sid` | The unique string created by Twilio to identify the End User resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `type` | The type of end user of the Bundle resource - can be `individual` or `business`.. Values: `individual`, `business` |
  | `url` | The absolute URL of the End User resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          attributes: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          sid: String.t() | nil,
          type: String.t(),
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :attributes,
    :date_created,
    :date_updated,
    :friendly_name,
    :sid,
    :type,
    :url
  ]

  @object_name "numbers.v2.regulatory_compliance.end_user"
  def object_name, do: @object_name

  @sid_prefix "IT"
  def sid_prefix, do: @sid_prefix
end
