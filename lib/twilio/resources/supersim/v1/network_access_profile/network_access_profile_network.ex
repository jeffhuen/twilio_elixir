# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Supersim.V1.NetworkAccessProfile.NetworkAccessProfileNetwork do
  @moduledoc """
  Mobile operator networks which Network Access Profiles allow access to

  SID prefix: `HW`

  Parent: `/NetworkAccessProfiles/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `friendly_name` | A human readable identifier of the Network this resource refers to. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `identifiers` | Array of objects identifying the [MCC-MNCs](https://en.wikipedia.org/wiki/Mobile_country_code) that are included in the Network resource. |
  | `iso_country` | The [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) of the Network resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `network_access_profile_sid` | The unique string that identifies the Network resource's Network Access Profile resource. |
  | `sid` | The unique string that identifies the Network resource. |
  | `url` | The absolute URL of the Network resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          friendly_name: String.t() | nil,
          identifiers: list() | nil,
          iso_country: String.t() | nil,
          network_access_profile_sid: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:friendly_name, :identifiers, :iso_country, :network_access_profile_sid, :sid, :url]

  @object_name "supersim.v1.network_access_profile.network_access_profile_network"
  def object_name, do: @object_name

  @sid_prefix "HW"
  def sid_prefix, do: @sid_prefix
end
