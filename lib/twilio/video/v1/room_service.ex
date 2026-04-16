# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Video.V1.RoomService do
  @moduledoc """
  Video rooms with one or more participants

  Operations: `list`, `create`, `fetch`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListRoom` | Tags: VideoV1Room

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Status` | string | Read only the rooms with this status. Can be: `in-progress` (default) or `completed` |
  | `UniqueName` | string | Read only rooms with the this `unique_name`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `DateCreatedAfter` | string (date-time) | Read only rooms that started on or after this date, given as `YYYY-MM-DD`. |
  | `DateCreatedBefore` | string (date-time) | Read only rooms that started before this date, given as `YYYY-MM-DD`. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Rooms",
           params: params,
           opts: opts,
           base_url: "https://video.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "rooms")

        {:ok,
         %{
           page
           | items: Deserializer.deserialize_list(page.items, Twilio.Resources.Video.V1.Room)
         }}

      error ->
        error
    end
  end

  @doc "Stream:  (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "rooms"
    )
  end

  @doc """


  Operation: `CreateRoom` | Tags: VideoV1Room

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `AudioOnly` | boolean | When set to true, indicates that the participants in the room will only publish audio. No video tracks will be allowed. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `EmptyRoomTimeout` | integer | Configures how long (in minutes) a room will remain active after last participant leaves. Valid values range from 1 to 60 minutes (no fractions). |
  | `EnableTurn` | boolean | Deprecated, now always considered to be true. |
  | `LargeRoom` | boolean | When set to true, indicated that this is the large room. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `MaxParticipantDuration` | integer | The maximum number of seconds a Participant can be connected to the room. The maximum possible value is 86400 seconds (24 hours). The default is 14400 seconds (4 hours). |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `MaxParticipants` | integer | The maximum number of concurrent Participants allowed in the room. The maximum allowed value is 50. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `MediaRegion` | string | The region for the Room's media server.  Can be one of the [available Media Regions](https://www.twilio.com/docs/video/ip-addresses#group-rooms-media-servers). |
  | `RecordParticipantsOnConnect` | boolean | Whether to start recording when Participants connect. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `RecordingRules` | string | A collection of Recording Rules that describe how to include or exclude matching tracks for recording |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `StatusCallback` | string (uri) | The URL Twilio should call using the `status_callback_method` to send status information to your application on every room event. See [Status Callbacks](https://www.twilio.com/docs/video/api/status-callbacks) for more info. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `StatusCallbackMethod` | string (http-method) | The HTTP method Twilio should use to call `status_callback`. Can be `POST` or `GET`. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `TranscribeParticipantsOnConnect` | boolean | Whether to start transcriptions when Participants connect. If TranscriptionsConfiguration is not provided, default settings will be used. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `TranscriptionsConfiguration` | object | A collection of properties that describe transcription behaviour. If TranscribeParticipantsOnConnect is set to true and TranscriptionsConfiguration is not provided, default settings will be used. |
  | `Type` | string |  Values: `group`, `go`, `peer-to-peer`, `group-small` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `UniqueName` | string | An application-defined string that uniquely identifies the resource. It can be used as a `room_sid` in place of the resource's `sid` in the URL to address the resource, assuming it does not contain any [reserved characters](https://tools.ietf.org/html/rfc3986#section-2.2) that would need to be URL encoded. This value is unique for `in-progress` rooms. SDK clients can use this name to connect to the room. REST API clients can use this name in place of the Room SID to interact with the room as long as the room is `in-progress`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `UnusedRoomTimeout` | integer | Configures how long (in minutes) a room will remain active if no one joins. Valid values range from 1 to 60 minutes (no fractions). |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `VideoCodecs` | array | An array of the video codecs that are supported when publishing a track in the room.  Can be: `VP8` and `H264`. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Video.V1.Room.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Rooms",
             params: params,
             opts: opts,
             base_url: "https://video.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Video.V1.Room)}
    end
  end

  @doc """


  Operation: `FetchRoom` | Tags: VideoV1Room
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Video.V1.Room.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Rooms/#{sid}",
             opts: opts,
             base_url: "https://video.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Video.V1.Room)}
    end
  end

  @doc """


  Operation: `UpdateRoom` | Tags: VideoV1Room

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Status` | string |  Values: `in-progress`, `completed`, `failed` |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Video.V1.Room.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Rooms/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://video.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Video.V1.Room)}
    end
  end
end
