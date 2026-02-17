# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Bulkexports.V1.Export.Configuration do
  @moduledoc """


  ## Properties

  | Field | Description |
  |-------|-------------|
  | `enabled` | If true, Twilio will automatically generate every day's file when the day is over. |
  | `resource_type` | The type of communication – Messages, Calls, Conferences, and Participants |
  | `url` | The URL of this resource.. Format: uri |
  | `webhook_method` | Sets whether Twilio should call a webhook URL when the automatic generation is complete, using GET or POST. The actual destination is set in the webhook_url |
  | `webhook_url` | Stores the URL destination for the method specified in webhook_method.. Format: uri |
  """

  @type t :: %__MODULE__{
          enabled: boolean() | nil,
          resource_type: String.t() | nil,
          url: String.t() | nil,
          webhook_method: String.t() | nil,
          webhook_url: String.t() | nil
        }

  defstruct [:enabled, :resource_type, :url, :webhook_method, :webhook_url]

  @object_name "bulkexports.v1.export_configuration"
  def object_name, do: @object_name
end
