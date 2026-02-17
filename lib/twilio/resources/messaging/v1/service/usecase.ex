# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Messaging.V1.Service.Usecase do
  @moduledoc """
  Use Case resource. Fetch possible use cases for a Messaging Service.

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `usecases` | Human readable use case details (usecase, description and purpose) of Messaging Service Use Cases. |
  """

  @type t :: %__MODULE__{
          usecases: list() | nil
        }

  defstruct [:usecases]

  @object_name "messaging.v1.usecase"
  def object_name, do: @object_name
end
