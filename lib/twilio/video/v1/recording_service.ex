# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Video.V1.RecordingService do
  @moduledoc """
  Single-track, single-media recordings

  Operations: `list`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  List of all Track recordings.

  Operation: `ListRecording` | Tags: VideoV1Recording

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Status` | string | Read only the recordings that have this status. Can be: `processing`, `completed`, or `deleted`. |
  | `SourceSid` | string | Read only the recordings that have this `source_sid`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `GroupingSid` | array | Read only recordings with this `grouping_sid`, which may include a `participant_sid` and/or a `room_sid`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `DateCreatedAfter` | string (date-time) | Read only recordings that started on or after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date-time with time zone. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `DateCreatedBefore` | string (date-time) | Read only recordings that started before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date-time with time zone, given as `YYYY-MM-DDThh:mm:ss+\|-hh:mm` or `YYYY-MM-DDThh:mm:ssZ`. |
  | `MediaType` | string | Read only recordings that have this media type. Can be either `audio` or `video`. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Recordings",
           params: params,
           opts: opts,
           base_url: "https://video.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "recordings")

        {:ok,
         %{
           page
           | items: Deserializer.deserialize_list(page.items, Twilio.Resources.Video.V1.Recording)
         }}

      error ->
        error
    end
  end

  @doc "Stream: List of all Track recordings. (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "recordings"
    )
  end

  @doc """
  Returns a single Recording resource identified by a Recording SID.

  Operation: `FetchRecording` | Tags: VideoV1Recording
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Video.V1.Recording.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Recordings/#{sid}",
             opts: opts,
             base_url: "https://video.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Video.V1.Recording)}
    end
  end

  @doc """
  Delete a Recording resource identified by a Recording SID.

  Operation: `DeleteRecording` | Tags: VideoV1Recording
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Recordings/#{sid}",
      opts: opts,
      base_url: "https://video.twilio.com"
    )
  end
end
