# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Marketplace.V1.Availableaddon do
  @moduledoc """
  Availableaddon resource.

  SID prefix: `XB`

  ## Sub-resources
  - `extensions` — `/v1/AvailableAddOns/{available_add_on_sid}/Extensions`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `configuration_schema` | The JSON object with the configuration that must be provided when installing a given Add-on. |
  | `description` | A short description of the Add-on's functionality. |
  | `friendly_name` | The string that you assigned to describe the resource. |
  | `links` | The URLs of related resources.. Format: uri-map |
  | `pricing_type` | How customers are charged for using this Add-on. |
  | `sid` | The unique string that we created to identify the AvailableAddOn resource. |
  | `url` | The absolute URL of the resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          configuration_schema: map() | nil,
          description: String.t() | nil,
          friendly_name: String.t() | nil,
          links: map() | nil,
          pricing_type: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :configuration_schema,
    :description,
    :friendly_name,
    :links,
    :pricing_type,
    :sid,
    :url
  ]

  @object_name "marketplace.v1.available_add_on"
  def object_name, do: @object_name

  @sid_prefix "XB"
  def sid_prefix, do: @sid_prefix
end
