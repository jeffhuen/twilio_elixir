# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Notify.V1.Service do
  @moduledoc """
  Service resource.

  SID prefix: `IS`

  ## Sub-resources
  - `bindings` — `/v1/Services/{service_sid}/Bindings`
  - `notifications` — `/v1/Services/{service_sid}/Notifications`
  - `segments` — `/v1/Services/{service_sid}/Segments`
  - `users` — `/v1/Services/{service_sid}/Users`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Service resource. |
  | `alexa_skill_id` | Deprecated. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `apn_credential_sid` | The SID of the [Credential](https://www.twilio.com/docs/notify/api/credential-resource) to use for APN Bindings. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `default_alexa_notification_protocol_version` | Deprecated. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `default_apn_notification_protocol_version` | The protocol version to use for sending APNS notifications. Can be overridden on a Binding by Binding basis when creating a [Binding](https://www.twilio.com/docs/notify/api/binding-resource) resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `default_fcm_notification_protocol_version` | The protocol version to use for sending FCM notifications. Can be overridden on a Binding by Binding basis when creating a [Binding](https://www.twilio.com/docs/notify/api/binding-resource) resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `default_gcm_notification_protocol_version` | The protocol version to use for sending GCM notifications. Can be overridden on a Binding by Binding basis when creating a [Binding](https://www.twilio.com/docs/notify/api/binding-resource) resource. |
  | `delivery_callback_enabled` | Callback configuration that enables delivery callbacks, default false |
  | `delivery_callback_url` | URL to send delivery status callback. |
  | `facebook_messenger_page_id` | Deprecated. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `fcm_credential_sid` | The SID of the [Credential](https://www.twilio.com/docs/notify/api/credential-resource) to use for FCM Bindings. |
  | `friendly_name` | The string that you assigned to describe the resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `gcm_credential_sid` | The SID of the [Credential](https://www.twilio.com/docs/notify/api/credential-resource) to use for GCM Bindings. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `links` | The URLs of the Binding, Notification, Segment, and User resources related to the service.. Format: uri-map |
  | `log_enabled` | Whether to log notifications. Can be: `true` or `false` and the default is `true`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `messaging_service_sid` | The SID of the [Messaging Service](https://www.twilio.com/docs/sms/quickstart#messaging-services) to use for SMS Bindings. In order to send SMS notifications this parameter has to be set. |
  | `sid` | The unique string that we created to identify the Service resource. |
  | `url` | The absolute URL of the Service resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          alexa_skill_id: String.t() | nil,
          apn_credential_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          default_alexa_notification_protocol_version: String.t() | nil,
          default_apn_notification_protocol_version: String.t() | nil,
          default_fcm_notification_protocol_version: String.t() | nil,
          default_gcm_notification_protocol_version: String.t() | nil,
          delivery_callback_enabled: boolean() | nil,
          delivery_callback_url: String.t() | nil,
          facebook_messenger_page_id: String.t() | nil,
          fcm_credential_sid: String.t() | nil,
          friendly_name: String.t() | nil,
          gcm_credential_sid: String.t() | nil,
          links: map() | nil,
          log_enabled: boolean() | nil,
          messaging_service_sid: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :alexa_skill_id,
    :apn_credential_sid,
    :date_created,
    :date_updated,
    :default_alexa_notification_protocol_version,
    :default_apn_notification_protocol_version,
    :default_fcm_notification_protocol_version,
    :default_gcm_notification_protocol_version,
    :delivery_callback_enabled,
    :delivery_callback_url,
    :facebook_messenger_page_id,
    :fcm_credential_sid,
    :friendly_name,
    :gcm_credential_sid,
    :links,
    :log_enabled,
    :messaging_service_sid,
    :sid,
    :url
  ]

  @object_name "notify.v1.service"
  def object_name, do: @object_name

  @sid_prefix "IS"
  def sid_prefix, do: @sid_prefix
end
