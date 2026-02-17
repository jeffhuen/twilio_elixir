# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Chat.V2.Service do
  @moduledoc """
  Top level scope for all chat resources

  SID prefix: `IS`

  ## Sub-resources
  - `bindings` — `/v2/Services/{service_sid}/Bindings`
  - `channels` — `/v2/Services/{service_sid}/Channels`
  - `roles` — `/v2/Services/{service_sid}/Roles`
  - `users` — `/v2/Services/{service_sid}/Users`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Service resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `consumption_report_interval` | DEPRECATED. The interval in seconds between consumption reports submission batches from client endpoints. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `default_channel_creator_role_sid` | The channel role assigned to a channel creator when they join a new channel. See the [Role resource](https://www.twilio.com/docs/chat/rest/role-resource) for more info about roles. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `default_channel_role_sid` | The channel role assigned to users when they are added to a channel. See the [Role resource](https://www.twilio.com/docs/chat/rest/role-resource) for more info about roles. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `default_service_role_sid` | The service role assigned to users when they are added to the service. See the [Role resource](https://www.twilio.com/docs/chat/rest/role-resource) for more info about roles. |
  | `friendly_name` | The string that you assigned to describe the resource.. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `limits` | An object that describes the limits of the service instance. The `limits` object contains  `channel_members` to describe the members/channel limit and `user_channels` to describe the channels/user limit. `channel_members` can be 1,000 or less, with a default of 250. `user_channels` can be 1,000 or less, with a default value of 100. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `links` | The absolute URLs of the Service's [Channels](https://www.twilio.com/docs/chat/channels), [Roles](https://www.twilio.com/docs/chat/rest/role-resource), [Bindings](https://www.twilio.com/docs/chat/rest/binding-resource), and [Users](https://www.twilio.com/docs/chat/rest/user-resource).. Format: uri-map |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `media` | An object that describes the properties of media that the service supports. The object contains the `size_limit_mb` property, which describes the size of the largest media file in MB; and the `compatibility_message` property, which contains the message text to send when a media message does not have any text. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `notifications` | The notification configuration for the Service instance. See [Push Notification Configuration](https://www.twilio.com/docs/chat/push-notification-configuration) for more info. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `post_webhook_retry_count` | The number of times to retry a call to the `post_webhook_url` if the request times out (after 5 seconds) or it receives a 429, 503, or 504 HTTP response. The default is 0, which means the call won't be retried. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `post_webhook_url` | The URL for post-event webhooks, which are called by using the `webhook_method`. See [Webhook Events](https://www.twilio.com/docs/chat/webhook-events) for more details. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `pre_webhook_retry_count` | The number of times to retry a call to the `pre_webhook_url` if the request times out (after 5 seconds) or it receives a 429, 503, or 504 HTTP response. Default retry count is 0 times, which means the call won't be retried. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `pre_webhook_url` | The URL for pre-event webhooks, which are called by using the `webhook_method`. See [Webhook Events](https://www.twilio.com/docs/chat/webhook-events) for more details. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `reachability_enabled` | Whether the [Reachability Indicator](https://www.twilio.com/docs/chat/reachability-indicator) is enabled for this Service instance. The default is `false`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `read_status_enabled` | Whether the [Message Consumption Horizon](https://www.twilio.com/docs/chat/consumption-horizon) feature is enabled. The default is `true`. |
  | `sid` | The unique string that we created to identify the Service resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `typing_indicator_timeout` | How long in seconds after a `started typing` event until clients should assume that user is no longer typing, even if no `ended typing` message was received.  The default is 5 seconds. |
  | `url` | The absolute URL of the Service resource.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `webhook_filters` | The list of webhook events that are enabled for this Service instance. See [Webhook Events](https://www.twilio.com/docs/chat/webhook-events) for more details. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `webhook_method` | The HTTP method to use for calls to the `pre_webhook_url` and `post_webhook_url` webhooks.  Can be: `POST` or `GET` and the default is `POST`. See [Webhook Events](https://www.twilio.com/docs/chat/webhook-events) for more details. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          consumption_report_interval: integer(),
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          default_channel_creator_role_sid: String.t() | nil,
          default_channel_role_sid: String.t() | nil,
          default_service_role_sid: String.t() | nil,
          friendly_name: String.t() | nil,
          limits: String.t() | nil,
          links: map() | nil,
          media: String.t() | nil,
          notifications: String.t() | nil,
          post_webhook_retry_count: integer(),
          post_webhook_url: String.t() | nil,
          pre_webhook_retry_count: integer(),
          pre_webhook_url: String.t() | nil,
          reachability_enabled: boolean() | nil,
          read_status_enabled: boolean() | nil,
          sid: String.t() | nil,
          typing_indicator_timeout: integer(),
          url: String.t() | nil,
          webhook_filters: list() | nil,
          webhook_method: String.t() | nil
        }

  defstruct [
    :account_sid,
    :consumption_report_interval,
    :date_created,
    :date_updated,
    :default_channel_creator_role_sid,
    :default_channel_role_sid,
    :default_service_role_sid,
    :friendly_name,
    :limits,
    :links,
    :media,
    :notifications,
    :post_webhook_retry_count,
    :post_webhook_url,
    :pre_webhook_retry_count,
    :pre_webhook_url,
    :reachability_enabled,
    :read_status_enabled,
    :sid,
    :typing_indicator_timeout,
    :url,
    :webhook_filters,
    :webhook_method
  ]

  @object_name "chat.v2.service"
  def object_name, do: @object_name

  @sid_prefix "IS"
  def sid_prefix, do: @sid_prefix
end
