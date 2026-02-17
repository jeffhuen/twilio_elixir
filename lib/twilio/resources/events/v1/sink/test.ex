# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Events.V1.Sink.Test do
  @moduledoc """
  Test sink

  Parent: `/Sinks/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `result` | Feedback indicating whether the test event was generated. |
  """

  @type t :: %__MODULE__{
          result: String.t() | nil
        }

  defstruct [:result]

  @object_name "events.v1.sink.sink_test"
  def object_name, do: @object_name
end
