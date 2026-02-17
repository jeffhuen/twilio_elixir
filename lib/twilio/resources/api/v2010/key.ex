# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Api.V2010.Key do
  @moduledoc """
  API keys

  SID prefix: `SK`

  Parent: `/Accounts/{Sid}.json`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `date_created` | The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  | `date_updated` | The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  | `friendly_name` | The string that you assigned to describe the resource.. PII: standard |
  | `sid` | The unique string that that we created to identify the Key resource. |
  """

  @type t :: %__MODULE__{
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          sid: String.t() | nil
        }

  defstruct [:date_created, :date_updated, :friendly_name, :sid]

  @object_name "api.v2010.account.key"
  def object_name, do: @object_name

  @sid_prefix "SK"
  def sid_prefix, do: @sid_prefix
end
