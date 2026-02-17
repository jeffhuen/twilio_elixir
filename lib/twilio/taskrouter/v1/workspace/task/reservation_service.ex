# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Taskrouter.V1.Workspace.Task.ReservationService do
  @moduledoc """
  Tasks reserved for workers

  Operations: `list`, `fetch`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListTaskReservation` | Tags: TaskrouterV1TaskReservation

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ReservationStatus` | string | Returns the list of reservations for a task with a specified ReservationStatus.  Can be: `pending`, `accepted`, `rejected`, or `timeout`. |
  | `WorkerSid` | string | The SID of the reserved Worker resource to read. |
  """
  @spec list(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, workspace_sid, task_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/v1/Workspaces/#{workspace_sid}/Tasks/#{task_sid}/Reservations",
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
                 Twilio.Resources.Taskrouter.V1.Workspace.Task.Reservation
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream:  (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, workspace_sid, task_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, workspace_sid, task_sid, Map.merge(params, page_opts), opts)
      end,
      "reservations"
    )
  end

  @doc """


  Operation: `FetchTaskReservation` | Tags: TaskrouterV1TaskReservation
  """
  @spec fetch(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Taskrouter.V1.Workspace.Task.Reservation.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, workspace_sid, task_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/Workspaces/#{workspace_sid}/Tasks/#{task_sid}/Reservations/#{sid}",
             opts: opts,
             base_url: "https://taskrouter.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Taskrouter.V1.Workspace.Task.Reservation)}
    end
  end

  @doc """


  Operation: `UpdateTaskReservation` | Tags: TaskrouterV1TaskReservation

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Beep` | string | Whether to play a notification beep when the participant joins or when to play a beep. Can be: `true`, `false`, `onEnter`, or `onExit`. The default value is `true`. |
  | `BeepOnCustomerEntrance` | boolean | Whether to play a notification beep when the customer joins. |
  | `CallAccept` | boolean | Whether to accept a reservation when executing a Call instruction. |
  | `CallFrom` | string | The Caller ID of the outbound call when executing a Call instruction. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `CallRecord` | string | Whether to record both legs of a call when executing a Call instruction or which leg to record. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `CallStatusCallbackUrl` | string (uri) | The URL to call  for the completed call event when executing a Call instruction. |
  | `CallTimeout` | integer | Timeout for call when executing a Call instruction. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `CallTo` | string | The Contact URI of the worker when executing a Call instruction.  Can be the URI of the Twilio Client, the SIP URI for Programmable SIP, or the [E.164](https://www.twilio.com/docs/glossary/what-e164) formatted phone number, depending on the destination. |
  | `CallUrl` | string (uri) | TwiML URI executed on answering the worker's leg as a result of the Call instruction. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ConferenceRecord` | string | Whether to record the conference the participant is joining or when to record the conference. Can be: `true`, `false`, `record-from-start`, and `do-not-record`. The default value is `false`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ConferenceRecordingStatusCallback` | string (uri) | The URL we should call using the `conference_recording_status_callback_method` when the conference recording is available. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ConferenceRecordingStatusCallbackMethod` | string (http-method) | The HTTP method we should use to call `conference_recording_status_callback`. Can be: `GET` or `POST` and defaults to `POST`. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ConferenceStatusCallback` | string (uri) | The URL we should call using the `conference_status_callback_method` when the conference events in `conference_status_callback_event` occur. Only the value set by the first participant to join the conference is used. Subsequent `conference_status_callback` values are ignored. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ConferenceStatusCallbackEvent` | array | The conference status events that we will send to `conference_status_callback`. Can be: `start`, `end`, `join`, `leave`, `mute`, `hold`, `speaker`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ConferenceStatusCallbackMethod` | string (http-method) | The HTTP method we should use to call `conference_status_callback`. Can be: `GET` or `POST` and defaults to `POST`. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ConferenceTrim` | string | How to trim the leading and trailing silence from your recorded conference audio files. Can be: `trim-silence` or `do-not-trim` and defaults to `trim-silence`. |
  | `DequeueFrom` | string | The Caller ID of the call to the worker when executing a Dequeue instruction. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `DequeuePostWorkActivitySid` | string | The SID of the Activity resource to start after executing a Dequeue instruction. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `DequeueRecord` | string | Whether to record both legs of a call when executing a Dequeue instruction or which leg to record. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `DequeueStatusCallbackEvent` | array | The Call progress events sent via webhooks as a result of a Dequeue instruction. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `DequeueStatusCallbackUrl` | string (uri) | The Callback URL for completed call event when executing a Dequeue instruction. |
  | `DequeueTimeout` | integer | Timeout for call when executing a Dequeue instruction. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `DequeueTo` | string | The Contact URI of the worker when executing a Dequeue instruction. Can be the URI of the Twilio Client, the SIP URI for Programmable SIP, or the [E.164](https://www.twilio.com/docs/glossary/what-e164) formatted phone number, depending on the destination. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `EarlyMedia` | boolean | Whether to allow an agent to hear the state of the outbound call, including ringing or disconnect messages. The default is `true`. |
  | `EndConferenceOnCustomerExit` | boolean | Whether to end the conference when the customer leaves. |
  | `EndConferenceOnExit` | boolean | Whether to end the conference when the agent leaves. |
  | `From` | string | The Caller ID of the call to the worker when executing a Conference instruction. |
  | `Instruction` | string | The assignment instruction for reservation. |
  | `JitterBufferSize` | string | The jitter buffer size for conference. Can be: `small`, `medium`, `large`, `off`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `MaxParticipants` | integer | The maximum number of participants in the conference. Can be a positive integer from `2` to `250`. The default value is `250`. |
  | `Muted` | boolean | Whether the agent is muted in the conference. The default is `false`. |
  | `PostWorkActivitySid` | string | The new worker activity SID after executing a Conference instruction. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Record` | boolean | Whether to record the participant and their conferences, including the time between conferences. The default is `false`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `RecordingChannels` | string | The recording channels for the final recording. Can be: `mono` or `dual` and the default is `mono`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `RecordingStatusCallback` | string (uri) | The URL that we should call using the `recording_status_callback_method` when the recording status changes. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `RecordingStatusCallbackMethod` | string (http-method) | The HTTP method we should use when we call `recording_status_callback`. Can be: `GET` or `POST` and defaults to `POST`. Values: `GET`, `POST` |
  | `RedirectAccept` | boolean | Whether the reservation should be accepted when executing a Redirect instruction. |
  | `RedirectCallSid` | string | The Call SID of the call parked in the queue when executing a Redirect instruction. |
  | `RedirectUrl` | string (uri) | TwiML URI to redirect the call to when executing the Redirect instruction. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Region` | string | The [region](https://support.twilio.com/hc/en-us/articles/223132167-How-global-low-latency-routing-and-region-selection-work-for-conferences-and-Client-calls) where we should mix the recorded audio. Can be:`us1`, `us2`, `ie1`, `de1`, `sg1`, `br1`, `au1`, or `jp1`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ReservationStatus` | string |  Values: `pending`, `accepted`, `rejected`, `timeout`, `canceled`, `rescinded`, `wrapping`, `completed` |
  | `SipAuthPassword` | string | The SIP password for authentication. |
  | `SipAuthUsername` | string | The SIP username used for authentication. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `StartConferenceOnEnter` | boolean | Whether to start the conference when the participant joins, if it has not already started. The default is `true`. If `false` and the conference has not started, the participant is muted and hears background music until another participant starts the conference. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `StatusCallback` | string (uri) | The URL we should call using the `status_callback_method` to send status information to your application. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `StatusCallbackEvent` | array | The call progress events that we will send to `status_callback`. Can be: `initiated`, `ringing`, `answered`, or `completed`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `StatusCallbackMethod` | string (http-method) | The HTTP method we should use to call `status_callback`. Can be: `POST` or `GET` and the default is `POST`. Values: `GET`, `POST` |
  | `Supervisor` | string | The Supervisor SID/URI when executing the Supervise instruction. |
  | `SupervisorMode` | string |  Values: `monitor`, `whisper`, `barge` |
  | `Timeout` | integer | Timeout for call when executing a Conference instruction. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `To` | string | The Contact URI of the worker when executing a Conference instruction. Can be the URI of the Twilio Client, the SIP URI for Programmable SIP, or the [E.164](https://www.twilio.com/docs/glossary/what-e164) formatted phone number, depending on the destination. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `WaitMethod` | string (http-method) | The HTTP method we should use to call `wait_url`. Can be `GET` or `POST` and the default is `POST`. When using a static audio file, this should be `GET` so that we can cache the file. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `WaitUrl` | string (uri) | The URL we should call using the `wait_method` for the music to play while participants are waiting for the conference to start. The default value is the URL of our standard hold music. [Learn more about hold music](https://www.twilio.com/labs/twimlets/holdmusic). |
  | `WorkerActivitySid` | string | The new worker activity SID if rejecting a reservation. |
  """
  @spec update(Client.t(), String.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Taskrouter.V1.Workspace.Task.Reservation.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, workspace_sid, task_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/Workspaces/#{workspace_sid}/Tasks/#{task_sid}/Reservations/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://taskrouter.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Taskrouter.V1.Workspace.Task.Reservation)}
    end
  end
end
