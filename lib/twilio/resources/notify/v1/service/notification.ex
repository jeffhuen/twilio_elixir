# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Notify.V1.Service.Notification do
  @moduledoc """
  Notification resource.

  SID prefix: `NT`

  Parent: `/Services/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Notification resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `action` | The actions to display for the notification. For APNS, translates to the `aps.category` value. For GCM, translates to the `data.twi_action` value. For SMS, this parameter is not supported and is omitted from deliveries to those channels. |
  | `alexa` | Deprecated. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `apn` | The APNS-specific payload that overrides corresponding attributes in the generic payload for APNS Bindings. This property maps to the APNS `Payload` item, therefore the `aps` key must be used to change standard attributes. Adds custom key-value pairs to the root of the dictionary. See the [APNS documentation](https://developer.apple.com/library/content/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/CommunicatingwithAPNs.html) for more details. We reserve keys that start with `twi_` for future use. Custom keys that start with `twi_` are not allowed. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `body` | The notification text. For FCM and GCM, translates to `data.twi_body`. For APNS, translates to `aps.alert.body`. For SMS, translates to `body`. SMS requires either this `body` value, or `media_urls` attribute defined in the `sms` parameter of the notification.. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `data` | The custom key-value pairs of the notification's payload. For FCM and GCM, this value translates to `data` in the FCM and GCM payloads. FCM and GCM [reserve certain keys](https://firebase.google.com/docs/cloud-messaging/http-server-ref) that cannot be used in those channels. For APNS, attributes of `data` are inserted into the APNS payload as custom properties outside of the `aps` dictionary. In all channels, we reserve keys that start with `twi_` for future use. Custom keys that start with `twi_` are not allowed and are rejected as 400 Bad request with no delivery attempted. For SMS, this parameter is not supported and is omitted from deliveries to those channels. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `facebook_messenger` | Deprecated. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `fcm` | The FCM-specific payload that overrides corresponding attributes in the generic payload for FCM Bindings. This property maps to the root JSON dictionary. See the [FCM documentation](https://firebase.google.com/docs/cloud-messaging/http-server-ref#downstream) for more details. Target parameters `to`, `registration_ids`, `condition`, and `notification_key` are not allowed in this parameter. We reserve keys that start with `twi_` for future use. Custom keys that start with `twi_` are not allowed. FCM also [reserves certain keys](https://firebase.google.com/docs/cloud-messaging/http-server-ref), which cannot be used in that channel. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `gcm` | The GCM-specific payload that overrides corresponding attributes in the generic payload for GCM Bindings.  This property maps to the root JSON dictionary. Target parameters `to`, `registration_ids`, and `notification_key` are not allowed. We reserve keys that start with `twi_` for future use. Custom keys that start with `twi_` are not allowed. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `identities` | The list of `identity` values of the Users to notify. We will attempt to deliver notifications only to Bindings with an identity in this list.. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `priority` | The priority of the notification. Can be: `low` or `high` and the default is `high`. A value of `low` optimizes the client app's battery consumption; however, notifications may be delivered with unspecified delay. For FCM and GCM, `low` priority is the same as `Normal` priority. For APNS `low` priority is the same as `5`. A value of `high` sends the notification immediately, and can wake up a sleeping device. For FCM and GCM, `high` is the same as `High` priority. For APNS, `high` is a priority `10`. SMS does not support this property.. Values: `high`, `low` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `segments` | The list of Segments to notify. The [Segment](https://www.twilio.com/docs/notify/api/segment-resource) resource is deprecated. Use the `tags` property, instead. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `service_sid` | The SID of the [Service](https://www.twilio.com/docs/notify/api/service-resource) the resource is associated with. |
  | `sid` | The unique string that we created to identify the Notification resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `sms` | The SMS-specific payload that overrides corresponding attributes in the generic payload for SMS Bindings.  Each attribute in this value maps to the corresponding `form` parameter of the Twilio [Message](https://www.twilio.com/docs/sms/api/message-resource) resource.  These parameters of the Message resource are supported in snake case format: `body`, `media_urls`, `status_callback`, and `max_price`.  The `status_callback` parameter overrides the corresponding parameter in the messaging service, if configured. The `media_urls` property expects a JSON array. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `sound` | The name of the sound to be played for the notification. For FCM and GCM, this Translates to `data.twi_sound`.  For APNS, this translates to `aps.sound`.  SMS does not support this property. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `tags` | The tags that select the Bindings to notify. Notifications will be attempted only to Bindings that have all of the tags listed in this property.. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `title` | The notification title. For FCM and GCM, this translates to the `data.twi_title` value. For APNS, this translates to the `aps.alert.title` value. SMS does not support this property. This field is not visible on iOS phones and tablets but appears on Apple Watch and Android devices. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ttl` | How long, in seconds, the notification is valid. Can be an integer between 0 and 2,419,200, which is 4 weeks, the default and the maximum supported time to live (TTL). Delivery should be attempted if the device is offline until the TTL elapses. Zero means that the notification delivery is attempted immediately, only once, and is not stored for future delivery. SMS does not support this property. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          action: String.t() | nil,
          alexa: String.t() | nil,
          apn: String.t() | nil,
          body: String.t() | nil,
          data: String.t() | nil,
          date_created: String.t() | nil,
          facebook_messenger: String.t() | nil,
          fcm: String.t() | nil,
          gcm: String.t() | nil,
          identities: list() | nil,
          priority: String.t(),
          segments: list() | nil,
          service_sid: String.t() | nil,
          sid: String.t() | nil,
          sms: String.t() | nil,
          sound: String.t() | nil,
          tags: list() | nil,
          title: String.t() | nil,
          ttl: integer()
        }

  defstruct [
    :account_sid,
    :action,
    :alexa,
    :apn,
    :body,
    :data,
    :date_created,
    :facebook_messenger,
    :fcm,
    :gcm,
    :identities,
    :priority,
    :segments,
    :service_sid,
    :sid,
    :sms,
    :sound,
    :tags,
    :title,
    :ttl
  ]

  @object_name "notify.v1.service.notification"
  def object_name, do: @object_name

  @sid_prefix "NT"
  def sid_prefix, do: @sid_prefix
end
