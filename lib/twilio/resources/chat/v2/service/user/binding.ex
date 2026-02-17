# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Chat.V2.Service.User.Binding do
  @moduledoc """
  List of bindings for a given user

  SID prefix: `BS`

  Parent: `/Services/{ServiceSid}/Users/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the User Binding resource. |
  | `binding_type` | The push technology to use for the User Binding. Can be: `apn`, `gcm`, or `fcm`.  See [push notification configuration](https://www.twilio.com/docs/chat/push-notification-configuration) for more info.. Values: `gcm`, `apn`, `fcm` |
  | `credential_sid` | The SID of the [Credential](https://www.twilio.com/docs/chat/rest/credential-resource) for the binding. See [push notification configuration](https://www.twilio.com/docs/chat/push-notification-configuration) for more info. |
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `endpoint` | The unique endpoint identifier for the User Binding. The format of the value depends on the `binding_type`.. PII: standard |
  | `identity` | The application-defined string that uniquely identifies the resource's [User](https://www.twilio.com/docs/chat/rest/user-resource) within the [Service](https://www.twilio.com/docs/chat/rest/service-resource). See [access tokens](https://www.twilio.com/docs/chat/create-tokens) for more info.. PII: standard |
  | `message_types` | The [Programmable Chat message types](https://www.twilio.com/docs/chat/push-notification-configuration#push-types) the binding is subscribed to. |
  | `service_sid` | The SID of the [Service](https://www.twilio.com/docs/chat/rest/service-resource) the User Binding resource is associated with. |
  | `sid` | The unique string that we created to identify the User Binding resource. |
  | `url` | The absolute URL of the User Binding resource.. Format: uri |
  | `user_sid` | The SID of the [User](https://www.twilio.com/docs/chat/rest/user-resource) with the User Binding resource.  See [push notification configuration](https://www.twilio.com/docs/chat/push-notification-configuration) for more info. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          binding_type: String.t(),
          credential_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          endpoint: String.t() | nil,
          identity: String.t() | nil,
          message_types: list() | nil,
          service_sid: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil,
          user_sid: String.t() | nil
        }

  defstruct [
    :account_sid,
    :binding_type,
    :credential_sid,
    :date_created,
    :date_updated,
    :endpoint,
    :identity,
    :message_types,
    :service_sid,
    :sid,
    :url,
    :user_sid
  ]

  @object_name "chat.v2.service.user.user_binding"
  def object_name, do: @object_name

  @sid_prefix "BS"
  def sid_prefix, do: @sid_prefix
end
