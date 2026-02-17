# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Studio.V2.Flow.FlowTestUser do
  @moduledoc """
  Test users of a flow

  SID prefix: `FW`

  Parent: `/Flows/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `sid` | Unique identifier of the flow. |
  | `test_users` | List of test user identities that can test draft versions of the flow. |
  | `url` | The URL of this resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          sid: String.t() | nil,
          test_users: list() | nil,
          url: String.t() | nil
        }

  defstruct [:sid, :test_users, :url]

  @object_name "studio.v2.flow.test_user"
  def object_name, do: @object_name

  @sid_prefix "FW"
  def sid_prefix, do: @sid_prefix
end
