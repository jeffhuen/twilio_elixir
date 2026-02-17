# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Pricing.V2.Voice.Country do
  @moduledoc """
  Voice pricing by country

  Parent: `/Voice`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `country` | The name of the country. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `inbound_call_prices` | The list of [InboundCallPrice](https://www.twilio.com/docs/voice/pricing#inbound-call-price) records. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `iso_country` | The [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2).. Format: iso-country-code |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `outbound_prefix_prices` | The list of [OutboundPrefixPriceWithOrigin](https://www.twilio.com/docs/voice/pricing#outbound-prefix-price-with-origin) records. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `price_unit` | The currency in which prices are measured, specified in [ISO 4127](https://www.iso.org/iso/home/standards/currency_codes.htm) format (e.g. `usd`, `eur`, `jpy`).. Format: currency |
  | `url` | The absolute URL of the resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          country: String.t() | nil,
          inbound_call_prices: list() | nil,
          iso_country: String.t() | nil,
          outbound_prefix_prices: list() | nil,
          price_unit: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :country,
    :inbound_call_prices,
    :iso_country,
    :outbound_prefix_prices,
    :price_unit,
    :url
  ]

  @object_name "pricing.v2.voice.voice_country-instance"
  def object_name, do: @object_name
end
