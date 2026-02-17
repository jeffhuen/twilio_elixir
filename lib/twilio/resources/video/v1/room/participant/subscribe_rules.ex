# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Video.V1.Room.Participant.SubscribeRules do
  @moduledoc """
  SubscribeRules resource.

  Parent: `/Rooms/{RoomSid}/Participants/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `participant_sid` | The SID of the Participant resource for the Subscribe Rules. |
  | `room_sid` | The SID of the Room resource for the Subscribe Rules |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `rules` | A collection of Subscribe Rules that describe how to include or exclude matching tracks. See the [Specifying Subscribe Rules](https://www.twilio.com/docs/video/api/track-subscriptions#specifying-sr) section for further information. |
  """

  @type t :: %__MODULE__{
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          participant_sid: String.t() | nil,
          room_sid: String.t() | nil,
          rules: list() | nil
        }

  defstruct [:date_created, :date_updated, :participant_sid, :room_sid, :rules]

  @object_name "video.v1.room.room_participant.room_participant_subscribe_rule"
  def object_name, do: @object_name
end
