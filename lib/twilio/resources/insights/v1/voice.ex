# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Insights.V1.Voice do
  @moduledoc """


  SID prefix: `CA`

  ## Sub-resources
  - `annotation` — `/v1/Voice/{call_sid}/Annotation`
  - `events` — `/v1/Voice/{call_sid}/Events`
  - `metrics` — `/v1/Voice/{call_sid}/Metrics`
  - `summary` — `/v1/Voice/{call_sid}/Summary`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `links` | Format: uri-map |
  | `url` | Format: uri |
  """

  @type t :: %__MODULE__{
          links: map() | nil,
          sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:links, :sid, :url]

  @object_name "insights.v1.call"
  def object_name, do: @object_name

  @sid_prefix "CA"
  def sid_prefix, do: @sid_prefix
end
