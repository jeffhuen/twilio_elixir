# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Api.V2010.Call.RecordingService do
  @moduledoc """
  A Recording resource represents the recording associated with a voice call, conference, or SIP Trunk.

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of recordings belonging to the call used to make the request

  Operation: `ListCallRecording` | Tags: Api20100401CallRecording

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `DateCreated` | string (date) | The `date_created` value, specified as `YYYY-MM-DD`, of the resources to read. You can also specify inequality: `DateCreated<=YYYY-MM-DD` will return recordings generated at or before midnight on a given date, and `DateCreated>=YYYY-MM-DD` returns recordings generated at or after midnight on a date. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `DateCreated<` | string (date) | The `date_created` value, specified as `YYYY-MM-DD`, of the resources to read. You can also specify inequality: `DateCreated<=YYYY-MM-DD` will return recordings generated at or before midnight on a given date, and `DateCreated>=YYYY-MM-DD` returns recordings generated at or after midnight on a date. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `DateCreated>` | string (date) | The `date_created` value, specified as `YYYY-MM-DD`, of the resources to read. You can also specify inequality: `DateCreated<=YYYY-MM-DD` will return recordings generated at or before midnight on a given date, and `DateCreated>=YYYY-MM-DD` returns recordings generated at or after midnight on a date. |
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, call_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/2010-04-01/Accounts/#{client.account_sid}/Calls/#{call_sid}/Recordings.json",
           params: params,
           opts: opts,
           base_url: "https://api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "recordings")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Api.V2010.Call.Recording
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of recordings belonging to the call used to make the request (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, call_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, call_sid, Map.merge(params, page_opts), opts)
      end,
      "recordings"
    )
  end

  @doc """
  Create a recording for the call

  Operation: `CreateCallRecording` | Tags: Api20100401CallRecording

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `RecordingChannels` | string | The number of channels used in the recording. Can be: `mono` or `dual` and the default is `mono`. `mono` records all parties of the call into one channel. `dual` records each party of a 2-party call into separate channels. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `RecordingConfigurationId` | string | The identifier of the configuration to be used when creating and processing the recording |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `RecordingStatusCallback` | string (uri) | The URL we should call using the `recording_status_callback_method` on each recording event specified in  `recording_status_callback_event`. For more information, see [RecordingStatusCallback parameters](https://www.twilio.com/docs/voice/api/recording#recordingstatuscallback). |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `RecordingStatusCallbackEvent` | array | The recording status events on which we should call the `recording_status_callback` URL. Can be: `in-progress`, `completed` and `absent` and the default is `completed`. Separate multiple event values with a space. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `RecordingStatusCallbackMethod` | string (http-method) | The HTTP method we should use to call `recording_status_callback`. Can be: `GET` or `POST` and the default is `POST`. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `RecordingTrack` | string | The audio track to record for the call. Can be: `inbound`, `outbound` or `both`. The default is `both`. `inbound` records the audio that is received by Twilio. `outbound` records the audio that is generated from Twilio. `both` records the audio that is received and generated by Twilio. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Trim` | string | Whether to trim any leading and trailing silence in the recording. Can be: `trim-silence` or `do-not-trim` and the default is `do-not-trim`. `trim-silence` trims the silence from the beginning and end of the recording and `do-not-trim` does not. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Call.Recording.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, call_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/2010-04-01/Accounts/#{client.account_sid}/Calls/#{call_sid}/Recordings.json",
             params: params,
             opts: opts,
             base_url: "https://api.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Call.Recording)}
    end
  end

  @doc """
  Fetch an instance of a recording for a call

  Operation: `FetchCallRecording` | Tags: Api20100401CallRecording
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Call.Recording.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, call_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/2010-04-01/Accounts/#{client.account_sid}/Calls/#{call_sid}/Recordings/#{sid}.json",
             opts: opts,
             base_url: "https://api.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Call.Recording)}
    end
  end

  @doc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Changes the status of the recording to paused, stopped, or in-progress. Note: Pass `Twilio.CURRENT` instead of recording sid to reference current active recording.

  Operation: `UpdateCallRecording` | Tags: Api20100401CallRecording

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Status` | string |  Values: `in-progress`, `paused`, `stopped`, `processing`, `completed`, `absent` |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `PauseBehavior` | string | Whether to record during a pause. Can be: `skip` or `silence` and the default is `silence`. `skip` does not record during the pause period, while `silence` will replace the actual audio of the call with silence during the pause period. This parameter only applies when setting `status` is set to `paused`. |
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Call.Recording.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, call_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/2010-04-01/Accounts/#{client.account_sid}/Calls/#{call_sid}/Recordings/#{sid}.json",
             params: params,
             opts: opts,
             base_url: "https://api.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Call.Recording)}
    end
  end

  @doc """
  Delete a recording from your account

  Operation: `DeleteCallRecording` | Tags: Api20100401CallRecording
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, call_sid, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/2010-04-01/Accounts/#{client.account_sid}/Calls/#{call_sid}/Recordings/#{sid}.json",
      opts: opts,
      base_url: "https://api.twilio.com"
    )
  end
end
