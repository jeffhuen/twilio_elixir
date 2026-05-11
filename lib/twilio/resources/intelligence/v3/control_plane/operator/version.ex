# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Intelligence.V3.ControlPlane.Operator.Version do
  @moduledoc """
  Version resource.

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `input` | A sample input text that demonstrates the type of content the Operator processes. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `output` | The expected output corresponding to the provided input example. This value must be consistent with the defined `output_format` and `output_schema` of the Operator. |
  """

  @type t :: %__MODULE__{
          input: String.t(),
          output: String.t()
        }

  defstruct [:input, :output]

  @object_name "OperatorTrainingExample"
  def object_name, do: @object_name
end
