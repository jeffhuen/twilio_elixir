# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Intelligence.V3.OperatorResult do
  @moduledoc """
  OperatorResult resource.
  """

  @type t :: %__MODULE__{
          outputFormat: String.t()
        }

  defstruct [:outputFormat]

  @object_name "OperatorResultsResponseV1"
  def object_name, do: @object_name
end
