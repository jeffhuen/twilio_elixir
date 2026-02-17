# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Video.V1.Room.Participant do
  @moduledoc """
  Participants in video rooms

  SID prefix: `PA`

  Parent: `/Rooms/{Sid}`

  ## Sub-resources
  - `anonymize` — `/v1/Rooms/{room_sid}/Participants/{sid}/Anonymize`
  - `published_tracks` — `/v1/Rooms/{room_sid}/Participants/{participant_sid}/PublishedTracks`
  - `subscribe_rules` — `/v1/Rooms/{room_sid}/Participants/{participant_sid}/SubscribeRules`
  - `subscribed_tracks` — `/v1/Rooms/{room_sid}/Participants/{participant_sid}/SubscribedTracks`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the RoomParticipant resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `duration` | The duration in seconds that the participant was `connected`. Populated only after the participant is `disconnected`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `end_time` | The time when the participant disconnected from the room in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601#UTC) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `identity` | The application-defined string that uniquely identifies the resource's User within a Room. If a client joins with an existing Identity, the existing client is disconnected. See [access tokens](https://www.twilio.com/docs/video/tutorials/user-identity-access-tokens) and [limits](https://www.twilio.com/docs/video/programmable-video-limits) for more info.  |
  | `links` | The URLs of related resources.. Format: uri-map |
  | `room_sid` | The SID of the participant's room. |
  | `sid` | The unique string that we created to identify the RoomParticipant resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `start_time` | The time of participant connected to the room in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601#UTC) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status` | The status of the Participant. Can be: `connected` or `disconnected`.. Values: `connected`, `disconnected`, `reconnecting` |
  | `url` | The absolute URL of the resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          duration: integer() | nil,
          end_time: String.t() | nil,
          identity: String.t() | nil,
          links: map() | nil,
          room_sid: String.t() | nil,
          sid: String.t() | nil,
          start_time: String.t() | nil,
          status: String.t(),
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :date_created,
    :date_updated,
    :duration,
    :end_time,
    :identity,
    :links,
    :room_sid,
    :sid,
    :start_time,
    :status,
    :url
  ]

  @object_name "video.v1.room.room_participant"
  def object_name, do: @object_name

  @sid_prefix "PA"
  def sid_prefix, do: @sid_prefix
end
