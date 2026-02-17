# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Intelligence.V2.Transcript do
  @moduledoc """


  SID prefix: `GT`

  ## Sub-resources
  - `encrypted_operator_results` — `/v2/Transcripts/{transcript_sid}/OperatorResults/Encrypted`
  - `encrypted_sentences` — `/v2/Transcripts/{transcript_sid}/Sentences/Encrypted`
  - `media` — `/v2/Transcripts/{sid}/Media`
  - `operator_results` — `/v2/Transcripts/{transcript_sid}/OperatorResults`
  - `sentences` — `/v2/Transcripts/{transcript_sid}/Sentences`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The unique SID identifier of the Account. |
  | `channel` | Media Channel describing Transcript Source and Participant Mapping |
  | `data_logging` | Data logging allows Twilio to improve the quality of the speech recognition & language understanding services through using customer data to refine, fine tune and evaluate machine learning models. Note: Data logging cannot be activated via API, only via www.twilio.com, as it requires additional consent. |
  | `date_created` | The date that this Transcript was created, given in ISO 8601 format.. Format: date-time |
  | `date_updated` | The date that this Transcript was updated, given in ISO 8601 format.. Format: date-time |
  | `duration` | The duration of this Transcript's source |
  | `encryption_credential_sid` | The unique SID identifier of the Public Key resource used to encrypt the sentences and operator results. |
  | `language_code` | The default language code of the audio. |
  | `links` | Format: uri-map |
  | `media_start_time` | The date that this Transcript's media was started, given in ISO 8601 format.. Format: date-time |
  | `redaction` | If the transcript has been redacted, a redacted alternative of the transcript will be available. |
  | `service_sid` | The unique SID identifier of the Service. |
  | `sid` | A 34 character string that uniquely identifies this Transcript. |
  | `status` | The Status of this Transcript. One of `queued`, `in-progress`, `completed`, `failed` or `canceled`.. Values: `queued`, `in-progress`, `completed`, `new`, `failed`, `canceled`, `error` |
  | `url` | The URL of this resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          channel: String.t() | nil,
          customer_key: String.t() | nil,
          data_logging: boolean() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          duration: integer(),
          encryption_credential_sid: String.t() | nil,
          language_code: String.t() | nil,
          links: map() | nil,
          media_start_time: String.t() | nil,
          redaction: boolean() | nil,
          service_sid: String.t() | nil,
          sid: String.t() | nil,
          status: String.t(),
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :channel,
    :customer_key,
    :data_logging,
    :date_created,
    :date_updated,
    :duration,
    :encryption_credential_sid,
    :language_code,
    :links,
    :media_start_time,
    :redaction,
    :service_sid,
    :sid,
    :status,
    :url
  ]

  @object_name "intelligence.v2.transcript"
  def object_name, do: @object_name

  @sid_prefix "GT"
  def sid_prefix, do: @sid_prefix
end
