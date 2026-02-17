# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Numbers.V2.Regulatorycompliance.Bundle.Evaluation do
  @moduledoc """


  SID prefix: `EL`

  Parent: `/RegulatoryCompliance/Bundles/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Bundle resource. |
  | `bundle_sid` | The unique string that we created to identify the Bundle resource. |
  | `date_created` | Format: date-time |
  | `regulation_sid` | The unique string of a regulation that is associated to the Bundle resource. |
  | `results` | The results of the Evaluation which includes the valid and invalid attributes. |
  | `sid` | The unique string that identifies the Evaluation resource. |
  | `status` | The compliance status of the Evaluation resource.. Values: `compliant`, `noncompliant` |
  | `url` | Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          bundle_sid: String.t() | nil,
          date_created: String.t() | nil,
          regulation_sid: String.t() | nil,
          results: list() | nil,
          sid: String.t() | nil,
          status: String.t(),
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :bundle_sid,
    :date_created,
    :regulation_sid,
    :results,
    :sid,
    :status,
    :url
  ]

  @object_name "numbers.v2.regulatory_compliance.bundle.evaluation"
  def object_name, do: @object_name

  @sid_prefix "EL"
  def sid_prefix, do: @sid_prefix
end
