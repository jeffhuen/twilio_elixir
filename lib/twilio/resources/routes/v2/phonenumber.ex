# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Routes.V2.Phonenumber do
  @moduledoc """
  Phonenumber resource.

  SID prefix: `QQ`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The unique SID identifier of the Account. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date that this phone number was assigned an Inbound Processing Region, given in ISO 8601 format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date that the Inbound Processing Region was updated for this phone number, given in ISO 8601 format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `friendly_name` | A human readable description of the Inbound Processing Region assignments for this phone number, up to 64 characters. |
  | `phone_number` | The phone number in E.164 format |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `sid` | A 34 character string that uniquely identifies the Inbound Processing Region assignments for this phone number. |
  | `url` | The absolute URL of the resource.. Format: uri |
  | `voice_region` | The Inbound Processing Region used for this phone number for voice. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          phone_number: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil,
          voice_region: String.t() | nil
        }

  defstruct [
    :account_sid,
    :date_created,
    :date_updated,
    :friendly_name,
    :phone_number,
    :sid,
    :url,
    :voice_region
  ]

  @object_name "routes.v2.phone_number"
  def object_name, do: @object_name

  @sid_prefix "QQ"
  def sid_prefix, do: @sid_prefix
end
