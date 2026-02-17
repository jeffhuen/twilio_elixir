# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Api.V2010.Call.Stream do
  @moduledoc """
  The Stream resource allows you to create and stop uni-directional Media Streams

  SID prefix: `MZ`

  Parent: `/Accounts/{AccountSid}/Calls/{Sid}.json`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created this Stream resource. |
  | `call_sid` | The SID of the [Call](https://www.twilio.com/docs/voice/api/call-resource) the Stream resource is associated with. |
  | `date_updated` | The date and time in GMT that this resource was last updated, specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  | `name` | The user-specified name of this Stream, if one was given when the Stream was created. This can be used to stop the Stream. |
  | `sid` | The SID of the Stream resource. |
  | `status` | The status of the Stream. Possible values are `stopped` and `in-progress`.. Values: `in-progress`, `stopped` |
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

  @object_name "api.v2010.account.call.stream"
  def object_name, do: @object_name

  @sid_prefix "MZ"
  def sid_prefix, do: @sid_prefix
end
