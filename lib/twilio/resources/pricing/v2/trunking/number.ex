# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Pricing.V2.Trunking.Number do
  @moduledoc """
  Trunking pricing for a specific phone number

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `country` | The name of the country. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `destination_number` | The destination phone number in [E.164](https://www.twilio.com/docs/glossary/what-e164) format, which consists of a + followed by the country code and subscriber number.. Format: phone-number |
  | `iso_country` | The [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2). Format: iso-country-code |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `originating_call_price` | The [OriginatingCallPrice](https://www.twilio.com/docs/voice/pricing#inbound-call-price) record.. Format: inbound-call-price |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `origination_number` | The origination phone number in [[E.164](https://www.twilio.com/docs/glossary/what-e164) format, which consists of a + followed by the country code and subscriber number.. Format: phone-number |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `price_unit` | The currency in which prices are measured, specified in [ISO 4127](https://www.iso.org/iso/home/standards/currency_codes.htm) format (e.g. `usd`, `eur`, `jpy`).. Format: currency |
  | `url` | The absolute URL of the resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          country: String.t() | nil,
          destination_number: String.t() | nil,
          iso_country: String.t() | nil,
          originating_call_price: map() | nil,
          origination_number: String.t() | nil,
          price_unit: String.t() | nil,
          terminating_prefix_prices: list() | nil,
          url: String.t() | nil
        }

  defstruct [
    :country,
    :destination_number,
    :iso_country,
    :originating_call_price,
    :origination_number,
    :price_unit,
    :terminating_prefix_prices,
    :url
  ]

  @object_name "pricing.v2.trunking_number"
  def object_name, do: @object_name
end
