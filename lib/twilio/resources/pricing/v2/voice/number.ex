# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Pricing.V2.Voice.Number do
  @moduledoc """
  Voice pricing for a specific phone number

  Parent: `/Voice`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `country` | The name of the country. |
  | `destination_number` | The destination phone number in [E.164](https://www.twilio.com/docs/glossary/what-e164) format, which consists of a + followed by the country code and subscriber number.. Format: phone-number |
  | `inbound_call_price` | The [InboundCallPrice](https://www.twilio.com/docs/voice/pricing#inbound-call-price) record.. Format: inbound-call-price |
  | `iso_country` | The [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2). Format: iso-country-code |
  | `origination_number` | The origination phone number in [[E.164](https://www.twilio.com/docs/glossary/what-e164) format, which consists of a + followed by the country code and subscriber number.. Format: phone-number |
  | `outbound_call_prices` | The list of [OutboundCallPriceWithOrigin](https://www.twilio.com/docs/voice/pricing#outbound-call-price-with-origin) records. |
  | `price_unit` | The currency in which prices are measured, specified in [ISO 4127](https://www.iso.org/iso/home/standards/currency_codes.htm) format (e.g. `usd`, `eur`, `jpy`).. Format: currency |
  | `url` | The absolute URL of the resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          country: String.t() | nil,
          destination_number: String.t() | nil,
          inbound_call_price: map() | nil,
          iso_country: String.t() | nil,
          origination_number: String.t() | nil,
          outbound_call_prices: list() | nil,
          price_unit: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :country,
    :destination_number,
    :inbound_call_price,
    :iso_country,
    :origination_number,
    :outbound_call_prices,
    :price_unit,
    :url
  ]

  @object_name "pricing.v2.voice.voice_number"
  def object_name, do: @object_name
end
