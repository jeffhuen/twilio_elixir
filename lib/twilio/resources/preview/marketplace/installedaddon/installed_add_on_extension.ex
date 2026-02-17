# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Preview.Marketplace.Installedaddon.InstalledAddOnExtension do
  @moduledoc """
  InstalledAddOnExtension resource.

  SID prefix: `XF`

  Parent: `/InstalledAddOns/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `enabled` | Whether the Extension will be invoked. |
  | `friendly_name` | The string that you assigned to describe the resource. |
  | `installed_add_on_sid` | The SID of the InstalledAddOn resource to which this extension applies. |
  | `product_name` | The name of the Product this Extension is used within. |
  | `sid` | The unique string that we created to identify the InstalledAddOn Extension resource. |
  | `unique_name` | An application-defined string that uniquely identifies the resource. |
  | `url` | The absolute URL of the resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          enabled: boolean() | nil,
          friendly_name: String.t() | nil,
          installed_add_on_sid: String.t() | nil,
          product_name: String.t() | nil,
          sid: String.t() | nil,
          unique_name: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :enabled,
    :friendly_name,
    :installed_add_on_sid,
    :product_name,
    :sid,
    :unique_name,
    :url
  ]

  @object_name "preview.marketplace.installed_add_on.installed_add_on_extension"
  def object_name, do: @object_name

  @sid_prefix "XF"
  def sid_prefix, do: @sid_prefix
end
