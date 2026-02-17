# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Sync.V1.Service.Map.Permission do
  @moduledoc """


  Parent: `/Services/{ServiceSid}/Maps/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Sync Map Permission resource. |
  | `identity` | The application-defined string that uniquely identifies the resource's User within the Service to an FPA token.. PII: standard |
  | `manage` | Whether the identity can delete the Sync Map. |
  | `map_sid` | The SID of the Sync Map to which the Permission applies. |
  | `read` | Whether the identity can read the Sync Map and its Items. |
  | `service_sid` | The SID of the [Sync Service](https://www.twilio.com/docs/sync/api/service) the resource is associated with. |
  | `url` | The absolute URL of the Sync Map Permission resource.. Format: uri |
  | `write` | Whether the identity can create, update, and delete Items in the Sync Map. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          identity: String.t() | nil,
          manage: boolean() | nil,
          map_sid: String.t() | nil,
          read: boolean() | nil,
          service_sid: String.t() | nil,
          url: String.t() | nil,
          write: boolean() | nil
        }

  defstruct [:account_sid, :identity, :manage, :map_sid, :read, :service_sid, :url, :write]

  @object_name "sync.v1.service.sync_map.sync_map_permission"
  def object_name, do: @object_name
end
