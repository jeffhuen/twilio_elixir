# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Marketplace.V1.ReferralConversion do
  @moduledoc """
  ReferralConversion resource.
  """

  @type t :: %__MODULE__{
          converted_account_sid: String.t()
        }

  defstruct [:converted_account_sid]

  @object_name "marketplace.v1.referral_conversion"
  def object_name, do: @object_name
end
