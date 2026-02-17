# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Studio.V2.Flow.Validate do
  @moduledoc """
  Flow definition validator

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `valid` | Boolean if the flow definition is valid. |
  """

  @type t :: %__MODULE__{
          valid: boolean() | nil
        }

  defstruct [:valid]

  @object_name "studio.v2.flow_validate"
  def object_name, do: @object_name
end
