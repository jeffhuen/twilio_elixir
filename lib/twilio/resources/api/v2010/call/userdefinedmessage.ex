# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Api.V2010.Call.Userdefinedmessage do
  @moduledoc """
  Allows your server-side application to send messages to the Voice SDK end user during an active Call.

  SID prefix: `KX`

  Parent: `/Accounts/{AccountSid}/Calls/{Sid}.json`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created User Defined Message. |
  | `call_sid` | The SID of the [Call](https://www.twilio.com/docs/voice/api/call-resource) the User Defined Message is associated with. |
  | `date_created` | The date that this User Defined Message was created, given in RFC 2822 format.. Format: date-time-rfc-2822 |
  | `sid` | The SID that uniquely identifies this User Defined Message. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          call_sid: String.t() | nil,
          date_created: String.t() | nil,
          sid: String.t() | nil
        }

  defstruct [:account_sid, :call_sid, :date_created, :sid]

  @object_name "api.v2010.account.call.user_defined_message"
  def object_name, do: @object_name

  @sid_prefix "KX"
  def sid_prefix, do: @sid_prefix
end
