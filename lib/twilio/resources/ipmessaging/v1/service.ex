# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.IpMessaging.V1.Service do
  @moduledoc """


  SID prefix: `IS`

  ## Sub-resources
  - `channels` — `/v1/Services/{service_sid}/Channels`
  - `roles` — `/v1/Services/{service_sid}/Roles`
  - `users` — `/v1/Services/{service_sid}/Users`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `date_created` | Format: date-time |
  | `date_updated` | Format: date-time |
  | `links` | Format: uri-map |
  | `url` | Format: uri |
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
          notifications: String.t() | nil,
          post_webhook_url: String.t() | nil,
          pre_webhook_url: String.t() | nil,
          reachability_enabled: boolean() | nil,
          read_status_enabled: boolean() | nil,
          sid: String.t() | nil,
          typing_indicator_timeout: integer(),
          url: String.t() | nil,
          webhook_filters: list() | nil,
          webhook_method: String.t() | nil,
          webhooks: String.t() | nil
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
    :notifications,
    :post_webhook_url,
    :pre_webhook_url,
    :reachability_enabled,
    :read_status_enabled,
    :sid,
    :typing_indicator_timeout,
    :url,
    :webhook_filters,
    :webhook_method,
    :webhooks
  ]

  @object_name "ip_messaging.v1.service"
  def object_name, do: @object_name

  @sid_prefix "IS"
  def sid_prefix, do: @sid_prefix
end
