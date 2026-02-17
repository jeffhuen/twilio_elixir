# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Verify.V2.Template do
  @moduledoc """
  Template resource.

  SID prefix: `HJ`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The unique SID identifier of the Account. |
  | `channels` | A list of channels that support the Template. Can include: sms, voice. |
  | `friendly_name` | A descriptive string that you create to describe a Template. It can be up to 32 characters long. |
  | `sid` | A 34 character string that uniquely identifies a Verification Template. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `translations` | An object that contains the different translations of the template. Every translation is identified by the language short name and contains its respective information as the approval status, text and created/modified date. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          channels: list() | nil,
          friendly_name: String.t() | nil,
          sid: String.t() | nil,
          translations: String.t() | nil
        }

  defstruct [:account_sid, :channels, :friendly_name, :sid, :translations]

  @object_name "verify.v2.verification_template"
  def object_name, do: @object_name

  @sid_prefix "HJ"
  def sid_prefix, do: @sid_prefix
end
