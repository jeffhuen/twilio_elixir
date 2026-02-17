# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Sync.V1.Service.List.Permission do
  @moduledoc """
  Permissions for Sync list items

  Parent: `/Services/{ServiceSid}/Lists/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Sync List Permission resource. |
  | `identity` | The application-defined string that uniquely identifies the resource's User within the Service to an FPA token.. PII: standard |
  | `list_sid` | The SID of the Sync List to which the Permission applies. |
  | `manage` | Whether the identity can delete the Sync List. |
  | `read` | Whether the identity can read the Sync List and its Items. |
  | `service_sid` | The SID of the [Sync Service](https://www.twilio.com/docs/sync/api/service) the resource is associated with. |
  | `url` | The absolute URL of the Sync List Permission resource.. Format: uri |
  | `write` | Whether the identity can create, update, and delete Items in the Sync List. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          identity: String.t() | nil,
          list_sid: String.t() | nil,
          manage: boolean() | nil,
          read: boolean() | nil,
          service_sid: String.t() | nil,
          url: String.t() | nil,
          write: boolean() | nil
        }

  defstruct [:account_sid, :identity, :list_sid, :manage, :read, :service_sid, :url, :write]

  @object_name "sync.v1.service.sync_list.sync_list_permission"
  def object_name, do: @object_name
end
