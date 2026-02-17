# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Api.V2010.Conference.Participant do
  @moduledoc """
  Conference participants

  Parent: `/Accounts/{AccountSid}/Conferences/{Sid}.json`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Participant resource. |
  | `call_sid` | The SID of the [Call](https://www.twilio.com/docs/voice/api/call-resource) the Participant resource is associated with. |
  | `call_sid_to_coach` | The SID of the participant who is being `coached`. The participant being coached is the only participant who can hear the participant who is `coaching`. |
  | `coaching` | Whether the participant is coaching another call. Can be: `true` or `false`. If not present, defaults to `false` unless `call_sid_to_coach` is defined. If `true`, `call_sid_to_coach` must be defined. |
  | `conference_sid` | The SID of the conference the participant is in. |
  | `date_created` | The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  | `date_updated` | The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  | `end_conference_on_exit` | Whether the conference ends when the participant leaves. Can be: `true` or `false` and the default is `false`. If `true`, the conference ends and all other participants drop out when the participant leaves. |
  | `hold` | Whether the participant is on hold. Can be `true` or `false`. |
  | `label` | The user-specified label of this participant, if one was given when the participant was created. This may be used to fetch, update or delete the participant. |
  | `muted` | Whether the participant is muted. Can be `true` or `false`. |
  | `queue_time` | The wait time in milliseconds before participant's call is placed. Only available in the response to a create participant request. |
  | `start_conference_on_enter` | Whether the conference starts when the participant joins the conference, if it has not already started. Can be: `true` or `false` and the default is `true`. If `false` and the conference has not started, the participant is muted and hears background music until another participant starts the conference. |
  | `status` | The status of the participant's call in a session. Can be: `queued`, `connecting`, `ringing`, `connected`, `complete`, or `failed`.. Values: `queued`, `connecting`, `ringing`, `connected`, `complete`, `failed` |
  | `uri` | The URI of the resource, relative to `https://api.twilio.com`. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          call_sid: String.t() | nil,
          call_sid_to_coach: String.t() | nil,
          coaching: boolean() | nil,
          conference_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          end_conference_on_exit: boolean() | nil,
          hold: boolean() | nil,
          label: String.t() | nil,
          muted: boolean() | nil,
          queue_time: String.t() | nil,
          start_conference_on_enter: boolean() | nil,
          status: String.t(),
          uri: String.t() | nil
        }

  defstruct [
    :account_sid,
    :call_sid,
    :call_sid_to_coach,
    :coaching,
    :conference_sid,
    :date_created,
    :date_updated,
    :end_conference_on_exit,
    :hold,
    :label,
    :muted,
    :queue_time,
    :start_conference_on_enter,
    :status,
    :uri
  ]

  @object_name "api.v2010.account.conference.participant"
  def object_name, do: @object_name
end
