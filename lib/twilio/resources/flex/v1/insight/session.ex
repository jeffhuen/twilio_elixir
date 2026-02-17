# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Flex.V1.Insight.Session do
  @moduledoc """
  Session resource.

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `base_url` | The base URL to fetch reports and dashboards |
  | `session_expiry` | The session expiry date and time, given in ISO 8601 format. |
  | `session_id` | The unique ID for the session |
  | `url` | The URL of this resource.. Format: uri |
  | `workspace_id` | Unique ID to identify the user's workspace |
  """

  @type t :: %__MODULE__{
          base_url: String.t() | nil,
          session_expiry: String.t() | nil,
          session_id: String.t() | nil,
          url: String.t() | nil,
          workspace_id: String.t() | nil
        }

  defstruct [:base_url, :session_expiry, :session_id, :url, :workspace_id]

  @object_name "flex.v1.insights_session"
  def object_name, do: @object_name
end
