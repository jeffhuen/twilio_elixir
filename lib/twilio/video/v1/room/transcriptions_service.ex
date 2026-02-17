# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Video.V1.Room.TranscriptionsService do
  @moduledoc """
  transcriptions in video rooms

  Operations: `list`, `create`, `fetch`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListRoomTranscriptions` | Tags: VideoV1Transcriptions
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, room_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Rooms/#{room_sid}/Transcriptions",
           params: params,
           opts: opts,
           base_url: "https://video.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "transcriptions")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Video.V1.Room.Transcriptions
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
      "transcriptions"
    )
  end

  @doc """


  Operation: `CreateRoomTranscriptions` | Tags: VideoV1Transcriptions

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Configuration` | object | A collection of properties that describe transcription behaviour. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Video.V1.Room.Transcriptions.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, room_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Rooms/#{room_sid}/Transcriptions",
             params: params,
             opts: opts,
             base_url: "https://video.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Video.V1.Room.Transcriptions)}
    end
  end

  @doc """


  Operation: `FetchRoomTranscriptions` | Tags: VideoV1Transcriptions
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Video.V1.Room.Transcriptions.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, room_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Rooms/#{room_sid}/Transcriptions/#{sid}",
             opts: opts,
             base_url: "https://video.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Video.V1.Room.Transcriptions)}
    end
  end

  @doc """


  Operation: `UpdateRoomTranscriptions` | Tags: VideoV1Transcriptions

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Status` | string |  Values: `started`, `stopped`, `failed` |
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Video.V1.Room.Transcriptions.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, room_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Rooms/#{room_sid}/Transcriptions/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://video.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Video.V1.Room.Transcriptions)}
    end
  end
end
