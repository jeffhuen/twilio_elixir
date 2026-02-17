# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Conversations.V1.Configuration.Address do
  @moduledoc """
  Address Configuration resource manages the configurations related to a unique address within Conversations

  SID prefix: `IG`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The unique ID of the [Account](https://www.twilio.com/docs/iam/api/account) the address belongs to |
  | `address` | The unique address to be configured. The address can be a whatsapp address or phone number. PII: standard |
  | `address_country` | An ISO 3166-1 alpha-2n country code which the address belongs to. This is currently only applicable to short code addresses. |
  | `auto_creation` | Auto Creation configuration for the address. |
  | `date_created` | The date that this resource was created.. Format: date-time |
  | `date_updated` | The date that this resource was last updated.. Format: date-time |
  | `friendly_name` | The human-readable name of this configuration, limited to 256 characters. Optional. |
  | `sid` | A 34 character string that uniquely identifies this resource. |
  | `type` | Type of Address, value can be `whatsapp` or `sms`. |
  | `url` | An absolute API resource URL for this address configuration.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          address: String.t() | nil,
          address_country: String.t() | nil,
          auto_creation: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          sid: String.t() | nil,
          type: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :address,
    :address_country,
    :auto_creation,
    :date_created,
    :date_updated,
    :friendly_name,
    :sid,
    :type,
    :url
  ]

  @object_name "conversations.v1.configuration_address"
  def object_name, do: @object_name

  @sid_prefix "IG"
  def sid_prefix, do: @sid_prefix
end
