# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Marketplace.V1.Installedaddon do
  @moduledoc """


  SID prefix: `XE`

  ## Sub-resources
  - `extensions` — `/v1/InstalledAddOns/{installed_add_on_sid}/Extensions`
  - `usage` — `/v1/InstalledAddOns/{installed_add_on_sid}/Usage`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the InstalledAddOn resource. |
  | `configuration` | The JSON object that represents the current configuration of installed Add-on. |
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `description` | A short description of the Add-on's functionality. |
  | `friendly_name` | The string that you assigned to describe the resource. |
  | `links` | The URLs of related resources.. Format: uri-map |
  | `sid` | The unique string that we created to identify the InstalledAddOn resource. This Sid can also be found in the Console on that specific Add-ons page as the 'Available Add-on Sid'. |
  | `unique_name` | An application-defined string that uniquely identifies the resource. |
  | `url` | The absolute URL of the resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          configuration: map() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          description: String.t() | nil,
          friendly_name: String.t() | nil,
          links: map() | nil,
          sid: String.t() | nil,
          unique_name: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :configuration,
    :date_created,
    :date_updated,
    :description,
    :friendly_name,
    :links,
    :sid,
    :unique_name,
    :url
  ]

  @object_name "marketplace.v1.installed_add_on"
  def object_name, do: @object_name

  @sid_prefix "XE"
  def sid_prefix, do: @sid_prefix
end
