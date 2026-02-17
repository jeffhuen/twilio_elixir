# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Flex.V1.Pluginservice.Release do
  @moduledoc """


  SID prefix: `FK`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Plugin Release resource and owns this resource. |
  | `configuration_sid` | The SID of the Plugin Configuration resource to release. |
  | `date_created` | The date and time in GMT when the Flex Plugin Release was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `sid` | The unique string that we created to identify the Plugin Release resource. |
  | `url` | The absolute URL of the Plugin Release resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          configuration_sid: String.t() | nil,
          date_created: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:account_sid, :configuration_sid, :date_created, :sid, :url]

  @object_name "flex.v1.plugin_release"
  def object_name, do: @object_name

  @sid_prefix "FK"
  def sid_prefix, do: @sid_prefix
end
