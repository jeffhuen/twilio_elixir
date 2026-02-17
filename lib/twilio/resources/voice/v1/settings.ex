# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Voice.V1.Settings do
  @moduledoc """


  Parent: `/DialingPermissions`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `dialing_permissions_inheritance` | `true` if the sub-account will inherit voice dialing permissions from the Master Project; otherwise `false`. |
  | `url` | The absolute URL of this resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          dialing_permissions_inheritance: boolean() | nil,
          url: String.t() | nil
        }

  defstruct [:dialing_permissions_inheritance, :url]

  @object_name "voice.v1.dialing_permissions.dialing_permissions_settings"
  def object_name, do: @object_name
end
