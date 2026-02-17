# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Numbers.V1.Porting.PortIn.PhoneNumber do
  @moduledoc """
  PhoneNumber resource.

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | Account Sid or subaccount where the phone number(s) will be Ported. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `country` | The ISO country code that this number is associated with. This field may be null if the number is not portable or if the portability for a number has not yet been evaluated.. Format: iso-country-code |
  | `date_created` | The timestamp for when this port in phone number was created.. Format: date-time |
  | `last_updated` | Timestamp indicating when the Port In Phone Number resource was last modified.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `missing_required_fields` | Indicates if the phone number is missing required fields such as a PIN or account number. This field may be null if the number is not portable or if the portability for a number has not yet been evaluated. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `not_portability_reason` | The not portability reason code description. This field may be null if the number is portable or if the portability for a number has not yet been evaluated. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `not_portability_reason_code` | The not portability reason code. This field may be null if the number is portable or if the portability for a number has not yet been evaluated. |
  | `phone_number` | Phone number to be ported. This will be in the E164 Format.. Format: phone-number |
  | `phone_number_sid` | The unique identifier for this phone number associated with this port in request. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `phone_number_type` | The number type of the phone number. This can be: toll-free, local, mobile or unknown. This field may be null if the number is not portable or if the portability for a number has not yet been evaluated. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `port_date` | The timestamp the phone number will be ported. This will only be set once a port date has been confirmed. Not all carriers can guarantee a specific time on the port date. Twilio will try its best to get the port completed by this time on the port date. Please subscribe to webhooks for confirmation on when a port has actually been completed.. Format: date-time |
  | `port_in_phone_number_status` | The status of the port in phone number. |
  | `port_in_request_sid` | The unique identifier for the port in request that this phone number is associated with. |
  | `port_out_pin` | The pin required by the losing carrier to do the port out. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `portable` | If the number is portable by Twilio or not. This field may be null if the number portability has not yet been evaluated. If a number is not portable reference the `not_portability_reason_code` and `not_portability_reason` fields for more details |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `rejection_reason` | The description of the rejection reason provided by the losing carrier. This field may be null if the number has not been rejected by the losing carrier. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `rejection_reason_code` | The code for the rejection reason provided by the losing carrier. This field may be null if the number has not been rejected by the losing carrier. |
  | `url` | URL reference for this resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          country: String.t() | nil,
          date_created: String.t() | nil,
          last_updated: String.t() | nil,
          missing_required_fields: boolean() | nil,
          not_portability_reason: String.t() | nil,
          not_portability_reason_code: integer() | nil,
          phone_number: String.t() | nil,
          phone_number_sid: String.t() | nil,
          phone_number_type: String.t() | nil,
          port_date: String.t() | nil,
          port_in_phone_number_status: String.t() | nil,
          port_in_request_sid: String.t() | nil,
          port_out_pin: integer() | nil,
          portable: boolean() | nil,
          rejection_reason: String.t() | nil,
          rejection_reason_code: integer() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :country,
    :date_created,
    :last_updated,
    :missing_required_fields,
    :not_portability_reason,
    :not_portability_reason_code,
    :phone_number,
    :phone_number_sid,
    :phone_number_type,
    :port_date,
    :port_in_phone_number_status,
    :port_in_request_sid,
    :port_out_pin,
    :portable,
    :rejection_reason,
    :rejection_reason_code,
    :url
  ]

  @object_name "numbers.v1.porting_port_in_phone_number"
  def object_name, do: @object_name
end
