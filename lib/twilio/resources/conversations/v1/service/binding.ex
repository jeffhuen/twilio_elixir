# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Conversations.V1.Service.Binding do
  @moduledoc """
  A Binding resource represents a push notification binding and its configuration, for delivering conversation events to mobile or web endpoints.

  SID prefix: `BS`

  Parent: `/Services/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The unique ID of the [Account](https://www.twilio.com/docs/iam/api/account) responsible for this binding. |
  | `binding_type` | The push technology to use for the Binding. Can be: `apn`, `gcm`, `fcm`, or `twilsock`.  See [push notification configuration](https://www.twilio.com/docs/chat/push-notification-configuration) for more info.. Values: `apn`, `gcm`, `fcm`, `twilsock` |
  | `chat_service_sid` | The SID of the [Conversation Service](https://www.twilio.com/docs/conversations/api/service-resource) the Binding resource is associated with. |
  | `credential_sid` | The SID of the [Credential](https://www.twilio.com/docs/conversations/api/credential-resource) for the binding. See [push notification configuration](https://www.twilio.com/docs/chat/push-notification-configuration) for more info. |
  | `date_created` | The date that this resource was created.. Format: date-time |
  | `date_updated` | The date that this resource was last updated.. Format: date-time |
  | `endpoint` | The unique endpoint identifier for the Binding. The format of this value depends on the `binding_type`.. PII: standard |
  | `identity` | The application-defined string that uniquely identifies the [Conversation User](https://www.twilio.com/docs/conversations/api/user-resource) within the [Conversation Service](https://www.twilio.com/docs/conversations/api/service-resource). See [access tokens](https://www.twilio.com/docs/conversations/create-tokens) for more info.. PII: standard |
  | `message_types` | The [Conversation message types](https://www.twilio.com/docs/chat/push-notification-configuration#push-types) the binding is subscribed to. |
  | `sid` | A 34 character string that uniquely identifies this resource. |
  | `url` | An absolute API resource URL for this binding.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          binding_type: String.t(),
          chat_service_sid: String.t() | nil,
          credential_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          endpoint: String.t() | nil,
          identity: String.t() | nil,
          message_types: list() | nil,
          sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :binding_type,
    :chat_service_sid,
    :credential_sid,
    :date_created,
    :date_updated,
    :endpoint,
    :identity,
    :message_types,
    :sid,
    :url
  ]

  @object_name "conversations.v1.service.service_binding"
  def object_name, do: @object_name

  @sid_prefix "BS"
  def sid_prefix, do: @sid_prefix
end
