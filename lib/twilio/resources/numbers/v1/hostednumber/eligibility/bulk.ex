# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Numbers.V1.Hostednumber.Eligibility.Bulk do
  @moduledoc """
  Bulk resource.

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `date_completed` | Format: date-time |
  | `date_created` | Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `friendly_name` | This is the string that you assigned as a friendly name for describing the eligibility check request. |
  | `request_id` | The SID of the bulk eligibility check that you want to know about. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `results` | The result set that contains the eligibility check response for each requested number, each result has at least the following attributes:  phone_number: The requested phone number ,hosting_account_sid: The account sid where the phone number will be hosted, country: Phone number’s country, eligibility_status: Indicates the eligibility status of the PN (Eligible/Ineligible), eligibility_sub_status: Indicates the sub status of the eligibility , ineligibility_reason: Reason for number's ineligibility (if applicable), next_step: Suggested next step in the hosting process based on the eligibility status. |
  | `status` | This is the status of the bulk eligibility check request. (Example: COMPLETE, IN_PROGRESS) |
  | `url` | This is the url of the request that you're trying to reach out to locate the resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          date_completed: String.t() | nil,
          date_created: String.t() | nil,
          friendly_name: String.t() | nil,
          request_id: String.t() | nil,
          results: list() | nil,
          status: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:date_completed, :date_created, :friendly_name, :request_id, :results, :status, :url]

  @object_name "numbers.v1.bulk_eligibility"
  def object_name, do: @object_name
end
