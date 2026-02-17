# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Flex.V1.Channel do
  @moduledoc """
  Flex chat channels

  SID prefix: `CH`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Channel resource and owns this Workflow. |
  | `date_created` | The date and time in GMT when the Flex chat channel was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `date_updated` | The date and time in GMT when the Flex chat channel was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `flex_flow_sid` | The SID of the Flex Flow. |
  | `sid` | The unique string that we created to identify the Channel resource. |
  | `task_sid` | The SID of the TaskRouter Task. Only valid when integration type is `task`. `null` for integration types `studio` & `external` |
  | `url` | The absolute URL of the Flex chat channel resource.. Format: uri |
  | `user_sid` | The SID of the chat user. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          flex_flow_sid: String.t() | nil,
          sid: String.t() | nil,
          task_sid: String.t() | nil,
          url: String.t() | nil,
          user_sid: String.t() | nil
        }

  defstruct [
    :account_sid,
    :date_created,
    :date_updated,
    :flex_flow_sid,
    :sid,
    :task_sid,
    :url,
    :user_sid
  ]

  @object_name "flex.v1.channel"
  def object_name, do: @object_name

  @sid_prefix "CH"
  def sid_prefix, do: @sid_prefix
end
