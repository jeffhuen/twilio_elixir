# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Numbers.V1.Hostednumber.Eligibility do
  @moduledoc """


  ## Properties

  | Field | Description |
  |-------|-------------|
  | `results` | The result set that contains the eligibility check response for the requested number, each result has at least the following attributes:  phone_number: The requested phone number ,hosting_account_sid: The account sid where the phone number will be hosted, date_last_checked: Datetime (ISO 8601) when the PN was last checked for eligibility, country: Phone number’s country, eligibility_status: Indicates the eligibility status of the PN (Eligible/Ineligible), eligibility_sub_status: Indicates the sub status of the eligibility , ineligibility_reason: Reason for number's ineligibility (if applicable), next_step: Suggested next step in the hosting process based on the eligibility status. |
  """

  @type t :: %__MODULE__{
          results: list() | nil
        }

  defstruct [:results]

  @object_name "numbers.v1.eligibility"
  def object_name, do: @object_name
end
