# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Intelligence.V2.Transcript.Operatorresult do
  @moduledoc """


  Parent: `/Transcripts/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `locations` | The locations of the encrypted operator results. |
  | `url` | Format: uri |
  """

  @type t :: %__MODULE__{
          locations: list() | nil,
          transcript_sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:locations, :transcript_sid, :url]

  @object_name "intelligence.v2.transcript.encrypted_operator_results"
  def object_name, do: @object_name
end
