# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Flex.V1.Pluginservice.Configuration do
  @moduledoc """


  SID prefix: `FJ`

  ## Sub-resources
  - `plugins` — `/v1/PluginService/Configurations/{configuration_sid}/Plugins`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Flex Plugin Configuration resource and owns this resource. |
  | `archived` | Whether the Flex Plugin Configuration is archived. The default value is false. |
  | `date_created` | The date and time in GMT when the Flex Plugin Configuration was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `description` | The description of the Flex Plugin Configuration resource.. PII: standard |
  | `links` | Format: uri-map |
  | `name` | The name of this Flex Plugin Configuration. |
  | `sid` | The unique string that we created to identify the Flex Plugin Configuration resource. |
  | `url` | The absolute URL of the Flex Plugin Configuration resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          archived: boolean() | nil,
          date_created: String.t() | nil,
          description: String.t() | nil,
          links: map() | nil,
          name: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:account_sid, :archived, :date_created, :description, :links, :name, :sid, :url]

  @object_name "flex.v1.plugin_configuration"
  def object_name, do: @object_name

  @sid_prefix "FJ"
  def sid_prefix, do: @sid_prefix
end
