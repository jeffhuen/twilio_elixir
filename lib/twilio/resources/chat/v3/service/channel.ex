# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Chat.V3.Service.Channel do
  @moduledoc """
  A Channel resource represents a chat/conversation channel with an ordered list of messages and a participant roster.

  SID prefix: `CH`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Channel resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `attributes` | The JSON string that stores application-specific data. If attributes have not been set, `{}` is returned.. PII: sensitive |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `created_by` | The `identity` of the User that created the channel. If the Channel was created by using the API, the value is `system`.. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `friendly_name` | The string that you assigned to describe the resource.. PII: standard |
  | `members_count` | The number of Members in the Channel. |
  | `messages_count` | The number of Messages that have been passed in the Channel. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `messaging_service_sid` | The unique ID of the [Messaging Service](https://www.twilio.com/docs/messaging/api/service-resource) this channel belongs to. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `service_sid` | The SID of the [Service](https://www.twilio.com/docs/chat/rest/service-resource) the Channel resource is associated with. |
  | `sid` | The unique string that we created to identify the Channel resource. |
  | `type` | The visibility of the channel. Can be: `public` or `private`.. Values: `public`, `private` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
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
          members_count: integer(),
          messages_count: integer(),
          messaging_service_sid: String.t() | nil,
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
    :members_count,
    :messages_count,
    :messaging_service_sid,
    :service_sid,
    :sid,
    :type,
    :unique_name,
    :url
  ]

  @object_name "chat.v3.channel"
  def object_name, do: @object_name

  @sid_prefix "CH"
  def sid_prefix, do: @sid_prefix
end
