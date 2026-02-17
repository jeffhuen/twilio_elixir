# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Chat.V2.Credential do
  @moduledoc """
  Credentials for push notifications channels

  SID prefix: `CR`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Credential resource. |
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `friendly_name` | The string that you assigned to describe the resource.. PII: standard |
  | `sandbox` | [APN only] Whether to send the credential to sandbox APNs. Can be `true` to send to sandbox APNs or `false` to send to production. |
  | `sid` | The unique string that we created to identify the Credential resource. |
  | `type` | The type of push-notification service the credential is for. Can be: `gcm`, `fcm`, or `apn`.. Values: `gcm`, `apn`, `fcm` |
  | `url` | The absolute URL of the Credential resource.. Format: uri |
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

  @object_name "chat.v2.credential"
  def object_name, do: @object_name

  @sid_prefix "CR"
  def sid_prefix, do: @sid_prefix
end
