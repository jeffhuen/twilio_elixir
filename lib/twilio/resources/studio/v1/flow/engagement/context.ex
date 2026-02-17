# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Studio.V1.Flow.Engagement.Context do
  @moduledoc """
  [DEPRECATED] JSON context for engagements

  Parent: `/Flows/{FlowSid}/Engagements/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the Account. |
  | `context` | As your flow executes, we save the state in what's called the Flow Context. Any data in the flow context can be accessed by your widgets as variables, either in configuration fields or in text areas as variable substitution. |
  | `engagement_sid` | The SID of the Engagement. |
  | `flow_sid` | The SID of the Flow. |
  | `url` | The URL of the resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          context: String.t() | nil,
          engagement_sid: String.t() | nil,
          flow_sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:account_sid, :context, :engagement_sid, :flow_sid, :url]

  @object_name "studio.v1.flow.engagement.engagement_context"
  def object_name, do: @object_name
end
