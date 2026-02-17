# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Api.V2010.Token do
  @moduledoc """
  Credentials for ICE servers

  Parent: `/Accounts/{Sid}.json`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Token resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  | `ice_servers` | An array representing the ephemeral credentials and the STUN and TURN server URIs. |
  | `password` | The temporary password that the username will use when authenticating with Twilio. |
  | `ttl` | The duration in seconds for which the username and password are valid. |
  | `username` | The temporary username that uniquely identifies a Token. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          ice_servers: list() | nil,
          password: String.t() | nil,
          ttl: String.t() | nil,
          username: String.t() | nil
        }

  defstruct [:account_sid, :date_created, :date_updated, :ice_servers, :password, :ttl, :username]

  @object_name "api.v2010.account.token"
  def object_name, do: @object_name
end
