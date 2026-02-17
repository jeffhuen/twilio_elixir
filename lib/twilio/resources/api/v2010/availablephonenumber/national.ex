# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Api.V2010.Availablephonenumber.National do
  @moduledoc """
  Available national phone numbers

  Parent: `/Accounts/{AccountSid}/AvailablePhoneNumbers/{CountryCode}.json`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `address_requirements` | The type of [Address](https://www.twilio.com/docs/usage/api/address) resource the phone number requires. Can be: `none`, `any`, `local`, or `foreign`. `none` means no address is required. `any` means an address is required, but it can be anywhere in the world. `local` means an address in the phone number's country is required. `foreign` means an address outside of the phone number's country is required. |
  | `beta` | Whether the phone number is new to the Twilio platform. Can be: `true` or `false`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `capabilities` | The set of Boolean properties that indicate whether a phone number can receive calls or messages.  Capabilities are: `Voice`, `SMS`, and `MMS` and each capability can be: `true` or `false`.. Format: phone-number-capabilities |
  | `friendly_name` | A formatted version of the phone number.. Format: phone-number |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `iso_country` | The [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) of this phone number.. Format: iso-country-code |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `lata` | The [LATA](https://en.wikipedia.org/wiki/Local_access_and_transport_area) of this phone number. Available for only phone numbers from the US and Canada. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `latitude` | The latitude of this phone number's location. Available for only phone numbers from the US and Canada. |
  | `locality` | The locality or city of this phone number's location. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `longitude` | The longitude of this phone number's location. Available for only phone numbers from the US and Canada. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `phone_number` | The phone number in [E.164](https://www.twilio.com/docs/glossary/what-e164) format, which consists of a + followed by the country code and subscriber number.. Format: phone-number |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `postal_code` | The postal or ZIP code of this phone number's location. Available for only phone numbers from the US and Canada. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `rate_center` | The [rate center](https://en.wikipedia.org/wiki/Telephone_exchange) of this phone number. Available for only phone numbers from the US and Canada. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `region` | The two-letter state or province abbreviation of this phone number's location. Available for only phone numbers from the US and Canada. |
  """

  @type t :: %__MODULE__{
          address_requirements: String.t() | nil,
          beta: boolean() | nil,
          capabilities: map() | nil,
          friendly_name: String.t() | nil,
          iso_country: String.t() | nil,
          lata: String.t() | nil,
          latitude: float() | nil,
          locality: String.t() | nil,
          longitude: float() | nil,
          phone_number: String.t() | nil,
          postal_code: String.t() | nil,
          rate_center: String.t() | nil,
          region: String.t() | nil
        }

  defstruct [
    :address_requirements,
    :beta,
    :capabilities,
    :friendly_name,
    :iso_country,
    :lata,
    :latitude,
    :locality,
    :longitude,
    :phone_number,
    :postal_code,
    :rate_center,
    :region
  ]

  @object_name "api.v2010.account.available_phone_number_country.available_phone_number_national"
  def object_name, do: @object_name
end
