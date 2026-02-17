# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Insights.V1.Video.Room.ParticipantService do
  @moduledoc """
  Service for Participant API operations.

  Operations: `list`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Get a list of room participants.

  Operation: `ListVideoParticipantSummary` | Tags: InsightsV1Participant
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, room_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Video/Rooms/#{room_sid}/Participants",
           params: params,
           opts: opts,
           base_url: "https://insights.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "participants")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Insights.V1.Video.Room.Participant
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Get a list of room participants. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, room_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, room_sid, Map.merge(params, page_opts), opts)
      end,
      "participants"
    )
  end

  @doc """
  Get Video Log Analyzer data for a Room Participant.

  Operation: `FetchVideoParticipantSummary` | Tags: InsightsV1Participant
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Insights.V1.Video.Room.Participant.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, room_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Video/Rooms/#{room_sid}/Participants/#{sid}",
             opts: opts,
             base_url: "https://insights.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Insights.V1.Video.Room.Participant)}
    end
  end
end
