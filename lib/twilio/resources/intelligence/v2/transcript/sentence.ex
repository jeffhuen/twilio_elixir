# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Intelligence.V2.Transcript.Sentence do
  @moduledoc """


  Parent: `/Transcripts/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `location` | The location of the encrypted sentences.. Format: uri |
  | `url` | Format: uri |
  """

  @type t :: %__MODULE__{
          location: String.t() | nil,
          transcript_sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:location, :transcript_sid, :url]

  @object_name "intelligence.v2.transcript.encrypted_sentences"
  def object_name, do: @object_name
end
