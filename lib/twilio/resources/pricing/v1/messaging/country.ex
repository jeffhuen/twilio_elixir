# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Pricing.V1.Messaging.Country do
  @moduledoc """
  Messaging pricing by country

  Parent: `/Messaging`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `country` | The name of the country. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `inbound_sms_prices` | The list of [InboundPrice](https://www.twilio.com/docs/sms/api/pricing#inbound-price) records that describe the price to receive an inbound SMS to the different Twilio phone number types supported in this country |
  | `iso_country` | The [ISO country code](http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2).. Format: iso-country-code |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `outbound_sms_prices` | The list of [OutboundSMSPrice](https://www.twilio.com/docs/sms/api/pricing#outbound-sms-price) records that represent the price to send a message for each MCC/MNC applicable in this country. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `price_unit` | The currency in which prices are measured, specified in [ISO 4127](http://www.iso.org/iso/home/standards/currency_codes.htm) format (e.g. `usd`, `eur`, `jpy`).. Format: currency |
  | `url` | The absolute URL of the resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          country: String.t() | nil,
          inbound_sms_prices: list() | nil,
          iso_country: String.t() | nil,
          outbound_sms_prices: list() | nil,
          price_unit: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:country, :inbound_sms_prices, :iso_country, :outbound_sms_prices, :price_unit, :url]

  @object_name "pricing.v1.messaging.messaging_country-instance"
  def object_name, do: @object_name
end
