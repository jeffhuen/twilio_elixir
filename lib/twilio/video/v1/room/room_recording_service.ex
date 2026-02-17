# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Video.V1.Room.RoomRecordingService do
  @moduledoc """
  Single-track, single-media room recordings

  Operations: `list`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListRoomRecording` | Tags: VideoV1RoomRecording

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Status` | string | Read only the recordings with this status. Can be: `processing`, `completed`, or `deleted`. |
  | `SourceSid` | string | Read only the recordings that have this `source_sid`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `DateCreatedAfter` | string (date-time) | Read only recordings that started on or after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) datetime with time zone. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `DateCreatedBefore` | string (date-time) | Read only Recordings that started before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) datetime with time zone. |
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, room_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Rooms/#{room_sid}/Recordings",
           params: params,
           opts: opts,
           base_url: "https://video.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "recordings")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Video.V1.Room.RoomRecording
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream:  (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, room_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, room_sid, Map.merge(params, page_opts), opts)
      end,
      "recordings"
    )
  end

  @doc """


  Operation: `FetchRoomRecording` | Tags: VideoV1RoomRecording
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Video.V1.Room.RoomRecording.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, room_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Rooms/#{room_sid}/Recordings/#{sid}",
             opts: opts,
             base_url: "https://video.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Video.V1.Room.RoomRecording)}
    end
  end

  @doc """


  Operation: `DeleteRoomRecording` | Tags: VideoV1RoomRecording
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, room_sid, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Rooms/#{room_sid}/Recordings/#{sid}",
      opts: opts,
      base_url: "https://video.twilio.com"
    )
  end
end
