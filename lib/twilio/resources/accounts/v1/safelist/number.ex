# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Accounts.V1.Safelist.Number do
  @moduledoc """


  SID prefix: `GN`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `phone_number` | The phone number or phone number 1k prefix in SafeList.. PII: standard |
  | `sid` | The unique string that we created to identify the SafeList resource. |
  """

  @type t :: %__MODULE__{
          phone_number: String.t() | nil,
          sid: String.t() | nil
        }

  defstruct [:phone_number, :sid]

  @object_name "accounts.v1.safelist"
  def object_name, do: @object_name

  @sid_prefix "GN"
  def sid_prefix, do: @sid_prefix
end
