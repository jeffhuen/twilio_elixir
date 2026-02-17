# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Chat.V1.Service.User.Channel do
  @moduledoc """
  Channel resource.

  Parent: `/Services/{ServiceSid}/Users/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/api/rest/account) that created the User Channel resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `channel_sid` | The SID of the [Channel](https://www.twilio.com/docs/api/chat/rest/channels) the resource belongs to. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `last_consumed_message_index` | The index of the last [Message](https://www.twilio.com/docs/api/chat/rest/messages) in the [Channel](https://www.twilio.com/docs/api/chat/rest/channels) that the Member has read. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `links` | The absolute URLs of the [Members](https://www.twilio.com/docs/chat/api/members), [Messages](https://www.twilio.com/docs/chat/api/messages) , [Invites](https://www.twilio.com/docs/chat/api/invites) and, if it exists, the last [Message](https://www.twilio.com/docs/chat/api/messages) for the Channel.. Format: uri-map |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `member_sid` | The SID of a [Member](https://www.twilio.com/docs/api/chat/rest/members) that represents the User on the Channel. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `service_sid` | The SID of the [Service](https://www.twilio.com/docs/api/chat/rest/services) the resource is associated with. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status` | The status of the User on the Channel. Can be: `joined`, `invited`, or `not_participating`.. Values: `joined`, `invited`, `not_participating` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `unread_messages_count` | The number of unread Messages in the Channel for the User. Note that retrieving messages on a client endpoint does not mean that messages are consumed or read. See [Consumption Horizon feature](https://www.twilio.com/docs/api/chat/guides/consumption-horizon) to learn how to mark messages as consumed. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          channel_sid: String.t() | nil,
          last_consumed_message_index: integer() | nil,
          links: map() | nil,
          member_sid: String.t() | nil,
          service_sid: String.t() | nil,
          status: String.t(),
          unread_messages_count: integer() | nil
        }

  defstruct [
    :account_sid,
    :channel_sid,
    :last_consumed_message_index,
    :links,
    :member_sid,
    :service_sid,
    :status,
    :unread_messages_count
  ]

  @object_name "chat.v1.service.user.user_channel"
  def object_name, do: @object_name
end
