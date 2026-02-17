# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Insights.V1.Video.RoomService do
  @moduledoc """
  Service for Room API operations.

  Operations: `list`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Get a list of Programmable Video Rooms.

  Operation: `ListVideoRoomSummary` | Tags: InsightsV1Room

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `RoomType` | array | Type of room. Can be `go`, `peer_to_peer`, `group`, or `group_small`. |
  | `Codec` | array | Codecs used by participants in the room. Can be `VP8`, `H264`, or `VP9`. |
  | `RoomName` | string | Room friendly name. |
  | `CreatedAfter` | string (date-time) | Only read rooms that started on or after this ISO 8601 timestamp. |
  | `CreatedBefore` | string (date-time) | Only read rooms that started before this ISO 8601 timestamp. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Video/Rooms",
           params: params,
           opts: opts,
           base_url: "https://insights.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "rooms")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(page.items, Twilio.Resources.Insights.V1.Video.Room)
         }}

      error ->
        error
    end
  end

  @doc "Stream: Get a list of Programmable Video Rooms. (lazy auto-pagination)."
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
  Get Video Log Analyzer data for a Room.

  Operation: `FetchVideoRoomSummary` | Tags: InsightsV1Room
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Insights.V1.Video.Room.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Video/Rooms/#{sid}",
             opts: opts,
             base_url: "https://insights.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Insights.V1.Video.Room)}
    end
  end
end
