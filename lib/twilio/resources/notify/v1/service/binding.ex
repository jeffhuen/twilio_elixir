# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Notify.V1.Service.Binding do
  @moduledoc """


  SID prefix: `BS`

  Parent: `/Services/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Binding resource. |
  | `address` | The channel-specific address. For APNS, the device token. For FCM and GCM, the registration token. For SMS, a phone number in E.164 format. For Facebook Messenger, the Messenger ID of the user or a phone number in E.164 format.. PII: sensitive |
  | `binding_type` | The transport technology to use for the Binding. Can be: `apn`, `fcm`, `gcm`, `sms`, or `facebook-messenger`. |
  | `credential_sid` | The SID of the [Credential](https://www.twilio.com/docs/notify/api/credential-resource) resource to be used to send notifications to this Binding. If present, this overrides the Credential specified in the Service resource. Applicable only to `apn`, `fcm`, and `gcm` type Bindings. |
  | `date_created` | The date and time in GMT when the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `endpoint` | Deprecated. |
  | `identity` | The `identity` value that uniquely identifies the resource's [User](https://www.twilio.com/docs/chat/rest/user-resource) within the [Service](https://www.twilio.com/docs/notify/api/service-resource). Up to 20 Bindings can be created for the same Identity in a given Service.. PII: standard |
  | `links` | The URLs of related resources.. Format: uri-map |
  | `notification_protocol_version` | The protocol version to use to send the notification. This defaults to the value of `default_xxxx_notification_protocol_version` in the [Service](https://www.twilio.com/docs/notify/api/service-resource) for the protocol. The current version is `"3"` for `apn`, `fcm`, and `gcm` type Bindings. The parameter is not applicable to `sms` and `facebook-messenger` type Bindings as the data format is fixed. |
  | `service_sid` | The SID of the [Service](https://www.twilio.com/docs/notify/api/service-resource) the resource is associated with. |
  | `sid` | The unique string that we created to identify the Binding resource. |
  | `tags` | The list of tags associated with this Binding. Tags can be used to select the Bindings to use when sending a notification. Maximum 20 tags are allowed.. PII: standard |
  | `url` | The absolute URL of the Binding resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          address: String.t() | nil,
          binding_type: String.t() | nil,
          credential_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          endpoint: String.t() | nil,
          identity: String.t() | nil,
          links: map() | nil,
          notification_protocol_version: String.t() | nil,
          service_sid: String.t() | nil,
          sid: String.t() | nil,
          tags: list() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :address,
    :binding_type,
    :credential_sid,
    :date_created,
    :date_updated,
    :endpoint,
    :identity,
    :links,
    :notification_protocol_version,
    :service_sid,
    :sid,
    :tags,
    :url
  ]

  @object_name "notify.v1.service.binding"
  def object_name, do: @object_name

  @sid_prefix "BS"
  def sid_prefix, do: @sid_prefix
end
