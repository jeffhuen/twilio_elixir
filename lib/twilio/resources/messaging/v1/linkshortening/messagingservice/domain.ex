# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Messaging.V1.Linkshortening.Messagingservice.Domain do
  @moduledoc """


  ## Properties

  | Field | Description |
  |-------|-------------|
  | `domain_sid` | The unique string that we created to identify the Domain resource. |
  | `messaging_service_sid` | The unique string that identifies the messaging service |
  | `url` | Format: uri |
  """

  @type t :: %__MODULE__{
          domain_sid: String.t() | nil,
          messaging_service_sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:domain_sid, :messaging_service_sid, :url]

  @object_name "messaging.v1.linkshortening_messaging_service_domain_association"
  def object_name, do: @object_name
end
