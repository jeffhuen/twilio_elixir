# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Api.V2010.Address do
  @moduledoc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  An Address instance resource represents your or your customer's physical location within a country. Around the world, some local authorities require the name and address of the user to be on file with Twilio to purchase and own a phone number.

  SID prefix: `AD`

  Parent: `/Accounts/{Sid}.json`

  ## Sub-resources
  - `dependent_phone_numbers` — `/2010-04-01/Accounts/{account_sid}/Addresses/{address_sid}/DependentPhoneNumbers.json`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that is responsible for the Address resource. |
  | `city` | The city in which the address is located. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `customer_name` | The name associated with the address.This property has a maximum length of 16 4-byte characters, or 21 3-byte characters.. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  | `emergency_enabled` | Whether emergency calling has been enabled on this number. |
  | `friendly_name` | The string that you assigned to describe the resource.. PII: standard |
  | `iso_country` | The ISO country code of the address.. Format: iso-country-code |
  | `postal_code` | The postal code of the address.. PII: standard |
  | `region` | The state or region of the address. |
  | `sid` | The unique string that that we created to identify the Address resource. |
  | `street` | The number and street address of the address.. PII: standard |
  | `street_secondary` | The additional number and street address of the address.. PII: standard |
  | `uri` | The URI of the resource, relative to `https://api.twilio.com`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `validated` | Whether the address has been validated to comply with local regulation. In countries that require valid addresses, an invalid address will not be accepted. `true` indicates the Address has been validated. `false` indicate the country doesn't require validation or the Address is not valid. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `verified` | Whether the address has been verified to comply with regulation. In countries that require valid addresses, an invalid address will not be accepted. `true` indicates the Address has been verified. `false` indicate the country doesn't require verified or the Address is not valid. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          city: String.t() | nil,
          customer_name: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          emergency_enabled: boolean() | nil,
          friendly_name: String.t() | nil,
          iso_country: String.t() | nil,
          postal_code: String.t() | nil,
          region: String.t() | nil,
          sid: String.t() | nil,
          street: String.t() | nil,
          street_secondary: String.t() | nil,
          uri: String.t() | nil,
          validated: boolean() | nil,
          verified: boolean() | nil
        }

  defstruct [
    :account_sid,
    :city,
    :customer_name,
    :date_created,
    :date_updated,
    :emergency_enabled,
    :friendly_name,
    :iso_country,
    :postal_code,
    :region,
    :sid,
    :street,
    :street_secondary,
    :uri,
    :validated,
    :verified
  ]

  @object_name "api.v2010.account.address"
  def object_name, do: @object_name

  @sid_prefix "AD"
  def sid_prefix, do: @sid_prefix
end
