# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Api.V2010.Recording.Transcription do
  @moduledoc """
  References to text transcriptions of call recordings

  SID prefix: `TR`

  Parent: `/Accounts/{AccountSid}/Recordings/{Sid}.json`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Transcription resource. |
  | `api_version` | The API version used to create the transcription. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  | `duration` | The duration of the transcribed audio in seconds. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `price` | The charge for the transcript in the currency associated with the account. This value is populated after the transcript is complete so it may not be available immediately. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `price_unit` | The currency in which `price` is measured, in [ISO 4127](https://www.iso.org/iso/home/standards/currency_codes.htm) format (e.g. `usd`, `eur`, `jpy`).. Format: currency |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `recording_sid` | The SID of the [Recording](https://www.twilio.com/docs/voice/api/recording) from which the transcription was created. |
  | `sid` | The unique string that that we created to identify the Transcription resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status` | The status of the transcription. Can be: `in-progress`, `completed`, `failed`.. Values: `in-progress`, `completed`, `failed` |
  | `transcription_text` | The text content of the transcription.. PII: sensitive |
  | `type` | The transcription type. |
  | `uri` | The URI of the resource, relative to `https://api.twilio.com`. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          api_version: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          duration: String.t() | nil,
          price: float() | nil,
          price_unit: String.t() | nil,
          recording_sid: String.t() | nil,
          sid: String.t() | nil,
          status: String.t(),
          transcription_text: String.t() | nil,
          type: String.t() | nil,
          uri: String.t() | nil
        }

  defstruct [
    :account_sid,
    :api_version,
    :date_created,
    :date_updated,
    :duration,
    :price,
    :price_unit,
    :recording_sid,
    :sid,
    :status,
    :transcription_text,
    :type,
    :uri
  ]

  @object_name "api.v2010.account.recording.recording_transcription"
  def object_name, do: @object_name

  @sid_prefix "TR"
  def sid_prefix, do: @sid_prefix
end
