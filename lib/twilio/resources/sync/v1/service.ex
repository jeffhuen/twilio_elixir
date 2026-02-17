# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Sync.V1.Service do
  @moduledoc """
  Containers for sync objects

  SID prefix: `IS`

  ## Sub-resources
  - `documents` — `/v1/Services/{service_sid}/Documents`
  - `lists` — `/v1/Services/{service_sid}/Lists`
  - `maps` — `/v1/Services/{service_sid}/Maps`
  - `streams` — `/v1/Services/{service_sid}/Streams`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Service resource. |
  | `acl_enabled` | Whether token identities in the Service must be granted access to Sync objects by using the [Permissions](https://www.twilio.com/docs/sync/api/sync-permissions) resource. It is disabled (false) by default. |
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `friendly_name` | The string that you assigned to describe the resource.. PII: standard |
  | `links` | The URLs of related resources.. Format: uri-map |
  | `reachability_debouncing_enabled` | Whether every `endpoint_disconnected` event should occur after a configurable delay. The default is `false`, where the `endpoint_disconnected` event occurs immediately after disconnection. When `true`, intervening reconnections can prevent the `endpoint_disconnected` event. |
  | `reachability_debouncing_window` | The reachability event delay in milliseconds if `reachability_debouncing_enabled` = `true`.  Must be between 1,000 and 30,000 and defaults to 5,000. This is the number of milliseconds after the last running client disconnects, and a Sync identity is declared offline, before `webhook_url` is called, if all endpoints remain offline. A reconnection from the same identity by any endpoint during this interval prevents the reachability event from occurring. |
  | `reachability_webhooks_enabled` | Whether the service instance calls `webhook_url` when client endpoints connect to Sync. The default is `false`. |
  | `sid` | The unique string that we created to identify the Service resource. |
  | `unique_name` | An application-defined string that uniquely identifies the resource. It can be used in place of the resource's `sid` in the URL to address the resource. It is a read-only property, it cannot be assigned using REST API. |
  | `url` | The absolute URL of the Service resource.. Format: uri |
  | `webhook_url` | The URL we call when Sync objects are manipulated.. Format: uri |
  | `webhooks_from_rest_enabled` | Whether the Service instance should call `webhook_url` when the REST API is used to update Sync objects. The default is `false`. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          acl_enabled: boolean() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          links: map() | nil,
          reachability_debouncing_enabled: boolean() | nil,
          reachability_debouncing_window: integer(),
          reachability_webhooks_enabled: boolean() | nil,
          sid: String.t() | nil,
          unique_name: String.t() | nil,
          url: String.t() | nil,
          webhook_url: String.t() | nil,
          webhooks_from_rest_enabled: boolean() | nil
        }

  defstruct [
    :account_sid,
    :acl_enabled,
    :date_created,
    :date_updated,
    :friendly_name,
    :links,
    :reachability_debouncing_enabled,
    :reachability_debouncing_window,
    :reachability_webhooks_enabled,
    :sid,
    :unique_name,
    :url,
    :webhook_url,
    :webhooks_from_rest_enabled
  ]

  @object_name "sync.v1.service"
  def object_name, do: @object_name

  @sid_prefix "IS"
  def sid_prefix, do: @sid_prefix
end
