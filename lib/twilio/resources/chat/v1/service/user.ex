# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Chat.V1.Service.User do
  @moduledoc """
  Unique chat users within a chat service

  SID prefix: `US`

  Parent: `/Services/{Sid}`

  ## Sub-resources
  - `user_channels` — `/v1/Services/{service_sid}/Users/{user_sid}/Channels`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/api/rest/account) that created the User resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `attributes` | The JSON string that stores application-specific data. **Note** If this property has been assigned a value, it's only  displayed in a FETCH action that returns a single resource; otherwise, it's null. If the attributes have not been set, `{}` is returned.. PII: sensitive |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [RFC 2822](http://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [RFC 2822](http://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `friendly_name` | The string that you assigned to describe the resource.. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `identity` | The application-defined string that uniquely identifies the resource's User within the [Service](https://www.twilio.com/docs/api/chat/rest/services). This value is often a username or an email address. See [access tokens](https://www.twilio.com/docs/api/chat/guides/create-tokens) for more info.. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `is_notifiable` | Whether the User has a potentially valid Push Notification registration (APN or GCM) for the Service instance. If at least one registration exists, `true`; otherwise `false`. This value is only returned by Fetch actions that return a single resource and `null` is always returned by a Read action. This value is `null` if the Service's `reachability_enabled` is `false`, and if the User has never had a notification registration, even if the Service's `reachability_enabled` is `true`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `is_online` | Whether the User is actively connected to the Service instance and online. This value is only returned by Fetch actions that return a single resource and `null` is always returned by a Read action. This value is `null` if the Service's `reachability_enabled` is `false`, if the User has never been online for the Service instance, even if the Service's `reachability_enabled` is `true`. |
  | `joined_channels_count` | The number of Channels this User is a Member of. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `links` | The absolute URLs of the [Channel](https://www.twilio.com/docs/chat/api/channels) and [Binding](https://www.twilio.com/docs/chat/rest/bindings-resource) resources related to the user.. Format: uri-map |
  | `role_sid` | The SID of the [Role](https://www.twilio.com/docs/api/chat/rest/roles) assigned to the user. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `service_sid` | The SID of the [Service](https://www.twilio.com/docs/api/chat/rest/services) the resource is associated with. |
  | `sid` | The unique string that we created to identify the User resource. |
  | `url` | The absolute URL of the User resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          attributes: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          identity: String.t() | nil,
          is_notifiable: boolean() | nil,
          is_online: boolean() | nil,
          joined_channels_count: integer(),
          links: map() | nil,
          role_sid: String.t() | nil,
          service_sid: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :attributes,
    :date_created,
    :date_updated,
    :friendly_name,
    :identity,
    :is_notifiable,
    :is_online,
    :joined_channels_count,
    :links,
    :role_sid,
    :service_sid,
    :sid,
    :url
  ]

  @object_name "chat.v1.service.user"
  def object_name, do: @object_name

  @sid_prefix "US"
  def sid_prefix, do: @sid_prefix
end
