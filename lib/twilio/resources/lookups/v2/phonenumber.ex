# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Lookups.V2.Phonenumber do
  @moduledoc """
  Query information on a phone number so that you can make a trusted interaction with your user

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `call_forwarding` | An object that contains information on the unconditional call forwarding status of mobile phone number. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `caller_name` | An object that contains caller name information based on [CNAM](https://support.twilio.com/hc/en-us/articles/360051670533-Getting-Started-with-CNAM-Caller-ID).. PII: standard |
  | `calling_country_code` | International dialing prefix of the phone number defined in the E.164 standard. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `country_code` | The phone number's [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2).. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `identity_match` | An object that contains identity match information. The result of comparing user-provided information including name, address, date of birth, national ID, against authoritative phone-based data sources |
  | `line_status` | An object that contains line status information for a mobile phone number. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `line_type_intelligence` | An object that contains line type information including the carrier name, mobile country code, and mobile network code. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `national_format` | The phone number in [national format](https://en.wikipedia.org/wiki/National_conventions_for_writing_telephone_numbers).. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `phone_number` | The phone number in [E.164](https://www.twilio.com/docs/glossary/what-e164) format, which consists of a + followed by the country code and subscriber number.. Format: phone-number. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `phone_number_quality_score` | An object that contains information of a mobile phone number quality score. Quality score will return a risk score about the phone number. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `pre_fill` | An object that contains pre fill information. pre_fill will return PII information associated with the phone number like first name, last name, address line, country code, state and postal code.  |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `reassigned_number` | An object that contains reassigned number information. Reassigned Numbers will return a phone number's reassignment status given a phone number and date |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `sim_swap` | An object that contains information on the last date the subscriber identity module (SIM) was changed for a mobile phone number. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `sms_pumping_risk` | An object that contains information on if a phone number has been currently or previously blocked by Verify Fraud Guard for receiving malicious SMS pumping traffic as well as other signals associated with risky carriers and low conversion rates. |
  | `url` | The absolute URL of the resource.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `valid` | Boolean which indicates if the phone number is in a valid range that can be freely assigned by a carrier to a user. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `validation_errors` | Contains reasons why a phone number is invalid. Possible values: TOO_SHORT, TOO_LONG, INVALID_BUT_POSSIBLE, INVALID_COUNTRY_CODE, INVALID_LENGTH, NOT_A_NUMBER. |
  """

  @type t :: %__MODULE__{
          call_forwarding: String.t(),
          caller_name: String.t(),
          calling_country_code: String.t() | nil,
          country_code: String.t() | nil,
          identity_match: String.t(),
          line_status: String.t(),
          line_type_intelligence: String.t(),
          national_format: String.t() | nil,
          phone_number: String.t() | nil,
          phone_number_quality_score: String.t(),
          pre_fill: String.t(),
          reassigned_number: String.t(),
          sim_swap: String.t(),
          sms_pumping_risk: String.t(),
          url: String.t(),
          valid: boolean(),
          validation_errors: list()
        }

  defstruct [
    :call_forwarding,
    :caller_name,
    :calling_country_code,
    :country_code,
    :identity_match,
    :line_status,
    :line_type_intelligence,
    :national_format,
    :phone_number,
    :phone_number_quality_score,
    :pre_fill,
    :reassigned_number,
    :sim_swap,
    :sms_pumping_risk,
    :url,
    :valid,
    :validation_errors
  ]

  @object_name "LookupResponse"
  def object_name, do: @object_name
end
