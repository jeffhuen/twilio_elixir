# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Api.V2010.Conference do
  @moduledoc """
  Voice call conferences

  SID prefix: `CF`

  Parent: `/Accounts/{Sid}.json`

  ## Sub-resources
  - `participants` — `/2010-04-01/Accounts/{account_sid}/Conferences/{conference_sid}/Participants.json`
  - `recordings` — `/2010-04-01/Accounts/{account_sid}/Conferences/{conference_sid}/Recordings.json`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created this Conference resource. |
  | `api_version` | The API version used to create this conference. |
  | `call_sid_ending_conference` | The call SID that caused the conference to end. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in UTC that this resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in UTC that this resource was last updated, specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  | `friendly_name` | A string that you assigned to describe this conference room. Maximum length is 128 characters. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `reason_conference_ended` | The reason why a conference ended. When a conference is in progress, will be `null`. When conference is completed, can be: `conference-ended-via-api`, `participant-with-end-conference-on-exit-left`, `participant-with-end-conference-on-exit-kicked`, `last-participant-kicked`, or `last-participant-left`.. Values: `conference-ended-via-api`, `participant-with-end-conference-on-exit-left`, `participant-with-end-conference-on-exit-kicked`, `last-participant-kicked`, `last-participant-left` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `region` | A string that represents the Twilio Region where the conference audio was mixed. May be `us1`, `us2`, `ie1`,  `de1`, `sg1`, `br1`, `au1`, and `jp1`. Basic conference audio will always be mixed in `us1`. Global Conference audio will be mixed nearest to the majority of participants. |
  | `sid` | The unique, Twilio-provided string used to identify this Conference resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status` | The status of this conference. Can be: `init`, `in-progress`, or `completed`.. Values: `init`, `in-progress`, `completed` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `subresource_uris` | A list of related resources identified by their URIs relative to `https://api.twilio.com`.. Format: uri-map |
  | `uri` | The URI of this resource, relative to `https://api.twilio.com`. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          api_version: String.t() | nil,
          call_sid_ending_conference: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          reason_conference_ended: String.t(),
          region: String.t() | nil,
          sid: String.t() | nil,
          status: String.t(),
          subresource_uris: map() | nil,
          uri: String.t() | nil
        }

  defstruct [
    :account_sid,
    :api_version,
    :call_sid_ending_conference,
    :date_created,
    :date_updated,
    :friendly_name,
    :reason_conference_ended,
    :region,
    :sid,
    :status,
    :subresource_uris,
    :uri
  ]

  @object_name "api.v2010.account.conference"
  def object_name, do: @object_name

  @sid_prefix "CF"
  def sid_prefix, do: @sid_prefix
end
