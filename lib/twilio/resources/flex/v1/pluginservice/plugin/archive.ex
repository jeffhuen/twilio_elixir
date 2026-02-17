# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Flex.V1.Pluginservice.Plugin.Archive do
  @moduledoc """
  Archive resource.

  SID prefix: `FP`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Flex Plugin resource and owns this resource. |
  | `archived` | Whether the Flex Plugin is archived. The default value is false. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the Flex Plugin was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the Flex Plugin was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `description` | A descriptive string that you create to describe the plugin resource. It can be up to 500 characters long. PII: standard |
  | `friendly_name` | The friendly name this Flex Plugin resource.. PII: standard |
  | `sid` | The unique string that we created to identify the Flex Plugin resource. |
  | `unique_name` | The name that uniquely identifies this Flex Plugin resource.. PII: standard |
  | `url` | The absolute URL of the Flex Plugin resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          archived: boolean() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          description: String.t() | nil,
          friendly_name: String.t() | nil,
          sid: String.t() | nil,
          unique_name: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :archived,
    :date_created,
    :date_updated,
    :description,
    :friendly_name,
    :sid,
    :unique_name,
    :url
  ]

  @object_name "flex.v1.plugin_archive"
  def object_name, do: @object_name

  @sid_prefix "FP"
  def sid_prefix, do: @sid_prefix
end
