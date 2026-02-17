# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Chat.V2.Service.User.Channel do
  @moduledoc """
  List of channels for a given user

  Parent: `/Services/{ServiceSid}/Users/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the User Channel resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `channel_sid` | The SID of the [Channel](https://www.twilio.com/docs/chat/channels) the User Channel resource belongs to. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `last_consumed_message_index` | The index of the last [Message](https://www.twilio.com/docs/chat/rest/message-resource) in the [Channel](https://www.twilio.com/docs/chat/channels) that the Member has read. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `links` | The absolute URLs of the [Members](https://www.twilio.com/docs/chat/rest/member-resource), [Messages](https://www.twilio.com/docs/chat/rest/message-resource) , [Invites](https://www.twilio.com/docs/chat/rest/invite-resource) and, if it exists, the last [Message](https://www.twilio.com/docs/chat/rest/message-resource) for the Channel.. Format: uri-map |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `member_sid` | The SID of a [Member](https://www.twilio.com/docs/chat/rest/member-resource) that represents the User on the Channel. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `notification_level` | The push notification level of the User for the Channel. Can be: `default` or `muted`.. Values: `default`, `muted` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `service_sid` | The SID of the [Service](https://www.twilio.com/docs/chat/rest/service-resource) the User Channel resource is associated with. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status` | The status of the User on the Channel. Can be: `joined`, `invited`, or `notParticipating`.. Values: `joined`, `invited`, `notParticipating` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `unread_messages_count` | The number of unread Messages in the Channel for the User. Note that retrieving messages on a client endpoint does not mean that messages are consumed or read. See [Consumption Horizon feature](https://www.twilio.com/docs/chat/consumption-horizon) to learn how to mark messages as consumed. |
  | `url` | The absolute URL of the User Channel resource.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `user_sid` | The SID of the [User](https://www.twilio.com/docs/chat/rest/user-resource) the User Channel belongs to. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          channel_sid: String.t() | nil,
          last_consumed_message_index: integer() | nil,
          links: map() | nil,
          member_sid: String.t() | nil,
          notification_level: String.t(),
          service_sid: String.t() | nil,
          status: String.t(),
          unread_messages_count: integer() | nil,
          url: String.t() | nil,
          user_sid: String.t() | nil
        }

  defstruct [
    :account_sid,
    :channel_sid,
    :last_consumed_message_index,
    :links,
    :member_sid,
    :notification_level,
    :service_sid,
    :status,
    :unread_messages_count,
    :url,
    :user_sid
  ]

  @object_name "chat.v2.service.user.user_channel"
  def object_name, do: @object_name
end
