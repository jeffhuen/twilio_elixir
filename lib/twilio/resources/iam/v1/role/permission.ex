# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Iam.V1.Role.Permission do
  @moduledoc """
  Permission resource.

  SID prefix: `IZ`

  Parent: `/v1/Roles/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `action` | The action granted by the permission (e.g., read). |
  | `externalDescription` | The external description of the permission. |
  | `namespace` | The namespace of the permission (e.g., twilio). |
  | `product` | The product the permission belongs to (e.g., iam). |
  | `resource` | The resource the permission applies to (e.g., roles). |
  | `sid` | The unique string that identifies the Permission resource. |
  """

  @type t :: %__MODULE__{
          action: String.t() | nil,
          externalDescription: String.t() | nil,
          namespace: String.t() | nil,
          product: String.t() | nil,
          resource: String.t() | nil,
          sid: String.t() | nil
        }

  defstruct [:action, :externalDescription, :namespace, :product, :resource, :sid]

  @object_name "iam.v1.role_permission"
  def object_name, do: @object_name

  @sid_prefix "IZ"
  def sid_prefix, do: @sid_prefix
end
