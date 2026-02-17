# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Chat.V1.Service.Role do
  @moduledoc """
  Roles determining user or member permissions

  SID prefix: `RL`

  Parent: `/Services/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/api/rest/account) that created the Role resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [RFC 2822](http://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [RFC 2822](http://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `friendly_name` | The string that you assigned to describe the resource.. PII: standard |
  | `permissions` | An array of the permissions the role has been granted, formatted as a JSON string. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `service_sid` | The SID of the [Service](https://www.twilio.com/docs/api/chat/rest/services) the resource is associated with. |
  | `sid` | The unique string that we created to identify the Role resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `type` | The type of role. Can be: `channel` for [Channel](https://www.twilio.com/docs/chat/api/channels) roles or `deployment` for [Service](https://www.twilio.com/docs/chat/api/services) roles.. Values: `channel`, `deployment` |
  | `url` | The absolute URL of the Role resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          permissions: list() | nil,
          service_sid: String.t() | nil,
          sid: String.t() | nil,
          type: String.t(),
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :date_created,
    :date_updated,
    :friendly_name,
    :permissions,
    :service_sid,
    :sid,
    :type,
    :url
  ]

  @object_name "chat.v1.service.role"
  def object_name, do: @object_name

  @sid_prefix "RL"
  def sid_prefix, do: @sid_prefix
end
