# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Video.V1.Room.Participant.SubscribeRulesService do
  @moduledoc """


  Operations: `list`, `create`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Returns a list of Subscribe Rules for the Participant.

  Operation: `FetchRoomParticipantSubscribeRule` | Tags: VideoV1SubscribeRules
  """
  @spec list(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, room_sid, participant_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/v1/Rooms/#{room_sid}/Participants/#{participant_sid}/SubscribeRules",
           params: params,
           opts: opts,
           base_url: "https://video.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "subscriberules")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Video.V1.Room.Participant.SubscribeRules
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Returns a list of Subscribe Rules for the Participant. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, room_sid, participant_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, room_sid, participant_sid, Map.merge(params, page_opts), opts)
      end,
      "subscriberules"
    )
  end

  @doc """
  Update the Subscribe Rules for the Participant

  Operation: `UpdateRoomParticipantSubscribeRule` | Tags: VideoV1SubscribeRules

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Rules` | string | A JSON-encoded array of subscribe rules. See the [Specifying Subscribe Rules](https://www.twilio.com/docs/video/api/track-subscriptions#specifying-sr) section for further information. |
  """
  @spec create(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Video.V1.Room.Participant.SubscribeRules.t()}
          | {:error, Twilio.Error.t()}
  def create(client, room_sid, participant_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/Rooms/#{room_sid}/Participants/#{participant_sid}/SubscribeRules",
             params: params,
             opts: opts,
             base_url: "https://video.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Video.V1.Room.Participant.SubscribeRules)}
    end
  end
end
