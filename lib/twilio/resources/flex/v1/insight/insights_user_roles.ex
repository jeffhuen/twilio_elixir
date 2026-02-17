# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Flex.V1.Insight.InsightsUserRoles do
  @moduledoc """


  ## Properties

  | Field | Description |
  |-------|-------------|
  | `roles` | Flex Insights roles for the user |
  | `url` | Format: uri |
  """

  @type t :: %__MODULE__{
          roles: list() | nil,
          url: String.t() | nil
        }

  defstruct [:roles, :url]

  @object_name "flex.v1.insights_user_roles"
  def object_name, do: @object_name
end
