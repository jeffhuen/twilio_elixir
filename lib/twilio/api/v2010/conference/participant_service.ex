# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Api.V2010.Conference.ParticipantService do
  @moduledoc """
  Conference participants

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of participants belonging to the account used to make the request

  Operation: `ListParticipant` | Tags: Api20100401Participant

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Muted` | boolean | Whether to return only participants that are muted. Can be: `true` or `false`. |
  | `Hold` | boolean | Whether to return only participants that are on hold. Can be: `true` or `false`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Coaching` | boolean | Whether to return only participants who are coaching another call. Can be: `true` or `false`. |
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, conference_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/2010-04-01/Accounts/#{client.account_sid}/Conferences/#{conference_sid}/Participants.json",
           params: params,
           opts: opts,
           base_url: "https://api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "participants")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Api.V2010.Conference.Participant
               )
         }}

      error ->
        error
    end
  end

  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  @doc "Stream: Retrieve a list of participants belonging to the account used to make the request (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, conference_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, conference_sid, Map.merge(params, page_opts), opts)
      end,
      "participants"
    )
  end

  @doc """


  Operation: `CreateParticipant` | Tags: Api20100401Participant

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `From` | string (endpoint) | The phone number, Client identifier, or username portion of SIP address that made this call. Phone numbers are in [E.164](https://www.twilio.com/docs/glossary/what-e164) format (e.g., +16175551212). Client identifiers are formatted `client:name`. If using a phone number, it must be a Twilio number or a Verified [outgoing caller id](https://www.twilio.com/docs/voice/api/outgoing-caller-ids) for your account. If the `to` parameter is a phone number, `from` must also be a phone number. If `to` is sip address, this value of `from` should be a username portion to be used to populate the P-Asserted-Identity header that is passed to the SIP endpoint. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `To` | string (endpoint) | The phone number, SIP address, Client, TwiML App identifier that received this call. Phone numbers are in [E.164](https://www.twilio.com/docs/glossary/what-e164) format (e.g., +16175551212). SIP addresses are formatted as `sip:name@company.com`. Client identifiers are formatted `client:name`. TwiML App identifiers are formatted `app:<APP_SID>`. [Custom parameters](https://www.twilio.com/docs/voice/api/conference-participant-resource#custom-parameters) may also be specified. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `AmdStatusCallback` | string (uri) | The URL that we should call using the `amd_status_callback_method` to notify customer application whether the call was answered by human, machine or fax. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `AmdStatusCallbackMethod` | string (http-method) | The HTTP method we should use when calling the `amd_status_callback` URL. Can be: `GET` or `POST` and the default is `POST`. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Beep` | string | Whether to play a notification beep to the conference when the participant joins. Can be: `true`, `false`, `onEnter`, or `onExit`. The default value is `true`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Byoc` | string | The SID of a BYOC (Bring Your Own Carrier) trunk to route this call with. Note that `byoc` is only meaningful when `to` is a phone number; it will otherwise be ignored. (Beta) |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `CallReason` | string | The Reason for the outgoing call. Use it to specify the purpose of the call that is presented on the called party's phone. (Branded Calls Beta) |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `CallSidToCoach` | string | The SID of the participant who is being `coached`. The participant being coached is the only participant who can hear the participant who is `coaching`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `CallToken` | string | A token string needed to invoke a forwarded call. A call_token is generated when an incoming call is received on a Twilio number. Pass an incoming call's call_token value to a forwarded call via the call_token parameter when creating a new call. A forwarded call should bear the same CallerID of the original incoming call. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `CallerDisplayName` | string | The name that populates the display name in the From header. Must be between 2 and 255 characters. Only applicable for calls to sip address. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `CallerId` | string | The phone number, Client identifier, or username portion of SIP address that made this call. Phone numbers are in [E.164](https://www.twilio.com/docs/glossary/what-e164) format (e.g., +16175551212). Client identifiers are formatted `client:name`. If using a phone number, it must be a Twilio number or a Verified [outgoing caller id](https://www.twilio.com/docs/voice/api/outgoing-caller-ids) for your account. If the `to` parameter is a phone number, `callerId` must also be a phone number. If `to` is sip address, this value of `callerId` should be a username portion to be used to populate the From header that is passed to the SIP endpoint. |
  | `ClientNotificationUrl` | string (uri) | The URL that we should use to deliver `push call notification`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Coaching` | boolean | Whether the participant is coaching another call. Can be: `true` or `false`. If not present, defaults to `false` unless `call_sid_to_coach` is defined. If `true`, `call_sid_to_coach` must be defined. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ConferenceRecord` | string | Whether to record the conference the participant is joining. Can be: `true`, `false`, `record-from-start`, and `do-not-record`. The default value is `false`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ConferenceRecordingStatusCallback` | string (uri) | The URL we should call using the `conference_recording_status_callback_method` when the conference recording is available. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ConferenceRecordingStatusCallbackEvent` | array | The conference recording state changes that generate a call to `conference_recording_status_callback`. Can be: `in-progress`, `completed`, `failed`, and `absent`. Separate multiple values with a space, ex: `'in-progress completed failed'` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ConferenceRecordingStatusCallbackMethod` | string (http-method) | The HTTP method we should use to call `conference_recording_status_callback`. Can be: `GET` or `POST` and defaults to `POST`. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ConferenceStatusCallback` | string (uri) | The URL we should call using the `conference_status_callback_method` when the conference events in `conference_status_callback_event` occur. Only the value set by the first participant to join the conference is used. Subsequent `conference_status_callback` values are ignored. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ConferenceStatusCallbackEvent` | array | The conference state changes that should generate a call to `conference_status_callback`. Can be: `start`, `end`, `join`, `leave`, `mute`, `hold`, `modify`, `speaker`, and `announcement`. Separate multiple values with a space. Defaults to `start end`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ConferenceStatusCallbackMethod` | string (http-method) | The HTTP method we should use to call `conference_status_callback`. Can be: `GET` or `POST` and defaults to `POST`. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ConferenceTrim` | string | Whether to trim leading and trailing silence from the conference recording. Can be: `trim-silence` or `do-not-trim` and defaults to `trim-silence`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `EarlyMedia` | boolean | Whether to allow an agent to hear the state of the outbound call, including ringing or disconnect messages. Can be: `true` or `false` and defaults to `true`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `EndConferenceOnExit` | boolean | Whether to end the conference when the participant leaves. Can be: `true` or `false` and defaults to `false`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `JitterBufferSize` | string | Jitter buffer size for the connecting participant. Twilio will use this setting to apply Jitter Buffer before participant's audio is mixed into the conference. Can be: `off`, `small`, `medium`, and `large`. Default to `large`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Label` | string | A label for this participant. If one is supplied, it may subsequently be used to fetch, update or delete the participant. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `MachineDetection` | string | Whether to detect if a human, answering machine, or fax has picked up the call. Can be: `Enable` or `DetectMessageEnd`. Use `Enable` if you would like us to return `AnsweredBy` as soon as the called party is identified. Use `DetectMessageEnd`, if you would like to leave a message on an answering machine. For more information, see [Answering Machine Detection](https://www.twilio.com/docs/voice/answering-machine-detection). |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `MachineDetectionSilenceTimeout` | integer | The number of milliseconds of initial silence after which an `unknown` AnsweredBy result will be returned. Possible Values: 2000-10000. Default: 5000. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `MachineDetectionSpeechEndThreshold` | integer | The number of milliseconds of silence after speech activity at which point the speech activity is considered complete. Possible Values: 500-5000. Default: 1200. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `MachineDetectionSpeechThreshold` | integer | The number of milliseconds that is used as the measuring stick for the length of the speech activity, where durations lower than this value will be interpreted as a human and longer than this value as a machine. Possible Values: 1000-6000. Default: 2400. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `MachineDetectionTimeout` | integer | The number of seconds that we should attempt to detect an answering machine before timing out and sending a voice request with `AnsweredBy` of `unknown`. The default timeout is 30 seconds. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `MaxParticipants` | integer | The maximum number of participants in the conference. Can be a positive integer from `2` to `250`. The default value is `250`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Muted` | boolean | Whether the agent is muted in the conference. Can be `true` or `false` and the default is `false`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Record` | boolean | Whether to record the participant and their conferences, including the time between conferences. Can be `true` or `false` and the default is `false`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `RecordingChannels` | string | The recording channels for the final recording. Can be: `mono` or `dual` and the default is `mono`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `RecordingStatusCallback` | string (uri) | The URL that we should call using the `recording_status_callback_method` when the recording status changes. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `RecordingStatusCallbackEvent` | array | The recording state changes that should generate a call to `recording_status_callback`. Can be: `started`, `in-progress`, `paused`, `resumed`, `stopped`, `completed`, `failed`, and `absent`. Separate multiple values with a space, ex: `'in-progress completed failed'`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `RecordingStatusCallbackMethod` | string (http-method) | The HTTP method we should use when we call `recording_status_callback`. Can be: `GET` or `POST` and defaults to `POST`. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `RecordingTrack` | string | The audio track to record for the call. Can be: `inbound`, `outbound` or `both`. The default is `both`. `inbound` records the audio that is received by Twilio. `outbound` records the audio that is sent from Twilio. `both` records the audio that is received and sent by Twilio. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Region` | string | The [region](https://support.twilio.com/hc/en-us/articles/223132167-How-global-low-latency-routing-and-region-selection-work-for-conferences-and-Client-calls) where we should mix the recorded audio. Can be:`us1`, `us2`, `ie1`, `de1`, `sg1`, `br1`, `au1`, or `jp1`. |
  | `SipAuthPassword` | string | The SIP password for authentication. |
  | `SipAuthUsername` | string | The SIP username used for authentication. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `StartConferenceOnEnter` | boolean | Whether to start the conference when the participant joins, if it has not already started. Can be: `true` or `false` and the default is `true`. If `false` and the conference has not started, the participant is muted and hears background music until another participant starts the conference. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `StatusCallback` | string (uri) | The URL we should call using the `status_callback_method` to send status information to your application. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `StatusCallbackEvent` | array | The conference state changes that should generate a call to `status_callback`. Can be: `initiated`, `ringing`, `answered`, and `completed`. Separate multiple values with a space. The default value is `completed`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `StatusCallbackMethod` | string (http-method) | The HTTP method we should use to call `status_callback`. Can be: `GET` and `POST` and defaults to `POST`. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `TimeLimit` | integer | The maximum duration of the call in seconds. Constraints depend on account and configuration. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Timeout` | integer | The number of seconds that we should allow the phone to ring before assuming there is no answer. Can be an integer between `5` and `600`, inclusive. The default value is `60`. We always add a 5-second timeout buffer to outgoing calls, so  value of 10 would result in an actual timeout that was closer to 15 seconds. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Trim` | string | Whether to trim any leading and trailing silence from the participant recording. Can be: `trim-silence` or `do-not-trim` and the default is `trim-silence`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `WaitMethod` | string (http-method) | The HTTP method we should use to call `wait_url`. Can be `GET` or `POST` and the default is `POST`. When using a static audio file, this should be `GET` so that we can cache the file. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `WaitUrl` | string (uri) | The URL that Twilio calls using the `wait_method` before the conference has started. The URL may return an MP3 file, a WAV file, or a TwiML document. The default value is the URL of our standard hold music. If you do not want anything to play while waiting for the conference to start, specify an empty string by setting `wait_url` to `''`. For more details on the allowable verbs within the `waitUrl`, see the `waitUrl` attribute in the [<Conference> TwiML instruction](https://www.twilio.com/docs/voice/twiml/conference#attributes-waiturl). |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Conference.Participant.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, conference_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/2010-04-01/Accounts/#{client.account_sid}/Conferences/#{conference_sid}/Participants.json",
             params: params,
             opts: opts,
             base_url: "https://api.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Conference.Participant)}
    end
  end

  @doc """
  Fetch an instance of a participant

  Operation: `FetchParticipant` | Tags: Api20100401Participant
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Conference.Participant.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, conference_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/2010-04-01/Accounts/#{client.account_sid}/Conferences/#{conference_sid}/Participants/#{sid}.json",
             opts: opts,
             base_url: "https://api.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Conference.Participant)}
    end
  end

  @doc """
  Update the properties of the participant

  Operation: `UpdateParticipant` | Tags: Api20100401Participant

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `AnnounceMethod` | string (http-method) | The HTTP method we should use to call `announce_url`. Can be: `GET` or `POST` and defaults to `POST`. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `AnnounceUrl` | string (uri) | The URL we call using the `announce_method` for an announcement to the participant. The URL may return an MP3 file, a WAV file, or a TwiML document that contains `<Play>`, `<Say>`, `<Pause>`, or `<Redirect>` verbs. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `BeepOnExit` | boolean | Whether to play a notification beep to the conference when the participant exits. Can be: `true` or `false`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `CallSidToCoach` | string | The SID of the participant who is being `coached`. The participant being coached is the only participant who can hear the participant who is `coaching`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Coaching` | boolean | Whether the participant is coaching another call. Can be: `true` or `false`. If not present, defaults to `false` unless `call_sid_to_coach` is defined. If `true`, `call_sid_to_coach` must be defined. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `EndConferenceOnExit` | boolean | Whether to end the conference when the participant leaves. Can be: `true` or `false` and defaults to `false`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Hold` | boolean | Whether the participant should be on hold. Can be: `true` or `false`. `true` puts the participant on hold, and `false` lets them rejoin the conference. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `HoldMethod` | string (http-method) | The HTTP method we should use to call `hold_url`. Can be: `GET` or `POST` and the default is `GET`. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `HoldUrl` | string (uri) | The URL we call using the `hold_method` for music that plays when the participant is on hold. The URL may return an MP3 file, a WAV file, or a TwiML document that contains `<Play>`, `<Say>`, `<Pause>`, or `<Redirect>` verbs. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Muted` | boolean | Whether the participant should be muted. Can be `true` or `false`. `true` will mute the participant, and `false` will un-mute them. Anything value other than `true` or `false` is interpreted as `false`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `WaitMethod` | string (http-method) | The HTTP method we should use to call `wait_url`. Can be `GET` or `POST` and the default is `POST`. When using a static audio file, this should be `GET` so that we can cache the file. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `WaitUrl` | string (uri) | The URL that Twilio calls using the `wait_method` before the conference has started. The URL may return an MP3 file, a WAV file, or a TwiML document. The default value is the URL of our standard hold music. If you do not want anything to play while waiting for the conference to start, specify an empty string by setting `wait_url` to `''`. For more details on the allowable verbs within the `waitUrl`, see the `waitUrl` attribute in the [<Conference> TwiML instruction](https://www.twilio.com/docs/voice/twiml/conference#attributes-waiturl). |
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Conference.Participant.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, conference_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/2010-04-01/Accounts/#{client.account_sid}/Conferences/#{conference_sid}/Participants/#{sid}.json",
             params: params,
             opts: opts,
             base_url: "https://api.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Conference.Participant)}
    end
  end

  @doc """
  Kick a participant from a given conference

  Operation: `DeleteParticipant` | Tags: Api20100401Participant
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, conference_sid, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/2010-04-01/Accounts/#{client.account_sid}/Conferences/#{conference_sid}/Participants/#{sid}.json",
      opts: opts,
      base_url: "https://api.twilio.com"
    )
  end
end
