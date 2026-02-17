# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Trunking.V1.Trunk.Recording do
  @moduledoc """
  Recording settings for a trunk

  Parent: `/Trunks/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `mode` | The recording mode for the trunk. Can be do-not-record (default), record-from-ringing, record-from-answer, record-from-ringing-dual, or record-from-answer-dual.. Values: `do-not-record`, `record-from-ringing`, `record-from-answer`, `record-from-ringing-dual`, `record-from-answer-dual` |
  | `trim` | The recording trim setting for the trunk. Can be do-not-trim (default) or trim-silence.. Values: `trim-silence`, `do-not-trim` |
  """

  @type t :: %__MODULE__{
          mode: String.t(),
          trim: String.t()
        }

  defstruct [:mode, :trim]

  @object_name "trunking.v1.trunk.recording"
  def object_name, do: @object_name
end
