# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Studio.V1.Flow do
  @moduledoc """
  Studio flows

  SID prefix: `FW`

  ## Sub-resources
  - `engagements` — `/v1/Flows/{flow_sid}/Engagements`
  - `executions` — `/v1/Flows/{flow_sid}/Executions`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Flow resource. |
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `friendly_name` | The string that you assigned to describe the Flow. |
  | `links` | The URLs of the Flow's nested resources.. Format: uri-map |
  | `sid` | The unique string that we created to identify the Flow resource. |
  | `status` | The status of the Flow. Can be: `draft` or `published`.. Values: `draft`, `published` |
  | `url` | The absolute URL of the resource.. Format: uri |
  | `version` | The latest version number of the Flow's definition. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          links: map() | nil,
          sid: String.t() | nil,
          status: String.t(),
          url: String.t() | nil,
          version: integer()
        }

  defstruct [
    :account_sid,
    :date_created,
    :date_updated,
    :friendly_name,
    :links,
    :sid,
    :status,
    :url,
    :version
  ]

  @object_name "studio.v1.flow"
  def object_name, do: @object_name

  @sid_prefix "FW"
  def sid_prefix, do: @sid_prefix
end
