# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Api.V2010.Call.Siprec do
  @moduledoc """
  Start and stop forked media streaming using the SIPREC protocol.

  SID prefix: `SR`

  Parent: `/Accounts/{AccountSid}/Calls/{Sid}.json`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created this Siprec resource. |
  | `call_sid` | The SID of the [Call](https://www.twilio.com/docs/voice/api/call-resource) the Siprec resource is associated with. |
  | `date_updated` | The date and time in GMT that this resource was last updated, specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  | `name` | The user-specified name of this Siprec, if one was given when the Siprec was created. This may be used to stop the Siprec. |
  | `sid` | The SID of the Siprec resource. |
  | `status` | The status - one of `stopped`, `in-progress`. Values: `in-progress`, `stopped` |
  | `uri` | The URI of the resource, relative to `https://api.twilio.com`. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          call_sid: String.t() | nil,
          date_updated: String.t() | nil,
          name: String.t() | nil,
          sid: String.t() | nil,
          status: String.t(),
          uri: String.t() | nil
        }

  defstruct [:account_sid, :call_sid, :date_updated, :name, :sid, :status, :uri]

  @object_name "api.v2010.account.call.siprec"
  def object_name, do: @object_name

  @sid_prefix "SR"
  def sid_prefix, do: @sid_prefix
end
