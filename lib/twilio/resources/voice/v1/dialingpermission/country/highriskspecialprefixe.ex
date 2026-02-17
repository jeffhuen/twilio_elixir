# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Voice.V1.Dialingpermission.Country.Highriskspecialprefixe do
  @moduledoc """
  Highriskspecialprefixe resource.

  Parent: `/DialingPermissions/Countries/{IsoCode}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `prefix` | A prefix is a contiguous number range for a block of E.164 numbers that includes the E.164 assigned country code. For example, a North American Numbering Plan prefix like `+1510720` written like `+1(510) 720` matches all numbers inclusive from `+1(510) 720-0000` to `+1(510) 720-9999`. |
  """

  @type t :: %__MODULE__{
          prefix: String.t() | nil
        }

  defstruct [:prefix]

  @object_name "voice.v1.dialing_permissions.dialing_permissions_country.dialing_permissions_hrs_prefixes"
  def object_name, do: @object_name
end
