# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Voice.V1.Dialingpermission.Bulkcountryupdate do
  @moduledoc """


  Parent: `/DialingPermissions`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `update_count` | The number of countries updated |
  | `update_request` | A bulk update request to change voice dialing country permissions stored as a URL-encoded, JSON array of update objects. For example : `[ { "iso_code": "GB", "low_risk_numbers_enabled": "true", "high_risk_special_numbers_enabled":"true", "high_risk_tollfraud_numbers_enabled": "false" } ]` |
  """

  @type t :: %__MODULE__{
          update_count: integer(),
          update_request: String.t() | nil
        }

  defstruct [:update_count, :update_request]

  @object_name "voice.v1.dialing_permissions.dialing_permissions_country_bulk_update"
  def object_name, do: @object_name
end
