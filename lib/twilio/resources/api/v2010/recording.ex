# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Api.V2010.Recording do
  @moduledoc """
  Recordings of phone calls

  SID prefix: `RE`

  Parent: `/Accounts/{Sid}.json`

  ## Sub-resources
  - `add_on_results` — `/2010-04-01/Accounts/{account_sid}/Recordings/{reference_sid}/AddOnResults.json`
  - `transcriptions` — `/2010-04-01/Accounts/{account_sid}/Recordings/{recording_sid}/Transcriptions.json`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Recording resource. |
  | `api_version` | The API version used during the recording. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `call_sid` | The SID of the [Call](https://www.twilio.com/docs/voice/api/call-resource) the Recording resource is associated with. This will always refer to the parent leg of a two-leg call. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `channels` | The number of channels in the recording resource. For information on specifying the number of channels in the downloaded recording file, check out [Fetch a Recording’s media file](https://www.twilio.com/docs/voice/api/recording#download-dual-channel-media-file). |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `conference_sid` | The Conference SID that identifies the conference associated with the recording, if a conference recording. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  | `duration` | The length of the recording in seconds. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `encryption_details` | How to decrypt the recording if it was encrypted using [Call Recording Encryption](https://www.twilio.com/docs/voice/tutorials/voice-recording-encryption) feature. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `error_code` | The error code that describes why the recording is `absent`. The error code is described in our [Error Dictionary](https://www.twilio.com/docs/api/errors). This value is null if the recording `status` is not `absent`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `media_url` | The URL of the media file associated with this recording resource. When stored externally, this is the full URL location of the media file.. Format: uri |
  | `price` | The one-time cost of creating the recording in the `price_unit` currency. |
  | `price_unit` | The currency used in the `price` property. Example: `USD`. |
  | `sid` | The unique string that that we created to identify the Recording resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `source` | How the recording was created. Can be: `DialVerb`, `Conference`, `OutboundAPI`, `Trunking`, `RecordVerb`, `StartCallRecordingAPI`, and `StartConferenceRecordingAPI`.. Values: `DialVerb`, `Conference`, `OutboundAPI`, `Trunking`, `RecordVerb`, `StartCallRecordingAPI`, `StartConferenceRecordingAPI` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `start_time` | The start time of the recording in GMT and in [RFC 2822](https://www.php.net/manual/en/class.datetime.php#datetime.constants.rfc2822) format.. Format: date-time-rfc-2822 |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status` | The status of the recording. Can be: `processing`, `completed`, `absent` or `deleted`. For information about more detailed statuses on in-progress recordings, check out how to [Update a Recording Resource](https://www.twilio.com/docs/voice/api/recording#update-a-recording-resource).. Values: `in-progress`, `paused`, `stopped`, `processing`, `completed`, `absent`, `deleted` |
  | `subresource_uris` | A list of related resources identified by their relative URIs.. Format: uri-map |
  | `uri` | The URI of the resource, relative to `https://api.twilio.com`. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          api_version: String.t() | nil,
          call_sid: String.t() | nil,
          channels: integer() | nil,
          conference_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          duration: String.t() | nil,
          encryption_details: String.t() | nil,
          error_code: integer() | nil,
          media_url: String.t() | nil,
          price: String.t() | nil,
          price_unit: String.t() | nil,
          sid: String.t() | nil,
          source: String.t(),
          start_time: String.t() | nil,
          status: String.t(),
          subresource_uris: map() | nil,
          uri: String.t() | nil
        }

  defstruct [
    :account_sid,
    :api_version,
    :call_sid,
    :channels,
    :conference_sid,
    :date_created,
    :date_updated,
    :duration,
    :encryption_details,
    :error_code,
    :media_url,
    :price,
    :price_unit,
    :sid,
    :source,
    :start_time,
    :status,
    :subresource_uris,
    :uri
  ]

  @object_name "api.v2010.account.recording"
  def object_name, do: @object_name

  @sid_prefix "RE"
  def sid_prefix, do: @sid_prefix
end
