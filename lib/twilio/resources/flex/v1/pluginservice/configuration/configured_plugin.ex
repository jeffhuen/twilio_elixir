# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Flex.V1.Pluginservice.Configuration.ConfiguredPlugin do
  @moduledoc """


  Parent: `/PluginService/Configurations/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that the Flex Plugin resource is installed for. |
  | `changelog` | A changelog that describes the changes this Flex Plugin Version brings. |
  | `configuration_sid` | The SID of the Flex Plugin Configuration that this Flex Plugin belongs to. |
  | `date_created` | The date and time in GMT when the Flex Plugin was installed specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `description` | A descriptive string that you create to describe the plugin resource. It can be up to 500 characters long |
  | `friendly_name` | The friendly name of this Flex Plugin resource. |
  | `phase` | The phase this Flex Plugin would initialize at runtime. |
  | `plugin_archived` | Whether the Flex Plugin is archived. The default value is false. |
  | `plugin_sid` | The SID of the Flex Plugin. |
  | `plugin_url` | The URL of where the Flex Plugin Version JavaScript bundle is hosted on.. PII: standard |
  | `plugin_version_archived` | Whether the Flex Plugin Version is archived. The default value is false. |
  | `plugin_version_sid` | The SID of the Flex Plugin Version. |
  | `private` | Whether to validate the request is authorized to access the Flex Plugin Version. |
  | `unique_name` | The name that uniquely identifies this Flex Plugin resource.. PII: standard |
  | `url` | The absolute URL of the Flex Plugin resource.. Format: uri |
  | `version` | The latest version of this Flex Plugin Version. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          changelog: String.t() | nil,
          configuration_sid: String.t() | nil,
          date_created: String.t() | nil,
          description: String.t() | nil,
          friendly_name: String.t() | nil,
          phase: integer(),
          plugin_archived: boolean() | nil,
          plugin_sid: String.t() | nil,
          plugin_url: String.t() | nil,
          plugin_version_archived: boolean() | nil,
          plugin_version_sid: String.t() | nil,
          private: boolean() | nil,
          unique_name: String.t() | nil,
          url: String.t() | nil,
          version: String.t() | nil
        }

  defstruct [
    :account_sid,
    :changelog,
    :configuration_sid,
    :date_created,
    :description,
    :friendly_name,
    :phase,
    :plugin_archived,
    :plugin_sid,
    :plugin_url,
    :plugin_version_archived,
    :plugin_version_sid,
    :private,
    :unique_name,
    :url,
    :version
  ]

  @object_name "flex.v1.plugin_configuration.configured_plugin"
  def object_name, do: @object_name
end
