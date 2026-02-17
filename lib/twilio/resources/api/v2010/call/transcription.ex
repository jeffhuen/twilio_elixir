# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Api.V2010.Call.Transcription do
  @moduledoc """
  Transcription resource.

  SID prefix: `GT`

  Parent: `/Accounts/{AccountSid}/Calls/{Sid}.json`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created this Transcription resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `call_sid` | The SID of the [Call](https://www.twilio.com/docs/voice/api/call-resource) the Transcription resource is associated with. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT that this resource was last updated, specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `name` | The user-specified name of this Transcription, if one was given when the Transcription was created. This may be used to stop the Transcription. |
  | `sid` | The SID of the Transcription resource. |
  | `status` | The status - one of `stopped`, `in-flight`. Values: `in-progress`, `stopped` |
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

  @object_name "api.v2010.account.call.realtime_transcription"
  def object_name, do: @object_name

  @sid_prefix "GT"
  def sid_prefix, do: @sid_prefix
end
