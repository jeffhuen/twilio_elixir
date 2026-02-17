# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Intelligence.V2.Service.OperatorAttachments do
  @moduledoc """


  ## Properties

  | Field | Description |
  |-------|-------------|
  | `operator_sids` | List of Operator SIDs attached to the service. Includes both Custom and Pre-built Operators. |
  | `service_sid` | The unique SID identifier of the Service. |
  | `url` | The URL of this resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          operator_sids: list() | nil,
          service_sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:operator_sids, :service_sid, :url]

  @object_name "intelligence.v2.operator_attachments"
  def object_name, do: @object_name
end
