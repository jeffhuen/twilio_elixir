# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Taskrouter.V1.Workspace.Worker.ReservationService do
  @moduledoc """
  Current and past reservations for a worker

  Operations: `list`, `fetch`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListWorkerReservation` | Tags: TaskrouterV1WorkerReservation

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `ReservationStatus` | string | Returns the list of reservations for a worker with a specified ReservationStatus. Can be: `pending`, `accepted`, `rejected`, `timeout`, `canceled`, or `rescinded`. |
  """
  @spec list(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, workspace_sid, worker_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/v1/Workspaces/#{workspace_sid}/Workers/#{worker_sid}/Reservations",
           params: params,
           opts: opts,
           base_url: "https://taskrouter.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "reservations")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Taskrouter.V1.Workspace.Worker.Reservation
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream:  (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, workspace_sid, worker_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, workspace_sid, worker_sid, Map.merge(params, page_opts), opts)
      end,
      "reservations"
    )
  end

  @doc """


  Operation: `FetchWorkerReservation` | Tags: TaskrouterV1WorkerReservation
  """
  @spec fetch(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Taskrouter.V1.Workspace.Worker.Reservation.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, workspace_sid, worker_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/Workspaces/#{workspace_sid}/Workers/#{worker_sid}/Reservations/#{sid}",
             opts: opts,
             base_url: "https://taskrouter.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Taskrouter.V1.Workspace.Worker.Reservation)}
    end
  end

  @doc """


  Operation: `UpdateWorkerReservation` | Tags: TaskrouterV1WorkerReservation

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Beep` | string | Whether to play a notification beep when the participant joins or when to play a beep. Can be: `true`, `false`, `onEnter`, or `onExit`. The default value is `true`. |
  | `BeepOnCustomerEntrance` | boolean | Whether to play a notification beep when the customer joins. |
  | `CallAccept` | boolean | Whether to accept a reservation when executing a Call instruction. |
  | `CallFrom` | string | The Caller ID of the outbound call when executing a Call instruction. |
  | `CallRecord` | string | Whether to record both legs of a call when executing a Call instruction. |
  | `CallStatusCallbackUrl` | string (uri) | The URL to call for the completed call event when executing a Call instruction. |
  | `CallTimeout` | integer | The timeout for a call when executing a Call instruction. |
  | `CallTo` | string | The contact URI of the worker when executing a Call instruction. Can be the URI of the Twilio Client, the SIP URI for Programmable SIP, or the [E.164](https://www.twilio.com/docs/glossary/what-e164) formatted phone number, depending on the destination. |
  | `CallUrl` | string (uri) | TwiML URI executed on answering the worker's leg as a result of the Call instruction. |
  | `ConferenceRecord` | string | Whether to record the conference the participant is joining or when to record the conference. Can be: `true`, `false`, `record-from-start`, and `do-not-record`. The default value is `false`. |
  | `ConferenceRecordingStatusCallback` | string (uri) | The URL we should call using the `conference_recording_status_callback_method` when the conference recording is available. |
  | `ConferenceRecordingStatusCallbackMethod` | string (http-method) | The HTTP method we should use to call `conference_recording_status_callback`. Can be: `GET` or `POST` and defaults to `POST`. Values: `GET`, `POST` |
  | `ConferenceStatusCallback` | string (uri) | The URL we should call using the `conference_status_callback_method` when the conference events in `conference_status_callback_event` occur. Only the value set by the first participant to join the conference is used. Subsequent `conference_status_callback` values are ignored. |
  | `ConferenceStatusCallbackEvent` | array | The conference status events that we will send to `conference_status_callback`. Can be: `start`, `end`, `join`, `leave`, `mute`, `hold`, `speaker`. |
  | `ConferenceStatusCallbackMethod` | string (http-method) | The HTTP method we should use to call `conference_status_callback`. Can be: `GET` or `POST` and defaults to `POST`. Values: `GET`, `POST` |
  | `ConferenceTrim` | string | Whether to trim leading and trailing silence from your recorded conference audio files. Can be: `trim-silence` or `do-not-trim` and defaults to `trim-silence`. |
  | `DequeueFrom` | string | The caller ID of the call to the worker when executing a Dequeue instruction. |
  | `DequeuePostWorkActivitySid` | string | The SID of the Activity resource to start after executing a Dequeue instruction. |
  | `DequeueRecord` | string | Whether to record both legs of a call when executing a Dequeue instruction or which leg to record. |
  | `DequeueStatusCallbackEvent` | array | The call progress events sent via webhooks as a result of a Dequeue instruction. |
  | `DequeueStatusCallbackUrl` | string (uri) | The callback URL for completed call event when executing a Dequeue instruction. |
  | `DequeueTimeout` | integer | The timeout for call when executing a Dequeue instruction. |
  | `DequeueTo` | string | The contact URI of the worker when executing a Dequeue instruction. Can be the URI of the Twilio Client, the SIP URI for Programmable SIP, or the [E.164](https://www.twilio.com/docs/glossary/what-e164) formatted phone number, depending on the destination. |
  | `EarlyMedia` | boolean | Whether to allow an agent to hear the state of the outbound call, including ringing or disconnect messages. The default is `true`. |
  | `EndConferenceOnCustomerExit` | boolean | Whether to end the conference when the customer leaves. |
  | `EndConferenceOnExit` | boolean | Whether to end the conference when the agent leaves. |
  | `From` | string | The caller ID of the call to the worker when executing a Conference instruction. |
  | `Instruction` | string | The assignment instruction for the reservation. |
  | `JitterBufferSize` | string | The jitter buffer size for conference. Can be: `small`, `medium`, `large`, `off`. |
  | `MaxParticipants` | integer | The maximum number of participants allowed in the conference. Can be a positive integer from `2` to `250`. The default value is `250`. |
  | `Muted` | boolean | Whether the agent is muted in the conference. Defaults to `false`. |
  | `PostWorkActivitySid` | string | The new worker activity SID after executing a Conference instruction. |
  | `Record` | boolean | Whether to record the participant and their conferences, including the time between conferences. Can be `true` or `false` and the default is `false`. |
  | `RecordingChannels` | string | The recording channels for the final recording. Can be: `mono` or `dual` and the default is `mono`. |
  | `RecordingStatusCallback` | string (uri) | The URL that we should call using the `recording_status_callback_method` when the recording status changes. |
  | `RecordingStatusCallbackMethod` | string (http-method) | The HTTP method we should use when we call `recording_status_callback`. Can be: `GET` or `POST` and defaults to `POST`. Values: `GET`, `POST` |
  | `RedirectAccept` | boolean | Whether the reservation should be accepted when executing a Redirect instruction. |
  | `RedirectCallSid` | string | The Call SID of the call parked in the queue when executing a Redirect instruction. |
  | `RedirectUrl` | string (uri) | TwiML URI to redirect the call to when executing the Redirect instruction. |
  | `Region` | string | The [region](https://support.twilio.com/hc/en-us/articles/223132167-How-global-low-latency-routing-and-region-selection-work-for-conferences-and-Client-calls) where we should mix the recorded audio. Can be:`us1`, `us2`, `ie1`, `de1`, `sg1`, `br1`, `au1`, or `jp1`. |
  | `ReservationStatus` | string |  Values: `pending`, `accepted`, `rejected`, `timeout`, `canceled`, `rescinded`, `wrapping`, `completed` |
  | `SipAuthPassword` | string | The SIP password for authentication. |
  | `SipAuthUsername` | string | The SIP username used for authentication. |
  | `StartConferenceOnEnter` | boolean | Whether to start the conference when the participant joins, if it has not already started. Can be: `true` or `false` and the default is `true`. If `false` and the conference has not started, the participant is muted and hears background music until another participant starts the conference. |
  | `StatusCallback` | string (uri) | The URL we should call using the `status_callback_method` to send status information to your application. |
  | `StatusCallbackEvent` | array | The call progress events that we will send to `status_callback`. Can be: `initiated`, `ringing`, `answered`, or `completed`. |
  | `StatusCallbackMethod` | string (http-method) | The HTTP method we should use to call `status_callback`. Can be: `POST` or `GET` and the default is `POST`. Values: `GET`, `POST` |
  | `Timeout` | integer | The timeout for a call when executing a Conference instruction. |
  | `To` | string | The Contact URI of the worker when executing a Conference instruction. Can be the URI of the Twilio Client, the SIP URI for Programmable SIP, or the [E.164](https://www.twilio.com/docs/glossary/what-e164) formatted phone number, depending on the destination. |
  | `WaitMethod` | string (http-method) | The HTTP method we should use to call `wait_url`. Can be `GET` or `POST` and the default is `POST`. When using a static audio file, this should be `GET` so that we can cache the file. Values: `GET`, `POST` |
  | `WaitUrl` | string (uri) | The URL we should call using the `wait_method` for the music to play while participants are waiting for the conference to start. The default value is the URL of our standard hold music. [Learn more about hold music](https://www.twilio.com/labs/twimlets/holdmusic). |
  | `WorkerActivitySid` | string | The new worker activity SID if rejecting a reservation. |
  """
  @spec update(Client.t(), String.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Taskrouter.V1.Workspace.Worker.Reservation.t()}
          | {:error, Twilio.Error.t()}
  def update(client, workspace_sid, worker_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/Workspaces/#{workspace_sid}/Workers/#{worker_sid}/Reservations/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://taskrouter.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Taskrouter.V1.Workspace.Worker.Reservation)}
    end
  end
end
