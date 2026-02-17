# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Studio.V1.Flow.Engagement.Step.Context do
  @moduledoc """
  JSON context for individual steps

  Parent: `/Flows/{FlowSid}/Engagements/{EngagementSid}/Steps/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the StepContext resource. |
  | `context` | The current state of the Flow's Execution. As a flow executes, we save its state in this context. We save data that your widgets can access as variables in configuration fields or in text areas as variable substitution.. PII: standard |
  | `engagement_sid` | The SID of the Engagement. |
  | `flow_sid` | The SID of the Flow. |
  | `step_sid` | The SID of the Step the context is associated with. |
  | `url` | The absolute URL of the resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          context: String.t() | nil,
          engagement_sid: String.t() | nil,
          flow_sid: String.t() | nil,
          step_sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:account_sid, :context, :engagement_sid, :flow_sid, :step_sid, :url]

  @object_name "studio.v1.flow.engagement.step.step_context"
  def object_name, do: @object_name
end
