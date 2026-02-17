# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Conversations.V1.Credential do
  @moduledoc """
  A Credential resource represents a push notification credential.

  SID prefix: `CR`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The unique ID of the [Account](https://www.twilio.com/docs/iam/api/account) responsible for this credential. |
  | `date_created` | The date that this resource was created.. Format: date-time |
  | `date_updated` | The date that this resource was last updated.. Format: date-time |
  | `friendly_name` | The human-readable name of this credential, limited to 64 characters. Optional.. PII: standard |
  | `sandbox` | [APN only] Whether to send the credential to sandbox APNs. Can be `true` to send to sandbox APNs or `false` to send to production. |
  | `sid` | A 34 character string that uniquely identifies this resource. |
  | `type` | The type of push-notification service the credential is for. Can be: `fcm`, `gcm`, or `apn`.. Values: `apn`, `gcm`, `fcm` |
  | `url` | An absolute API resource URL for this credential.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          sandbox: String.t() | nil,
          sid: String.t() | nil,
          type: String.t(),
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :date_created,
    :date_updated,
    :friendly_name,
    :sandbox,
    :sid,
    :type,
    :url
  ]

  @object_name "conversations.v1.credential"
  def object_name, do: @object_name

  @sid_prefix "CR"
  def sid_prefix, do: @sid_prefix
end
