# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Chat.V1.Service.Channel do
  @moduledoc """
  Channels represent chat rooms

  SID prefix: `CH`

  Parent: `/Services/{Sid}`

  ## Sub-resources
  - `invites` — `/v1/Services/{service_sid}/Channels/{channel_sid}/Invites`
  - `members` — `/v1/Services/{service_sid}/Channels/{channel_sid}/Members`
  - `messages` — `/v1/Services/{service_sid}/Channels/{channel_sid}/Messages`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/api/rest/account) that created the Channel resource. |
  | `attributes` | The JSON string that stores application-specific data. **Note** If this property has been assigned a value, it's only  displayed in a FETCH action that returns a single resource; otherwise, it's null. If the attributes have not been set, `{}` is returned.. PII: sensitive |
  | `created_by` | The `identity` of the User that created the channel. If the Channel was created by using the API, the value is `system`.. PII: standard |
  | `date_created` | The date and time in GMT when the resource was created specified in [RFC 2822](http://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [RFC 2822](http://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `friendly_name` | The string that you assigned to describe the resource.. PII: standard |
  | `links` | The absolute URLs of the [Members](https://www.twilio.com/docs/chat/api/members), [Messages](https://www.twilio.com/docs/chat/api/messages) , [Invites](https://www.twilio.com/docs/chat/api/invites) and, if it exists, the last [Message](https://www.twilio.com/docs/chat/api/messages) for the Channel.. Format: uri-map |
  | `members_count` | The number of Members in the Channel. |
  | `messages_count` | The number of Messages in the Channel. |
  | `service_sid` | The SID of the [Service](https://www.twilio.com/docs/api/chat/rest/services) the resource is associated with. |
  | `sid` | The unique string that we created to identify the Channel resource. |
  | `type` | The visibility of the channel. Can be: `public` or `private`.. Values: `public`, `private` |
  | `unique_name` | An application-defined string that uniquely identifies the resource. It can be used to address the resource in place of the resource's `sid` in the URL.. PII: standard |
  | `url` | The absolute URL of the Channel resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          attributes: String.t() | nil,
          created_by: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          links: map() | nil,
          members_count: integer(),
          messages_count: integer(),
          service_sid: String.t() | nil,
          sid: String.t() | nil,
          type: String.t(),
          unique_name: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :attributes,
    :created_by,
    :date_created,
    :date_updated,
    :friendly_name,
    :links,
    :members_count,
    :messages_count,
    :service_sid,
    :sid,
    :type,
    :unique_name,
    :url
  ]

  @object_name "chat.v1.service.channel"
  def object_name, do: @object_name

  @sid_prefix "CH"
  def sid_prefix, do: @sid_prefix
end
