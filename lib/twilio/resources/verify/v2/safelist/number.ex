# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Verify.V2.Safelist.Number do
  @moduledoc """
  Number resource.

  SID prefix: `GN`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `phone_number` | The phone number in SafeList.. PII: standard |
  | `sid` | The unique string that we created to identify the SafeList resource. |
  | `url` | The absolute URL of the SafeList resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          phone_number: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:phone_number, :sid, :url]

  @object_name "verify.v2.safelist"
  def object_name, do: @object_name

  @sid_prefix "GN"
  def sid_prefix, do: @sid_prefix
end
