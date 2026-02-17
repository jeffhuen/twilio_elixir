# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Api.V2010.Recording.AddOnResult.Payload do
  @moduledoc """
  A single Add-on results' payload

  SID prefix: `XH`

  Parent: `/Accounts/{AccountSid}/Recordings/{ReferenceSid}/AddOnResults/{Sid}.json`

  ## Sub-resources
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  - `data` — `/2010-04-01/Accounts/{account_sid}/Recordings/{reference_sid}/AddOnResults/{add_on_result_sid}/Payloads/{payload_sid}/Data.json`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Recording AddOnResult Payload resource. |
  | `add_on_configuration_sid` | The SID of the Add-on configuration. |
  | `add_on_result_sid` | The SID of the AddOnResult to which the payload belongs. |
  | `add_on_sid` | The SID of the Add-on to which the result belongs. |
  | `content_type` | The MIME type of the payload. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  | `label` | The string provided by the vendor that describes the payload. |
  | `reference_sid` | The SID of the recording to which the AddOnResult resource that contains the payload belongs. |
  | `sid` | The unique string that that we created to identify the Recording AddOnResult Payload resource. |
  | `subresource_uris` | A list of related resources identified by their relative URIs.. Format: uri-map |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          add_on_configuration_sid: String.t() | nil,
          add_on_result_sid: String.t() | nil,
          add_on_sid: String.t() | nil,
          content_type: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          label: String.t() | nil,
          reference_sid: String.t() | nil,
          sid: String.t() | nil,
          subresource_uris: map() | nil
        }

  defstruct [
    :account_sid,
    :add_on_configuration_sid,
    :add_on_result_sid,
    :add_on_sid,
    :content_type,
    :date_created,
    :date_updated,
    :label,
    :reference_sid,
    :sid,
    :subresource_uris
  ]

  @object_name "api.v2010.account.recording.recording_add_on_result.recording_add_on_result_payload"
  def object_name, do: @object_name

  @sid_prefix "XH"
  def sid_prefix, do: @sid_prefix
end
