# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Preview.Marketplace.AvailableAddOn.AvailableAddOnExtension do
  @moduledoc """
  AvailableAddOnExtension resource.

  SID prefix: `XF`

  Parent: `/AvailableAddOns/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `available_add_on_sid` | The SID of the AvailableAddOn resource to which this extension applies. |
  | `friendly_name` | The string that you assigned to describe the resource. |
  | `product_name` | The name of the Product this Extension is used within. |
  | `sid` | The unique string that we created to identify the AvailableAddOnExtension resource. |
  | `unique_name` | An application-defined string that uniquely identifies the resource. |
  | `url` | The absolute URL of the resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          available_add_on_sid: String.t() | nil,
          friendly_name: String.t() | nil,
          product_name: String.t() | nil,
          sid: String.t() | nil,
          unique_name: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:available_add_on_sid, :friendly_name, :product_name, :sid, :unique_name, :url]

  @object_name "preview.marketplace.available_add_on.available_add_on_extension"
  def object_name, do: @object_name

  @sid_prefix "XF"
  def sid_prefix, do: @sid_prefix
end
