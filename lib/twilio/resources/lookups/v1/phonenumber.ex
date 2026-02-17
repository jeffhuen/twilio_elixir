# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Lookups.V1.Phonenumber do
  @moduledoc """
  Detailed information on phone numbers

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `add_ons` | A JSON string with the results of the Add-ons you specified in the `add_ons` parameters. For the format of the object, see [Using Add-ons](https://www.twilio.com/docs/add-ons).. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `caller_name` | The name of the phone number's owner. If `null`, that information was not available.. PII: standard |
  | `carrier` | The telecom company that provides the phone number. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `country_code` | The [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) for the phone number.. PII: standard |
  | `national_format` | The phone number, in national format.. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `phone_number` | The phone number in [E.164](https://www.twilio.com/docs/glossary/what-e164) format, which consists of a + followed by the country code and subscriber number.. Format: phone-number. PII: standard |
  | `url` | The absolute URL of the resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          add_ons: String.t() | nil,
          caller_name: String.t() | nil,
          carrier: String.t() | nil,
          country_code: String.t() | nil,
          national_format: String.t() | nil,
          phone_number: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :add_ons,
    :caller_name,
    :carrier,
    :country_code,
    :national_format,
    :phone_number,
    :url
  ]

  @object_name "lookups.v1.phone_number"
  def object_name, do: @object_name
end
