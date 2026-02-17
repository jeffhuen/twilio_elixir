# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Numbers.V1.Porting.Portability.Phonenumber do
  @moduledoc """


  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | Account Sid that the phone number belongs to in Twilio. This is only returned for phone numbers that already exist in Twilio’s inventory and belong to your account or sub account. |
  | `country` | Country the phone number belongs to.. Format: iso-country-code |
  | `not_portable_reason` | Reason why the phone number cannot be ported into Twilio, `null` otherwise. |
  | `not_portable_reason_code` | The Portability Reason Code for the phone number if it cannot be ported into Twilio, `null` otherwise. |
  | `number_type` | The type of the requested phone number. One of `LOCAL`, `UNKNOWN`, `MOBILE`, `TOLL-FREE`.. Values: `LOCAL`, `UNKNOWN`, `MOBILE`, `TOLL-FREE` |
  | `phone_number` | The phone number which portability is to be checked. Phone numbers are in E.164 format (e.g. +16175551212).. Format: phone-number. PII: standard |
  | `pin_and_account_number_required` | Indicates if the port in process will require a personal identification number (PIN) and an account number for this phone number. If this is true you will be required to submit both a PIN and account number from the losing carrier for this number when opening a port in request. These fields will be required in order to complete the port in process to Twilio. |
  | `portable` | Boolean flag indicates if the phone number can be ported into Twilio through the Porting API or not. |
  | `url` | This is the url of the request that you're trying to reach out to locate the resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          country: String.t() | nil,
          not_portable_reason: String.t() | nil,
          not_portable_reason_code: integer() | nil,
          number_type: String.t(),
          phone_number: String.t() | nil,
          pin_and_account_number_required: boolean() | nil,
          portable: boolean() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :country,
    :not_portable_reason,
    :not_portable_reason_code,
    :number_type,
    :phone_number,
    :pin_and_account_number_required,
    :portable,
    :url
  ]

  @object_name "numbers.v1.porting_portability"
  def object_name, do: @object_name
end
