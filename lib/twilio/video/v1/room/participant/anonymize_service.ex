# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Video.V1.Room.Participant.AnonymizeService do
  @moduledoc """
  Service for Anonymize API operations.

  Operations: `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `UpdateRoomParticipantAnonymize` | Tags: VideoV1Anonymize
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Video.V1.Room.Participant.Anonymize.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, room_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Rooms/#{room_sid}/Participants/#{sid}/Anonymize",
             params: params,
             opts: opts,
             base_url: "https://video.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Video.V1.Room.Participant.Anonymize)}
    end
  end
end
