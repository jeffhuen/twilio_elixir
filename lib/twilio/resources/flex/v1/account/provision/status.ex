# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Flex.V1.Account.Provision.Status do
  @moduledoc """
  Status for email provisioning

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `status` | Email Provisioning Status. Values: `active`, `in-progress`, `not-configured`, `failed` |
  | `url` | The absolute URL of the resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          status: String.t(),
          url: String.t() | nil
        }

  defstruct [:status, :url]

  @object_name "flex.v1.provisioning_status"
  def object_name, do: @object_name
end
