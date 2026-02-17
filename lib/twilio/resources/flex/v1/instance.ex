# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Flex.V1.Instance do
  @moduledoc """


  ## Properties

  | Field | Description |
  |-------|-------------|
  | `date_created` | Format: date-time |
  | `date_updated` | Format: date-time |
  | `status` | Values: `unknown`, `creation-in-progress`, `ready`, `creation-failed`, `deletion-in-progress`, `deleted`, `deletion-failed` |
  """

  @type t :: %__MODULE__{
          account_sid: String.t(),
          date_created: String.t(),
          date_updated: String.t(),
          flex_instance_sid: String.t(),
          status: String.t()
        }

  defstruct [:account_sid, :date_created, :date_updated, :flex_instance_sid, :status]

  @object_name "flex.v1.instance"
  def object_name, do: @object_name
end
