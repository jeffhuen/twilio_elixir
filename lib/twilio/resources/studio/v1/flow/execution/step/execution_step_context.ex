# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Studio.V1.Flow.Execution.Step.ExecutionStepContext do
  @moduledoc """
  JSON context for an individual step within an execution

  Parent: `/Flows/{FlowSid}/Executions/{ExecutionSid}/Steps/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the ExecutionStepContext resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `context` | The current state of the Flow's Execution. As a flow executes, we save its state in this context. We save data that your widgets can access as variables in configuration fields or in text areas as variable substitution.. PII: standard |
  | `execution_sid` | The SID of the context's Execution resource. |
  | `flow_sid` | The SID of the Flow. |
  | `step_sid` | The SID of the Step that the context is associated with. |
  | `url` | The absolute URL of the resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          context: String.t() | nil,
          execution_sid: String.t() | nil,
          flow_sid: String.t() | nil,
          step_sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:account_sid, :context, :execution_sid, :flow_sid, :step_sid, :url]

  @object_name "studio.v1.flow.execution.execution_step.execution_step_context"
  def object_name, do: @object_name
end
