# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Numbers.V2.RegulatoryCompliance.Regulation do
  @moduledoc """
  Regulation resource.

  SID prefix: `RN`

  Parent: `/RegulatoryCompliance`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `end_user_type` | The type of End User the regulation requires - can be `individual` or `business`.. Values: `individual`, `business` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `friendly_name` | A human-readable description that is assigned to describe the Regulation resource. Examples can include Germany: Mobile - Business. |
  | `iso_country` | The ISO country code of the phone number's country. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `number_type` | The type of phone number restricted by the regulatory requirement. For example, Germany mobile phone numbers provisioned by businesses require a business name with commercial register proof from the Handelsregisterauszug and a proof of address from Handelsregisterauszug or a trade license by Gewerbeanmeldung. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `requirements` | The SID of an object that holds the regulatory information of the phone number country, phone number type, and end user type. |
  | `sid` | The unique string that identifies the Regulation resource. |
  | `url` | The absolute URL of the Regulation resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          end_user_type: String.t(),
          friendly_name: String.t() | nil,
          iso_country: String.t() | nil,
          number_type: String.t() | nil,
          requirements: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :end_user_type,
    :friendly_name,
    :iso_country,
    :number_type,
    :requirements,
    :sid,
    :url
  ]

  @object_name "numbers.v2.regulatory_compliance.regulation"
  def object_name, do: @object_name

  @sid_prefix "RN"
  def sid_prefix, do: @sid_prefix
end
