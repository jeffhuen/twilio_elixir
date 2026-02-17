# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Chat.V2.Service.Role do
  @moduledoc """
  Roles determining user or member permissions

  SID prefix: `RL`

  Parent: `/Services/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Role resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `friendly_name` | The string that you assigned to describe the resource.. PII: standard |
  | `permissions` | An array of the permissions the role has been granted. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `service_sid` | The SID of the [Service](https://www.twilio.com/docs/chat/rest/service-resource) the Role resource is associated with. |
  | `sid` | The unique string that we created to identify the Role resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `type` | The type of role. Can be: `channel` for [Channel](https://www.twilio.com/docs/chat/channels) roles or `deployment` for [Service](https://www.twilio.com/docs/chat/rest/service-resource) roles.. Values: `channel`, `deployment` |
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

  @object_name "chat.v2.service.role"
  def object_name, do: @object_name

  @sid_prefix "RL"
  def sid_prefix, do: @sid_prefix
end
