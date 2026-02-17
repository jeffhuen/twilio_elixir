# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Pricing.V2.Trunking.Country do
  @moduledoc """
  Trunking pricing by country

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `country` | The name of the country. |
  | `iso_country` | The [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2).. Format: iso-country-code |
  | `originating_call_prices` | The list of [OriginatingCallPrice](https://www.twilio.com/docs/voice/pricing#inbound-call-price) records. |
  | `price_unit` | The currency in which prices are measured, specified in [ISO 4127](https://www.iso.org/iso/home/standards/currency_codes.htm) format (e.g. `usd`, `eur`, `jpy`).. Format: currency |
  | `terminating_prefix_prices` | The list of [TerminatingPrefixPrice](https://www.twilio.com/docs/voice/pricing#outbound-prefix-price-with-origin) records. |
  | `url` | The absolute URL of the resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          country: String.t() | nil,
          iso_country: String.t() | nil,
          originating_call_prices: list() | nil,
          price_unit: String.t() | nil,
          terminating_prefix_prices: list() | nil,
          url: String.t() | nil
        }

  defstruct [
    :country,
    :iso_country,
    :originating_call_prices,
    :price_unit,
    :terminating_prefix_prices,
    :url
  ]

  @object_name "pricing.v2.trunking_country-instance"
  def object_name, do: @object_name
end
