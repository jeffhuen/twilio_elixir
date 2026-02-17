# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Video.V1.Room.Participant.SubscribedtrackService do
  @moduledoc """
  Service for Subscribedtrack API operations.

  Operations: `list`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Returns a list of tracks that are subscribed for the participant.

  Operation: `ListRoomParticipantSubscribedTrack` | Tags: VideoV1SubscribedTrack
  """
  @spec list(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, room_sid, participant_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/v1/Rooms/#{room_sid}/Participants/#{participant_sid}/SubscribedTracks",
           params: params,
           opts: opts,
           base_url: "https://video.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "subscribed_tracks")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Video.V1.Room.Participant.Subscribedtrack
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Returns a list of tracks that are subscribed for the participant. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, room_sid, participant_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, room_sid, participant_sid, Map.merge(params, page_opts), opts)
      end,
      "subscribed_tracks"
    )
  end

  @doc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Returns a single Track resource represented by `track_sid`.  Note: This is one resource with the Video API that requires a SID, be Track Name on the subscriber side is not guaranteed to be unique.

  Operation: `FetchRoomParticipantSubscribedTrack` | Tags: VideoV1SubscribedTrack
  """
  @spec fetch(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Video.V1.Room.Participant.Subscribedtrack.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, room_sid, participant_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/Rooms/#{room_sid}/Participants/#{participant_sid}/SubscribedTracks/#{sid}",
             opts: opts,
             base_url: "https://video.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Video.V1.Room.Participant.Subscribedtrack)}
    end
  end
end
