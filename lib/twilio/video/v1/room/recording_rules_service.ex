# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Video.V1.Room.RecordingRulesService do
  @moduledoc """


  Operations: `list`, `create`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Returns a list of Recording Rules for the Room.

  Operation: `FetchRoomRecordingRule` | Tags: VideoV1RecordingRules
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, room_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Rooms/#{room_sid}/RecordingRules",
           params: params,
           opts: opts,
           base_url: "https://video.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "recordingrules")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Video.V1.Room.RecordingRules
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Returns a list of Recording Rules for the Room. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, room_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, room_sid, Map.merge(params, page_opts), opts)
      end,
      "recordingrules"
    )
  end

  @doc """
  Update the Recording Rules for the Room

  Operation: `UpdateRoomRecordingRule` | Tags: VideoV1RecordingRules

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Rules` | string | A JSON-encoded array of recording rules. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Video.V1.Room.RecordingRules.t()} | {:error, Twilio.Error.t()}
  def create(client, room_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Rooms/#{room_sid}/RecordingRules",
             params: params,
             opts: opts,
             base_url: "https://video.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Video.V1.Room.RecordingRules)}
    end
  end
end
