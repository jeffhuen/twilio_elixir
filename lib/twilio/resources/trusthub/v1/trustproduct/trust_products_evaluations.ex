# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Trusthub.V1.Trustproduct.TrustProductsEvaluations do
  @moduledoc """


  SID prefix: `EL`

  Parent: `/TrustProducts/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the trust_product resource. |
  | `date_created` | Format: date-time |
  | `policy_sid` | The unique string of a policy that is associated to the trust_product resource. |
  | `results` | The results of the Evaluation which includes the valid and invalid attributes. |
  | `sid` | The unique string that identifies the Evaluation resource. |
  | `status` | The compliance status of the Evaluation resource.. Values: `compliant`, `noncompliant` |
  | `trust_product_sid` | The unique string that we created to identify the trust_product resource. |
  | `url` | Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          date_created: String.t() | nil,
          policy_sid: String.t() | nil,
          results: list() | nil,
          sid: String.t() | nil,
          status: String.t(),
          trust_product_sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :date_created,
    :policy_sid,
    :results,
    :sid,
    :status,
    :trust_product_sid,
    :url
  ]

  @object_name "trusthub.v1.trust_product.trust_product_evaluation"
  def object_name, do: @object_name

  @sid_prefix "EL"
  def sid_prefix, do: @sid_prefix
end
