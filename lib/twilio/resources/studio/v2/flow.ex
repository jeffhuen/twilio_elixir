# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Studio.V2.Flow do
  @moduledoc """
  Studio flows

  SID prefix: `FW`

  ## Sub-resources
  - `executions` — `/v2/Flows/{flow_sid}/Executions`
  - `revisions` — `/v2/Flows/{sid}/Revisions`
  - `test_users` — `/v2/Flows/{sid}/TestUsers`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Flow resource. |
  | `commit_message` | Description of change made in the revision. |
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `definition` | JSON representation of flow definition. |
  | `errors` | List of error in the flow definition. |
  | `friendly_name` | The string that you assigned to describe the Flow. |
  | `links` | The URLs of the Flow's nested resources.. Format: uri-map |
  | `revision` | The latest revision number of the Flow's definition. |
  | `sid` | The unique string that we created to identify the Flow resource. |
  | `status` | The status of the Flow. Can be: `draft` or `published`.. Values: `draft`, `published` |
  | `url` | The absolute URL of the resource.. Format: uri |
  | `valid` | Boolean if the flow definition is valid. |
  | `warnings` | List of warnings in the flow definition. |
  | `webhook_url` | Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          commit_message: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          definition: String.t() | nil,
          errors: list() | nil,
          friendly_name: String.t() | nil,
          links: map() | nil,
          revision: integer(),
          sid: String.t() | nil,
          status: String.t(),
          url: String.t() | nil,
          valid: boolean() | nil,
          warnings: list() | nil,
          webhook_url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :commit_message,
    :date_created,
    :date_updated,
    :definition,
    :errors,
    :friendly_name,
    :links,
    :revision,
    :sid,
    :status,
    :url,
    :valid,
    :warnings,
    :webhook_url
  ]

  @object_name "studio.v2.flow"
  def object_name, do: @object_name

  @sid_prefix "FW"
  def sid_prefix, do: @sid_prefix
end
