# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Api.V2010.Recording.AddOnResult do
  @moduledoc """
  The results of an Add-on API call

  SID prefix: `XR`

  Parent: `/Accounts/{AccountSid}/Recordings/{Sid}.json`

  ## Sub-resources
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  - `payloads` — `/2010-04-01/Accounts/{account_sid}/Recordings/{reference_sid}/AddOnResults/{add_on_result_sid}/Payloads.json`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Recording AddOnResult resource. |
  | `add_on_configuration_sid` | The SID of the Add-on configuration. |
  | `add_on_sid` | The SID of the Add-on to which the result belongs. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_completed` | The date and time in GMT that the result was completed specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  | `reference_sid` | The SID of the recording to which the AddOnResult resource belongs. |
  | `sid` | The unique string that that we created to identify the Recording AddOnResult resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status` | The status of the result. Can be: `canceled`, `completed`, `deleted`, `failed`, `in-progress`, `init`, `processing`, `queued`.. Values: `canceled`, `completed`, `deleted`, `failed`, `in-progress`, `init`, `processing`, `queued` |
  | `subresource_uris` | A list of related resources identified by their relative URIs.. Format: uri-map |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          add_on_configuration_sid: String.t() | nil,
          add_on_sid: String.t() | nil,
          date_completed: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          reference_sid: String.t() | nil,
          sid: String.t() | nil,
          status: String.t(),
          subresource_uris: map() | nil
        }

  defstruct [
    :account_sid,
    :add_on_configuration_sid,
    :add_on_sid,
    :date_completed,
    :date_created,
    :date_updated,
    :reference_sid,
    :sid,
    :status,
    :subresource_uris
  ]

  @object_name "api.v2010.account.recording.recording_add_on_result"
  def object_name, do: @object_name

  @sid_prefix "XR"
  def sid_prefix, do: @sid_prefix
end
