# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Flex.V1.Webchannel do
  @moduledoc """


  SID prefix: `CH`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the WebChannel resource and owns this Workflow. |
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `flex_flow_sid` | The SID of the Flex Flow. |
  | `sid` | The unique string that we created to identify the WebChannel resource. |
  | `url` | The absolute URL of the WebChannel resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          flex_flow_sid: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:account_sid, :date_created, :date_updated, :flex_flow_sid, :sid, :url]

  @object_name "flex.v1.web_channel"
  def object_name, do: @object_name

  @sid_prefix "CH"
  def sid_prefix, do: @sid_prefix
end
