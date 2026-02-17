# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Numbers.V1.Porting.Portin.Portinrequest do
  @moduledoc """
  Portinrequest resource.

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `phone_numbers_ported` | Amount of phone numbers ported |
  | `phone_numbers_requested` | Amount of phone numbers requested |
  | `port_in_request_sid` | The SID of the Port-in request |
  | `port_in_request_status` | Status of the Port In Request |
  | `status_last_updated_timestamp` | The last updated timestamp of the request |
  | `suggested_action` | Suggested action on this ticket |
  """

  @type t :: %__MODULE__{
          phone_numbers_ported: integer() | nil,
          phone_numbers_requested: integer() | nil,
          port_in_request_sid: String.t(),
          port_in_request_status: String.t() | nil,
          status_last_updated_timestamp: String.t() | nil,
          suggested_action: String.t() | nil
        }

  defstruct [
    :phone_numbers_ported,
    :phone_numbers_requested,
    :port_in_request_sid,
    :port_in_request_status,
    :status_last_updated_timestamp,
    :suggested_action
  ]

  @object_name "numbers.v1.port_in_request_list"
  def object_name, do: @object_name
end
