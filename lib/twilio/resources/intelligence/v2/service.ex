# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Intelligence.V2.Service do
  @moduledoc """


  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The unique SID identifier of the Account the Service belongs to. |
  | `auto_redaction` | Instructs the Speech Recognition service to automatically redact PII from all transcripts made on this service. |
  | `auto_transcribe` | Instructs the Speech Recognition service to automatically transcribe all recordings made on the account. |
  | `data_logging` | Data logging allows Twilio to improve the quality of the speech recognition & language understanding services through using customer data to refine, fine tune and evaluate machine learning models. Note: Data logging cannot be activated via API, only via www.twilio.com, as it requires additional consent. |
  | `date_created` | The date that this Service was created, given in ISO 8601 format.. Format: date-time |
  | `date_updated` | The date that this Service was updated, given in ISO 8601 format.. Format: date-time |
  | `encryption_credential_sid` | The unique SID identifier of the Public Key resource used to encrypt the sentences and operator results. |
  | `friendly_name` | A human readable description of this resource, up to 64 characters. |
  | `language_code` | The language code set during Service creation determines the Transcription language for all call recordings processed by that Service. The default is en-US if no language code is set. A Service can only support one language code, and it cannot be updated once it's set. |
  | `media_redaction` | Instructs the Speech Recognition service to automatically redact PII from all transcripts media made on this service. The auto_redaction flag must be enabled, results in error otherwise. |
  | `read_only_attached_operator_sids` | Operator sids attached to this service, read only |
  | `sid` | A 34 character string that uniquely identifies this Service. |
  | `unique_name` | Provides a unique and addressable name to be assigned to this Service, assigned by the developer, to be optionally used in addition to SID. |
  | `url` | The URL of this resource.. Format: uri |
  | `version` | The version number of this Service. |
  | `webhook_http_method` | The HTTP method for the Webhook. One of `GET` or `POST`.. Values: `GET`, `POST`, `NULL` |
  | `webhook_url` | The URL Twilio will request when executing the Webhook. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          auto_redaction: boolean() | nil,
          auto_transcribe: boolean() | nil,
          data_logging: boolean() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          encryption_credential_sid: String.t() | nil,
          friendly_name: String.t() | nil,
          language_code: String.t() | nil,
          media_redaction: boolean() | nil,
          read_only_attached_operator_sids: list() | nil,
          sid: String.t() | nil,
          unique_name: String.t() | nil,
          url: String.t() | nil,
          version: integer(),
          webhook_http_method: String.t(),
          webhook_url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :auto_redaction,
    :auto_transcribe,
    :data_logging,
    :date_created,
    :date_updated,
    :encryption_credential_sid,
    :friendly_name,
    :language_code,
    :media_redaction,
    :read_only_attached_operator_sids,
    :sid,
    :unique_name,
    :url,
    :version,
    :webhook_http_method,
    :webhook_url
  ]

  @object_name "intelligence.v2.service"
  def object_name, do: @object_name
end
