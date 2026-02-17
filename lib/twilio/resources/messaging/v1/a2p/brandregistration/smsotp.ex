# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Messaging.V1.A2p.Brandregistration.Smsotp do
  @moduledoc """
  A Messaging Service resource to retry OTP verification for Sole Proprietor Brand Registrations.

  Parent: `/a2p/BrandRegistrations/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Brand Registration resource. |
  | `brand_registration_sid` | The unique string to identify Brand Registration of Sole Proprietor Brand |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          brand_registration_sid: String.t() | nil
        }

  defstruct [:account_sid, :brand_registration_sid]

  @object_name "messaging.v1.brand_registrations.brand_registration_otp"
  def object_name, do: @object_name
end
