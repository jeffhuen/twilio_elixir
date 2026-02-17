# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Trusthub.V1.Customerprofile.CustomerProfilesEvaluations do
  @moduledoc """
  CustomerProfilesEvaluations resource.

  SID prefix: `EL`

  Parent: `/CustomerProfiles/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the customer_profile resource. |
  | `customer_profile_sid` | The unique string that we created to identify the customer_profile resource. |
  | `date_created` | Format: date-time |
  | `policy_sid` | The unique string of a policy that is associated to the customer_profile resource. |
  | `results` | The results of the Evaluation which includes the valid and invalid attributes. |
  | `sid` | The unique string that identifies the Evaluation resource. |
  | `status` | The compliance status of the Evaluation resource.. Values: `compliant`, `noncompliant` |
  | `url` | Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          customer_profile_sid: String.t() | nil,
          date_created: String.t() | nil,
          policy_sid: String.t() | nil,
          results: list() | nil,
          sid: String.t() | nil,
          status: String.t(),
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :customer_profile_sid,
    :date_created,
    :policy_sid,
    :results,
    :sid,
    :status,
    :url
  ]

  @object_name "trusthub.v1.customer_profile.customer_profile_evaluation"
  def object_name, do: @object_name

  @sid_prefix "EL"
  def sid_prefix, do: @sid_prefix
end
