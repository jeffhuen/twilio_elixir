# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.IpMessaging.V2.Service.Binding do
  @moduledoc """


  SID prefix: `BS`

  Parent: `/Services/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `binding_type` | Values: `gcm`, `apn`, `fcm` |
  | `date_created` | Format: date-time |
  | `date_updated` | Format: date-time |
  | `links` | Format: uri-map |
  | `url` | Format: uri |
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

  @object_name "ip_messaging.v2.service.binding"
  def object_name, do: @object_name

  @sid_prefix "BS"
  def sid_prefix, do: @sid_prefix
end
