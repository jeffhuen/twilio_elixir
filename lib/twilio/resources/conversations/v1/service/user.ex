# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Conversations.V1.Service.User do
  @moduledoc """
  A Service User resource represents a conversation user belonging to a specific conversation service.

  SID prefix: `US`

  Parent: `/Services/{Sid}`

  ## Sub-resources
  - `user_conversations` — `/v1/Services/{chat_service_sid}/Users/{user_sid}/Conversations`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the User resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `attributes` | The JSON Object string that stores application-specific data. If attributes have not been set, `{}` is returned.. PII: sensitive |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `chat_service_sid` | The SID of the [Conversation Service](https://www.twilio.com/docs/conversations/api/service-resource) the User resource is associated with. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `friendly_name` | The string that you assigned to describe the resource.. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `identity` | The application-defined string that uniquely identifies the resource's User within the [Conversation Service](https://www.twilio.com/docs/conversations/api/service-resource). This value is often a username or an email address, and is case-sensitive.. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `is_notifiable` | Whether the User has a potentially valid Push Notification registration (APN or GCM) for this Conversations Service. If at least one registration exists, `true`; otherwise `false`. This value is only returned by Fetch actions that return a single resource and `null` is always returned by a Read action. This value is `null` if the Service's `reachability_enabled` is `false`, and if the User has never had a notification registration, even if the Service's `reachability_enabled` is `true`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `is_online` | Whether the User is actively connected to this Conversations Service and online. This value is only returned by Fetch actions that return a single resource and `null` is always returned by a Read action. This value is `null` if the Service's `reachability_enabled` is `false`, if the User has never been online for this Conversations Service, even if the Service's `reachability_enabled` is `true`. |
  | `links` | Format: uri-map |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `role_sid` | The SID of a service-level [Role](https://www.twilio.com/docs/conversations/api/role-resource) assigned to the user. |
  | `sid` | The unique string that we created to identify the User resource. |
  | `url` | An absolute API resource URL for this user.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          attributes: String.t() | nil,
          chat_service_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          identity: String.t() | nil,
          is_notifiable: boolean() | nil,
          is_online: boolean() | nil,
          links: map() | nil,
          role_sid: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :attributes,
    :chat_service_sid,
    :date_created,
    :date_updated,
    :friendly_name,
    :identity,
    :is_notifiable,
    :is_online,
    :links,
    :role_sid,
    :sid,
    :url
  ]

  @object_name "conversations.v1.service.service_user"
  def object_name, do: @object_name

  @sid_prefix "US"
  def sid_prefix, do: @sid_prefix
end
