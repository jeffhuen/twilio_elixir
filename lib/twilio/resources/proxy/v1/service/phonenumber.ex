# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Proxy.V1.Service.Phonenumber do
  @moduledoc """


  SID prefix: `PN`

  Parent: `/Services/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the PhoneNumber resource. |
  | `capabilities` | The capabilities of the phone number.. Format: phone-number-capabilities |
  | `date_created` | The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time in GMT when the resource was created.. Format: date-time |
  | `date_updated` | The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time in GMT when the resource was last updated.. Format: date-time |
  | `friendly_name` | The string that you assigned to describe the resource. |
  | `in_use` | The number of open session assigned to the number. See the [How many Phone Numbers do I need?](https://www.twilio.com/docs/proxy/phone-numbers-needed) guide for more information. |
  | `is_reserved` | Whether the phone number should be reserved and not be assigned to a participant using proxy pool logic. See [Reserved Phone Numbers](https://www.twilio.com/docs/proxy/reserved-phone-numbers) for more information. |
  | `iso_country` | The ISO Country Code for the phone number. |
  | `phone_number` | The phone number in [E.164](https://www.twilio.com/docs/glossary/what-e164) format, which consists of a + followed by the country code and subscriber number.. Format: phone-number |
  | `service_sid` | The SID of the PhoneNumber resource's parent [Service](https://www.twilio.com/docs/proxy/api/service) resource. |
  | `sid` | The unique string that we created to identify the PhoneNumber resource. |
  | `url` | The absolute URL of the PhoneNumber resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          capabilities: map() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          in_use: integer(),
          is_reserved: boolean() | nil,
          iso_country: String.t() | nil,
          phone_number: String.t() | nil,
          service_sid: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :capabilities,
    :date_created,
    :date_updated,
    :friendly_name,
    :in_use,
    :is_reserved,
    :iso_country,
    :phone_number,
    :service_sid,
    :sid,
    :url
  ]

  @object_name "proxy.v1.service.phone_number"
  def object_name, do: @object_name

  @sid_prefix "PN"
  def sid_prefix, do: @sid_prefix
end
