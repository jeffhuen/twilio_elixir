# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Chat.V1.Credential do
  @moduledoc """
  Credentials for push notifications channels

  SID prefix: `CR`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/api/rest/account) that created the Credential resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [RFC 2822](http://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [RFC 2822](http://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `friendly_name` | The string that you assigned to describe the resource.. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `sandbox` | [APN only] Whether to send the credential to sandbox APNs. Can be `true` to send to sandbox APNs or `false` to send to production. |
  | `sid` | The unique string that we created to identify the Credential resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
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

  @object_name "chat.v1.credential"
  def object_name, do: @object_name

  @sid_prefix "CR"
  def sid_prefix, do: @sid_prefix
end
