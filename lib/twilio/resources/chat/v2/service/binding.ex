# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Chat.V2.Service.Binding do
  @moduledoc """
  Push notification subscription for users

  SID prefix: `BS`

  Parent: `/Services/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Binding resource. |
  | `binding_type` | The push technology to use for the Binding. Can be: `apn`, `gcm`, or `fcm`.  See [push notification configuration](https://www.twilio.com/docs/chat/push-notification-configuration) for more info.. Values: `gcm`, `apn`, `fcm` |
  | `credential_sid` | The SID of the [Credential](https://www.twilio.com/docs/chat/rest/credential-resource) for the binding. See [push notification configuration](https://www.twilio.com/docs/chat/push-notification-configuration) for more info. |
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `endpoint` | The unique endpoint identifier for the Binding. The format of this value depends on the `binding_type`.. PII: standard |
  | `identity` | The application-defined string that uniquely identifies the resource's [User](https://www.twilio.com/docs/chat/rest/user-resource) within the [Service](https://www.twilio.com/docs/chat/rest/service-resource). See [access tokens](https://www.twilio.com/docs/chat/create-tokens) for more info.. PII: standard |
  | `links` | The absolute URLs of the Binding's [User](https://www.twilio.com/docs/chat/rest/user-resource).. Format: uri-map |
  | `message_types` | The [Programmable Chat message types](https://www.twilio.com/docs/chat/push-notification-configuration#push-types) the binding is subscribed to. |
  | `service_sid` | The SID of the [Service](https://www.twilio.com/docs/chat/rest/service-resource) the Binding resource is associated with. |
  | `sid` | The unique string that we created to identify the Binding resource. |
  | `url` | The absolute URL of the Binding resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          binding_type: String.t(),
          credential_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          endpoint: String.t() | nil,
          identity: String.t() | nil,
          links: map() | nil,
          message_types: list() | nil,
          service_sid: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :binding_type,
    :credential_sid,
    :date_created,
    :date_updated,
    :endpoint,
    :identity,
    :links,
    :message_types,
    :service_sid,
    :sid,
    :url
  ]

  @object_name "chat.v2.service.binding"
  def object_name, do: @object_name

  @sid_prefix "BS"
  def sid_prefix, do: @sid_prefix
end
