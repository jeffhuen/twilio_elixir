# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Api.V2010.Call.Payment do
  @moduledoc """
  Twilio enabled secure payments solution for accepting credit and ACH payments over the phone.

  SID prefix: `PK`

  Parent: `/Accounts/{AccountSid}/Calls/{Sid}.json`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Payments resource. |
  | `call_sid` | The SID of the [Call](https://www.twilio.com/docs/voice/api/call-resource) the Payments resource is associated with. This will refer to the call sid that is producing the payment card (credit/ACH) information thru DTMF. |
  | `date_created` | The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  | `date_updated` | The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  | `sid` | The SID of the Payments resource. |
  | `uri` | The URI of the resource, relative to `https://api.twilio.com`. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          call_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          sid: String.t() | nil,
          uri: String.t() | nil
        }

  defstruct [:account_sid, :call_sid, :date_created, :date_updated, :sid, :uri]

  @object_name "api.v2010.account.call.payments"
  def object_name, do: @object_name

  @sid_prefix "PK"
  def sid_prefix, do: @sid_prefix
end
