# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Api.V2010.Account do
  @moduledoc """
  Twilio accounts (aka Project) or subaccounts

  SID prefix: `AC`

  ## Sub-resources
  - `addresses` — `/2010-04-01/Accounts/{account_sid}/Addresses.json`
  - `applications` — `/2010-04-01/Accounts/{account_sid}/Applications.json`
  - `authorized_connect_apps` — `/2010-04-01/Accounts/{account_sid}/AuthorizedConnectApps.json`
  - `available_phone_numbers` — `/2010-04-01/Accounts/{account_sid}/AvailablePhoneNumbers.json`
  - `balance` — `/2010-04-01/Accounts/{account_sid}/Balance.json`
  - `calls` — `/2010-04-01/Accounts/{account_sid}/Calls.json`
  - `conferences` — `/2010-04-01/Accounts/{account_sid}/Conferences.json`
  - `connect_apps` — `/2010-04-01/Accounts/{account_sid}/ConnectApps.json`
  - `incoming_phone_numbers` — `/2010-04-01/Accounts/{account_sid}/IncomingPhoneNumbers.json`
  - `keys` — `/2010-04-01/Accounts/{account_sid}/Keys.json`
  - `messages` — `/2010-04-01/Accounts/{account_sid}/Messages.json`
  - `new_keys` — `/2010-04-01/Accounts/{account_sid}/Keys.json`
  - `new_signing_keys` — `/2010-04-01/Accounts/{account_sid}/SigningKeys.json`
  - `notifications` — `/2010-04-01/Accounts/{account_sid}/Notifications.json`
  - `outgoing_caller_ids` — `/2010-04-01/Accounts/{account_sid}/OutgoingCallerIds.json`
  - `queues` — `/2010-04-01/Accounts/{account_sid}/Queues.json`
  - `recordings` — `/2010-04-01/Accounts/{account_sid}/Recordings.json`
  - `short_codes` — `/2010-04-01/Accounts/{account_sid}/SMS/ShortCodes.json`
  - `signing_keys` — `/2010-04-01/Accounts/{account_sid}/SigningKeys.json`
  - `sip` — `/2010-04-01/Accounts/{account_sid}/SIP.json`
  - `sms` — `/2010-04-01/Accounts/{account_sid}/SMS.json`
  - `tokens` — `/2010-04-01/Accounts/{account_sid}/Tokens.json`
  - `transcriptions` — `/2010-04-01/Accounts/{account_sid}/Transcriptions.json`
  - `usage` — `/2010-04-01/Accounts/{account_sid}/Usage.json`
  - `validation_requests` — `/2010-04-01/Accounts/{account_sid}/OutgoingCallerIds.json`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `auth_token` | The authorization token for this account. This token should be kept a secret, so no sharing.. PII: sensitive |
  | `date_created` | The date that this account was created, in GMT in RFC 2822 format. Format: date-time-rfc-2822 |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date that this account was last updated, in GMT in RFC 2822 format.. Format: date-time-rfc-2822 |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `friendly_name` | A human readable description of this account, up to 64 characters long. By default the FriendlyName is your email address.. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `owner_account_sid` | The unique 34 character id that represents the parent of this account. The OwnerAccountSid of a parent account is it's own sid. |
  | `sid` | A 34 character string that uniquely identifies this resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status` | The status of this account. Usually `active`, but can be `suspended` or `closed`.. Values: `active`, `suspended`, `closed` |
  | `subresource_uris` | A Map of various subresources available for the given Account Instance. Format: uri-map |
  | `type` | The type of this account. Either `Trial` or `Full` if it's been upgraded. Values: `Trial`, `Full` |
  | `uri` | The URI for this resource, relative to `https://api.twilio.com` |
  """

  @type t :: %__MODULE__{
          auth_token: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          owner_account_sid: String.t() | nil,
          sid: String.t() | nil,
          status: String.t(),
          subresource_uris: map() | nil,
          type: String.t(),
          uri: String.t() | nil
        }

  defstruct [
    :auth_token,
    :date_created,
    :date_updated,
    :friendly_name,
    :owner_account_sid,
    :sid,
    :status,
    :subresource_uris,
    :type,
    :uri
  ]

  @object_name "api.v2010.account"
  def object_name, do: @object_name

  @sid_prefix "AC"
  def sid_prefix, do: @sid_prefix
end
