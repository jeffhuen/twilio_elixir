# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Intelligence.V3.ControlPlane.Configuration do
  @moduledoc """
  Configuration resource.

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `actions` | List of Actions to be performed after the Rule is triggered. Maximum of two (2) Actions allowed per Rule. |
  | `id` | The unique identifier for the Rule. Assigned by Twilio (TTID). |
  | `operators` | List of Operators to be executed by the Rule. Maximum of five (5) Operators allowed per Rule. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `triggers` | List of Triggers that determine when to activate the Rule. Maximum of one (1) Trigger allowed per Rule. |
  """

  @type t :: %__MODULE__{
          actions: list(),
          context: String.t(),
          id: String.t(),
          operators: list(),
          triggers: list()
        }

  defstruct [:actions, :context, :id, :operators, :triggers]

  @object_name "Rule"
  def object_name, do: @object_name
end
