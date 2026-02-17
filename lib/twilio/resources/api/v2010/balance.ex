# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Api.V2010.Balance do
  @moduledoc """
  Account balance

  Parent: `/Accounts/{Sid}.json`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The unique SID identifier of the Account. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `balance` | The balance of the Account, in units specified by the unit parameter. Balance changes may not be reflected immediately. Child accounts do not contain balance information |
  | `currency` | The units of currency for the account balance |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          balance: String.t() | nil,
          currency: String.t() | nil
        }

  defstruct [:account_sid, :balance, :currency]

  @object_name "api.v2010.account.balance"
  def object_name, do: @object_name
end
