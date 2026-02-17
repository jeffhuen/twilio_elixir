# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Pricing.V1.Voice.Number do
  @moduledoc """
  Voice pricing for a specific phone number

  Parent: `/Voice`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `country` | The name of the country. |
  | `inbound_call_price` | The [InboundCallPrice](https://www.twilio.com/docs/voice/pricing#inbound-call-price) record. If `null`, the Phone Number is not a Twilio number owned by this account.. Format: inbound-call-price |
  | `iso_country` | The [ISO country code](http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2).. Format: iso-country-code |
  | `number` | The phone number.. Format: phone-number |
  | `outbound_call_price` | The OutboundCallPrice record, which includes a list of `origination_prefixes` and the `base_price` and `current_price` for those prefixes.. Format: outbound-call-price |
  | `price_unit` | The currency in which prices are measured, specified in [ISO 4127](http://www.iso.org/iso/home/standards/currency_codes.htm) format (e.g. `usd`, `eur`, `jpy`).. Format: currency |
  | `url` | The absolute URL of the resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          country: String.t() | nil,
          inbound_call_price: map() | nil,
          iso_country: String.t() | nil,
          number: String.t() | nil,
          outbound_call_price: map() | nil,
          price_unit: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :country,
    :inbound_call_price,
    :iso_country,
    :number,
    :outbound_call_price,
    :price_unit,
    :url
  ]

  @object_name "pricing.v1.voice.voice_number"
  def object_name, do: @object_name
end
