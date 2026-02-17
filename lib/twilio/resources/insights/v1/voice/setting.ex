# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Insights.V1.Voice.Setting do
  @moduledoc """
  Setting resource.

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The unique SID identifier of the Account. |
  | `advanced_features` | A boolean flag indicating whether Advanced Features for Voice Insights are enabled. |
  | `url` | The URL of this resource.. Format: uri |
  | `voice_trace` | A boolean flag indicating whether Voice Trace is enabled. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          advanced_features: boolean() | nil,
          url: String.t() | nil,
          voice_trace: boolean() | nil
        }

  defstruct [:account_sid, :advanced_features, :url, :voice_trace]

  @object_name "insights.v1.account_settings"
  def object_name, do: @object_name
end
