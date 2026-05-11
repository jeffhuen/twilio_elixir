# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Api.V2010.CallService do
  @moduledoc """
  A Call is an object that represents a connection between a telephone and Twilio.

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieves a collection of calls made to and from your account

  Operation: `ListCall` | Tags: Api20100401Call

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `To` | string (phone-number) | Only show calls made to this phone number, SIP address, Client identifier or SIM SID. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `From` | string (phone-number) | Only include calls from this phone number, SIP address, Client identifier or SIM SID. |
  | `ParentCallSid` | string | Only include calls spawned by calls with this SID. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Status` | string | The status of the calls to include. Can be: `queued`, `ringing`, `in-progress`, `canceled`, `completed`, `failed`, `busy`, or `no-answer`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `StartTime` | string (date-time) | Only include calls that started on this date. Specify a date as `YYYY-MM-DD` in UTC, for example: `2009-07-06`, to read only calls that started on this date. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `StartTime<` | string (date-time) | Only include calls that started before this date. Specify a date as `YYYY-MM-DD` in UTC, for example: `2009-07-06`, to read only calls that started before this date. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `StartTime>` | string (date-time) | Only include calls that started on or after this date. Specify a date as `YYYY-MM-DD` in UTC, for example: `2009-07-06`, to read only calls that started on or after this date. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `EndTime` | string (date-time) | Only include calls that ended on this date. Specify a date as `YYYY-MM-DD` in UTC, for example: `2009-07-06`, to read only calls that ended on this date. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `EndTime<` | string (date-time) | Only include calls that ended before this date. Specify a date as `YYYY-MM-DD` in UTC, for example: `2009-07-06`, to read only calls that ended before this date. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `EndTime>` | string (date-time) | Only include calls that ended on or after this date. Specify a date as `YYYY-MM-DD` in UTC, for example: `2009-07-06`, to read only calls that ended on or after this date. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/2010-04-01/Accounts/#{client.account_sid}/Calls.json",
           params: params,
           opts: opts,
           base_url: "https://api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "calls")

        {:ok,
         %{
           page
           | items: Deserializer.deserialize_list(page.items, Twilio.Resources.Api.V2010.Call)
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieves a collection of calls made to and from your account (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "calls"
    )
  end

  @doc """
  Create a new outgoing call to phones, SIP-enabled endpoints or Twilio Client connections

  Operation: `CreateCall` | Tags: Api20100401Call

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `From` | string (endpoint) | The phone number or client identifier to use as the caller id. If using a phone number, it must be a Twilio number or a Verified [outgoing caller id](https://www.twilio.com/docs/voice/api/outgoing-caller-ids) for your account. If the `to` parameter is a phone number, `From` must also be a phone number. |
  | `To` | string (endpoint) | The phone number, SIP address, or client identifier to call. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ApplicationSid` | string | The SID of the Application resource that will handle the call, if the call will be handled by an application. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `AsyncAmd` | string | Select whether to perform answering machine detection in the background. Default, blocks the execution of the call until Answering Machine Detection is completed. Can be: `true` or `false`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `AsyncAmdStatusCallback` | string (uri) | The URL that we should call using the `async_amd_status_callback_method` to notify customer application whether the call was answered by human, machine or fax. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `AsyncAmdStatusCallbackMethod` | string (http-method) | The HTTP method we should use when calling the `async_amd_status_callback` URL. Can be: `GET` or `POST` and the default is `POST`. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Byoc` | string | The SID of a BYOC (Bring Your Own Carrier) trunk to route this call with. Note that `byoc` is only meaningful when `to` is a phone number; it will otherwise be ignored. (Beta) |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `CallReason` | string | The Reason for the outgoing call. Use it to specify the purpose of the call that is presented on the called party's phone. (Branded Calls Beta) |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `CallToken` | string | A token string needed to invoke a forwarded call. A call_token is generated when an incoming call is received on a Twilio number. Pass an incoming call's call_token value to a forwarded call via the call_token parameter when creating a new call. A forwarded call should bear the same CallerID of the original incoming call. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `CallerId` | string | The phone number, SIP address, or Client identifier that made this call. Phone numbers are in [E.164 format](https://wwnw.twilio.com/docs/glossary/what-e164) (e.g., +16175551212). SIP addresses are formatted as `name@company.com`. |
  | `ClientNotificationUrl` | string (uri) | The URL that we should use to deliver `push call notification`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `FallbackMethod` | string (http-method) | The HTTP method that we should use to request the `fallback_url`. Can be: `GET` or `POST` and the default is `POST`. If an `application_sid` parameter is present, this parameter is ignored. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `FallbackUrl` | string (uri) | The URL that we call using the `fallback_method` if an error occurs when requesting or executing the TwiML at `url`. If an `application_sid` parameter is present, this parameter is ignored. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `MachineDetection` | string | Whether to detect if a human, answering machine, or fax has picked up the call. Can be: `Enable` or `DetectMessageEnd`. Use `Enable` if you would like us to return `AnsweredBy` as soon as the called party is identified. Use `DetectMessageEnd`, if you would like to leave a message on an answering machine. If `send_digits` is provided, this parameter is ignored. For more information, see [Answering Machine Detection](https://www.twilio.com/docs/voice/answering-machine-detection). |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `MachineDetectionSilenceTimeout` | integer | The number of milliseconds of initial silence after which an `unknown` AnsweredBy result will be returned. Possible Values: 2000-10000. Default: 5000. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `MachineDetectionSpeechEndThreshold` | integer | The number of milliseconds of silence after speech activity at which point the speech activity is considered complete. Possible Values: 500-5000. Default: 1200. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `MachineDetectionSpeechThreshold` | integer | The number of milliseconds that is used as the measuring stick for the length of the speech activity, where durations lower than this value will be interpreted as a human and longer than this value as a machine. Possible Values: 1000-6000. Default: 2400. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `MachineDetectionTimeout` | integer | The number of seconds that we should attempt to detect an answering machine before timing out and sending a voice request with `AnsweredBy` of `unknown`. The default timeout is 30 seconds. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Method` | string (http-method) | The HTTP method we should use when calling the `url` parameter's value. Can be: `GET` or `POST` and the default is `POST`. If an `application_sid` parameter is present, this parameter is ignored. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Record` | boolean | Whether to record the call. Can be `true` to record the phone call, or `false` to not. The default is `false`. The `recording_url` is sent to the `status_callback` URL. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `RecordingChannels` | string | The number of channels in the final recording. Can be: `mono` or `dual`. The default is `mono`. `mono` records both legs of the call in a single channel of the recording file. `dual` records each leg to a separate channel of the recording file. The first channel of a dual-channel recording contains the parent call and the second channel contains the child call. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `RecordingConfigurationId` | string | The identifier of the configuration to be used when creating and processing the recording |
  | `RecordingStatusCallback` | string | The URL that we call when the recording is available to be accessed. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `RecordingStatusCallbackEvent` | array | The recording status events that will trigger calls to the URL specified in `recording_status_callback`. Can be: `in-progress`, `completed` and `absent`. Defaults to `completed`. Separate  multiple values with a space. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `RecordingStatusCallbackMethod` | string (http-method) | The HTTP method we should use when calling the `recording_status_callback` URL. Can be: `GET` or `POST` and the default is `POST`. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `RecordingTrack` | string | The audio track to record for the call. Can be: `inbound`, `outbound` or `both`. The default is `both`. `inbound` records the audio that is received by Twilio. `outbound` records the audio that is generated from Twilio. `both` records the audio that is received and generated by Twilio. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `SendDigits` | string | The string of keys to dial after connecting to the number, with a maximum length of 32 digits. Valid digits in the string include any digit (`0`-`9`), '`A`', '`B`', '`C`', '`D`', '`#`', and '`*`'. You can also use '`w`' to insert a half-second pause and '`W`' to insert a one-second pause. For example, to pause for one second after connecting and then dial extension 1234 followed by the # key, set this parameter to `W1234#`. Be sure to URL-encode this string because the '`#`' character has special meaning in a URL. If both `SendDigits` and `MachineDetection` parameters are provided, then `MachineDetection` will be ignored. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `SipAuthPassword` | string | The password required to authenticate the user account specified in `sip_auth_username`. |
  | `SipAuthUsername` | string | The username used to authenticate the caller making a SIP call. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `StatusCallback` | string (uri) | The URL we should call using the `status_callback_method` to send status information to your application. If no `status_callback_event` is specified, we will send the `completed` status. If an `application_sid` parameter is present, this parameter is ignored. URLs must contain a valid hostname (underscores are not permitted). |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `StatusCallbackEvent` | array | The call progress events that we will send to the `status_callback` URL. Can be: `initiated`, `ringing`, `answered`, and `completed`. If no event is specified, we send the `completed` status. If you want to receive multiple events, specify each one in a separate `status_callback_event` parameter. See the code sample for [monitoring call progress](https://www.twilio.com/docs/voice/api/call-resource?code-sample=code-create-a-call-resource-and-specify-a-statuscallbackevent&code-sdk-version=json). If an `application_sid` is present, this parameter is ignored. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `StatusCallbackMethod` | string (http-method) | The HTTP method we should use when calling the `status_callback` URL. Can be: `GET` or `POST` and the default is `POST`. If an `application_sid` parameter is present, this parameter is ignored. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `TimeLimit` | integer | The maximum duration of the call in seconds. Constraints depend on account and configuration. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Timeout` | integer | The integer number of seconds that we should allow the phone to ring before assuming there is no answer. The default is `60` seconds and the maximum is `600` seconds. For some call flows, we will add a 5-second buffer to the timeout value you provide. For this reason, a timeout value of 10 seconds could result in an actual timeout closer to 15 seconds. You can set this to a short time, such as `15` seconds, to hang up before reaching an answering machine or voicemail. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Trim` | string | Whether to trim any leading and trailing silence from the recording. Can be: `trim-silence` or `do-not-trim` and the default is `trim-silence`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Twiml` | string (twiml) | TwiML instructions for the call Twilio will use without fetching Twiml from url parameter. If both `twiml` and `url` are provided then `twiml` parameter will be ignored. Max 4000 characters. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Url` | string (uri) | The absolute URL that returns the TwiML instructions for the call. We will call this URL using the `method` when the call connects. For more information, see the [Url Parameter](https://www.twilio.com/docs/voice/make-calls#specify-a-url-parameter) section in [Making Calls](https://www.twilio.com/docs/voice/make-calls). |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Call.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/2010-04-01/Accounts/#{client.account_sid}/Calls.json",
             params: params,
             opts: opts,
             base_url: "https://api.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Call)}
    end
  end

  @doc """
  Fetch the call specified by the provided Call SID

  Operation: `FetchCall` | Tags: Api20100401Call
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Call.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/2010-04-01/Accounts/#{client.account_sid}/Calls/#{sid}.json",
             opts: opts,
             base_url: "https://api.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Call)}
    end
  end

  @doc """
  Initiates a call redirect or terminates a call

  Operation: `UpdateCall` | Tags: Api20100401Call

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `FallbackMethod` | string (http-method) | The HTTP method that we should use to request the `fallback_url`. Can be: `GET` or `POST` and the default is `POST`. If an `application_sid` parameter is present, this parameter is ignored. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `FallbackUrl` | string (uri) | The URL that we call using the `fallback_method` if an error occurs when requesting or executing the TwiML at `url`. If an `application_sid` parameter is present, this parameter is ignored. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Method` | string (http-method) | The HTTP method we should use when calling the `url`. Can be: `GET` or `POST` and the default is `POST`. If an `application_sid` parameter is present, this parameter is ignored. Values: `GET`, `POST` |
  | `Status` | string |  Values: `canceled`, `completed` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `StatusCallback` | string (uri) | The URL we should call using the `status_callback_method` to send status information to your application. If no `status_callback_event` is specified, we will send the `completed` status. If an `application_sid` parameter is present, this parameter is ignored. URLs must contain a valid hostname (underscores are not permitted). |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `StatusCallbackMethod` | string (http-method) | The HTTP method we should use when requesting the `status_callback` URL. Can be: `GET` or `POST` and the default is `POST`. If an `application_sid` parameter is present, this parameter is ignored. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `TimeLimit` | integer | The maximum duration of the call in seconds. Constraints depend on account and configuration. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Twiml` | string (twiml) | TwiML instructions for the call Twilio will use without fetching Twiml from url. Twiml and url parameters are mutually exclusive |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Url` | string (uri) | The absolute URL that returns the TwiML instructions for the call. We will call this URL using the `method` when the call connects. For more information, see the [Url Parameter](https://www.twilio.com/docs/voice/make-calls#specify-a-url-parameter) section in [Making Calls](https://www.twilio.com/docs/voice/make-calls). |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Call.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/2010-04-01/Accounts/#{client.account_sid}/Calls/#{sid}.json",
             params: params,
             opts: opts,
             base_url: "https://api.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Call)}
    end
  end

  @doc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Delete a Call record from your account. Once the record is deleted, it will no longer appear in the API and Account Portal logs.

  Operation: `DeleteCall` | Tags: Api20100401Call
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/2010-04-01/Accounts/#{client.account_sid}/Calls/#{sid}.json",
      opts: opts,
      base_url: "https://api.twilio.com"
    )
  end
end
