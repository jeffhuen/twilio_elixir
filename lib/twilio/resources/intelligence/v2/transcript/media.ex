# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Intelligence.V2.Transcript.Media do
  @moduledoc """
  Media resource.

  SID prefix: `GT`

  Parent: `/Transcripts/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The unique SID identifier of the Account. |
  | `media_url` | Downloadable URL for media, if stored in Twilio AI.. Format: uri |
  | `service_sid` | The unique SID identifier of the Service. |
  | `sid` | The unique SID identifier of the Transcript. |
  | `url` | The URL of this resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          media_url: String.t() | nil,
          service_sid: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:account_sid, :media_url, :service_sid, :sid, :url]

  @object_name "intelligence.v2.transcript.media"
  def object_name, do: @object_name

  @sid_prefix "GT"
  def sid_prefix, do: @sid_prefix
end
