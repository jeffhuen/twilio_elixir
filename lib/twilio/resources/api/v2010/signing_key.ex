# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Api.V2010.SigningKey do
  @moduledoc """
  Create a new signing key

  SID prefix: `SK`

  Parent: `/Accounts/{Sid}.json`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `date_created` | Format: date-time-rfc-2822 |
  | `date_updated` | Format: date-time-rfc-2822 |
  """

  @type t :: %__MODULE__{
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          sid: String.t() | nil
        }

  defstruct [:date_created, :date_updated, :friendly_name, :sid]

  @object_name "api.v2010.account.signing_key"
  def object_name, do: @object_name

  @sid_prefix "SK"
  def sid_prefix, do: @sid_prefix
end
