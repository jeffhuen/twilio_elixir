# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Api.V2010.Conference.Recording do
  @moduledoc """
  Recordings of conferences

  SID prefix: `RE`

  Parent: `/Accounts/{AccountSid}/Conferences/{Sid}.json`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Conference Recording resource. |
  | `api_version` | The API version used to create the recording. |
  | `call_sid` | The SID of the [Call](https://www.twilio.com/docs/voice/api/call-resource) the Conference Recording resource is associated with. |
  | `channels` | The number of channels in the final recording file.  Can be: `1`, or `2`. Separating a two leg call into two separate channels of the recording file is supported in [Dial](https://www.twilio.com/docs/voice/twiml/dial#attributes-record) and [Outbound Rest API](https://www.twilio.com/docs/voice/make-calls) record options. |
  | `conference_sid` | The Conference SID that identifies the conference associated with the recording. |
  | `date_created` | The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  | `date_updated` | The date and time in GMT that the resource was last updated, specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  | `duration` | The length of the recording in seconds. |
  | `encryption_details` | How to decrypt the recording if it was encrypted using [Call Recording Encryption](https://www.twilio.com/docs/voice/tutorials/voice-recording-encryption) feature. |
  | `error_code` | The error code that describes why the recording is `absent`. The error code is described in our [Error Dictionary](https://www.twilio.com/docs/api/errors). This value is null if the recording `status` is not `absent`. |
  | `price` | The one-time cost of creating the recording in the `price_unit` currency. |
  | `price_unit` | The currency used in the `price` property. Example: `USD`.. Format: currency |
  | `sid` | The unique string that that we created to identify the Conference Recording resource. |
  | `source` | How the recording was created. Can be: `DialVerb`, `Conference`, `OutboundAPI`, `Trunking`, `RecordVerb`, `StartCallRecordingAPI`, `StartConferenceRecordingAPI`.. Values: `DialVerb`, `Conference`, `OutboundAPI`, `Trunking`, `RecordVerb`, `StartCallRecordingAPI`, `StartConferenceRecordingAPI` |
  | `start_time` | The start time of the recording in GMT and in [RFC 2822](https://www.php.net/manual/en/class.datetime.php#datetime.constants.rfc2822) format.. Format: date-time-rfc-2822 |
  | `status` | The status of the recording. Can be: `processing`, `completed` and `absent`. For more detailed statuses on in-progress recordings, check out how to [Update a Recording Resource](https://www.twilio.com/docs/voice/api/recording#update-a-recording-resource).. Values: `in-progress`, `paused`, `stopped`, `processing`, `completed`, `absent` |
  | `uri` | The URI of the resource, relative to `https://api.twilio.com`. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          api_version: String.t() | nil,
          call_sid: String.t() | nil,
          channels: integer(),
          conference_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          duration: String.t() | nil,
          encryption_details: String.t() | nil,
          error_code: integer() | nil,
          price: String.t() | nil,
          price_unit: String.t() | nil,
          sid: String.t() | nil,
          source: String.t(),
          start_time: String.t() | nil,
          status: String.t(),
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
    :price,
    :price_unit,
    :sid,
    :source,
    :start_time,
    :status,
    :uri
  ]

  @object_name "api.v2010.account.conference.conference_recording"
  def object_name, do: @object_name

  @sid_prefix "RE"
  def sid_prefix, do: @sid_prefix
end
