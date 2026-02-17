# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Video.V1.Room.Participant.PublishedtrackService do
  @moduledoc """


  Operations: `list`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Returns a list of tracks associated with a given Participant. Only `currently` Published Tracks are in the list resource.

  Operation: `ListRoomParticipantPublishedTrack` | Tags: VideoV1PublishedTrack
  """
  @spec list(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, room_sid, participant_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/v1/Rooms/#{room_sid}/Participants/#{participant_sid}/PublishedTracks",
           params: params,
           opts: opts,
           base_url: "https://video.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "published_tracks")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Video.V1.Room.Participant.Publishedtrack
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Returns a list of tracks associated with a given Participant. Only `currently` Published Tracks are in the list resource. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, room_sid, participant_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, room_sid, participant_sid, Map.merge(params, page_opts), opts)
      end,
      "published_tracks"
    )
  end

  @doc """
  Returns a single Track resource represented by TrackName or SID.

  Operation: `FetchRoomParticipantPublishedTrack` | Tags: VideoV1PublishedTrack
  """
  @spec fetch(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Video.V1.Room.Participant.Publishedtrack.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, room_sid, participant_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/Rooms/#{room_sid}/Participants/#{participant_sid}/PublishedTracks/#{sid}",
             opts: opts,
             base_url: "https://video.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Video.V1.Room.Participant.Publishedtrack)}
    end
  end
end
