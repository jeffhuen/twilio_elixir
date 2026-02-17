# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Api.V2010.AvailablePhoneNumberCountry do
  @moduledoc """
  Country codes with available phone numbers

  Parent: `/Accounts/{Sid}.json`

  ## Sub-resources
  - `local` — `/2010-04-01/Accounts/{account_sid}/AvailablePhoneNumbers/{country_code}/Local.json`
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  - `machine_to_machine` — `/2010-04-01/Accounts/{account_sid}/AvailablePhoneNumbers/{country_code}/MachineToMachine.json`
  - `mobile` — `/2010-04-01/Accounts/{account_sid}/AvailablePhoneNumbers/{country_code}/Mobile.json`
  - `national` — `/2010-04-01/Accounts/{account_sid}/AvailablePhoneNumbers/{country_code}/National.json`
  - `shared_cost` — `/2010-04-01/Accounts/{account_sid}/AvailablePhoneNumbers/{country_code}/SharedCost.json`
  - `toll_free` — `/2010-04-01/Accounts/{account_sid}/AvailablePhoneNumbers/{country_code}/TollFree.json`
  - `voip` — `/2010-04-01/Accounts/{account_sid}/AvailablePhoneNumbers/{country_code}/Voip.json`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `beta` | Whether all phone numbers available in the country are new to the Twilio platform. `true` if they are and `false` if all numbers are not in the Twilio Phone Number Beta program. |
  | `country` | The name of the country. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `country_code` | The [ISO-3166-1](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country code of the country.. Format: iso-country-code |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `subresource_uris` | A list of related AvailablePhoneNumber resources identified by their URIs relative to `https://api.twilio.com`.. Format: uri-map |
  | `uri` | The URI of the Country resource, relative to `https://api.twilio.com`.. Format: uri |
  """

  @type t :: %__MODULE__{
          beta: boolean() | nil,
          country: String.t() | nil,
          country_code: String.t() | nil,
          subresource_uris: map() | nil,
          uri: String.t() | nil
        }

  defstruct [:beta, :country, :country_code, :subresource_uris, :uri]

  @object_name "api.v2010.account.available_phone_number_country"
  def object_name, do: @object_name
end
