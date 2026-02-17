# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Numbers.V1.Porting.Configuration.Webhook do
  @moduledoc """


  ## Properties

  | Field | Description |
  |-------|-------------|
  | `notifications_of` | A list to filter what notification events to receive for this account and its sub accounts. If it is an empty list, then it means that there are no filters for the notifications events to send in each webhook and all events will get sent. |
  | `port_in_target_date_created` | Creation date for the port in webhook configuration. Format: date-time |
  | `port_in_target_url` | The complete webhook url that will be called when a notification event for port in request or port in phone number happens. Format: uri |
  | `port_out_target_date_created` | Creation date for the port out webhook configuration. Format: date-time |
  | `port_out_target_url` | The complete webhook url that will be called when a notification event for a port out phone number happens.. Format: uri |
  | `url` | The URL of the webhook configuration request. Format: uri |
  """

  @type t :: %__MODULE__{
          notifications_of: list() | nil,
          port_in_target_date_created: String.t() | nil,
          port_in_target_url: String.t() | nil,
          port_out_target_date_created: String.t() | nil,
          port_out_target_url: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :notifications_of,
    :port_in_target_date_created,
    :port_in_target_url,
    :port_out_target_date_created,
    :port_out_target_url,
    :url
  ]

  @object_name "numbers.v1.porting_webhook_configuration_fetch"
  def object_name, do: @object_name
end
