# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Flex.V1.Pluginservice.Plugin.PluginVersions do
  @moduledoc """
  PluginVersions resource.

  SID prefix: `FV`

  Parent: `/PluginService/Plugins/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Flex Plugin Version resource and owns this resource. |
  | `archived` | Whether the Flex Plugin Version is archived. The default value is false. |
  | `changelog` | A changelog that describes the changes this Flex Plugin Version brings.. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the Flex Plugin Version was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `plugin_sid` | The SID of the Flex Plugin resource this Flex Plugin Version belongs to. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `plugin_url` | The URL of where the Flex Plugin Version JavaScript bundle is hosted on.. Format: uri. PII: standard |
  | `private` | Whether the Flex Plugin Version is validated. The default value is false. |
  | `sid` | The unique string that we created to identify the Flex Plugin Version resource. |
  | `url` | The absolute URL of the Flex Plugin Version resource.. Format: uri |
  | `version` | The unique version of this Flex Plugin Version. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          archived: boolean() | nil,
          changelog: String.t() | nil,
          date_created: String.t() | nil,
          plugin_sid: String.t() | nil,
          plugin_url: String.t() | nil,
          private: boolean() | nil,
          sid: String.t() | nil,
          url: String.t() | nil,
          validated: boolean() | nil,
          version: String.t() | nil
        }

  defstruct [
    :account_sid,
    :archived,
    :changelog,
    :date_created,
    :plugin_sid,
    :plugin_url,
    :private,
    :sid,
    :url,
    :validated,
    :version
  ]

  @object_name "flex.v1.plugin.plugin_version"
  def object_name, do: @object_name

  @sid_prefix "FV"
  def sid_prefix, do: @sid_prefix
end
