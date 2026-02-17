# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Supersim.V1.Network do
  @moduledoc """
  Mobile operator networks to which Super SIMs can connect

  SID prefix: `HW`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `friendly_name` | A human readable identifier of this resource. |
  | `identifiers` | Array of objects identifying the [MCC-MNCs](https://en.wikipedia.org/wiki/Mobile_country_code) that are included in the Network resource. |
  | `iso_country` | The [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) of the Network resource. |
  | `sid` | The unique string that we created to identify the Network resource. |
  | `url` | The absolute URL of the Network resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          friendly_name: String.t() | nil,
          identifiers: list() | nil,
          iso_country: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:friendly_name, :identifiers, :iso_country, :sid, :url]

  @object_name "supersim.v1.network"
  def object_name, do: @object_name

  @sid_prefix "HW"
  def sid_prefix, do: @sid_prefix
end
