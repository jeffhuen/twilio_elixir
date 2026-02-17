# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Messaging.V1.Linkshortening.Domain.Validatedn do
  @moduledoc """


  ## Properties

  | Field | Description |
  |-------|-------------|
  | `domain_sid` | The unique string that we created to identify the Domain resource. |
  | `url` | Format: uri |
  """

  @type t :: %__MODULE__{
          domain_sid: String.t() | nil,
          is_valid: boolean() | nil,
          reason: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:domain_sid, :is_valid, :reason, :url]

  @object_name "messaging.v1.domain_dns_validation"
  def object_name, do: @object_name
end
