# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Pricing.V1.Phonenumber.Country do
  @moduledoc """
  Phone number pricing by country

  Parent: `/PhoneNumbers`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `country` | The name of the country. |
  | `iso_country` | The [ISO country code](http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2).. Format: iso-country-code |
  | `phone_number_prices` | The list of [PhoneNumberPrice](https://www.twilio.com/docs/phone-numbers/pricing#phone-number-price) records. |
  | `price_unit` | The currency in which prices are measured, specified in [ISO 4127](http://www.iso.org/iso/home/standards/currency_codes.htm) format (e.g. `usd`, `eur`, `jpy`).. Format: currency |
  | `url` | The absolute URL of the resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          country: String.t() | nil,
          iso_country: String.t() | nil,
          phone_number_prices: list() | nil,
          price_unit: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:country, :iso_country, :phone_number_prices, :price_unit, :url]

  @object_name "pricing.v1.phone_number.phone_number_country-instance"
  def object_name, do: @object_name
end
