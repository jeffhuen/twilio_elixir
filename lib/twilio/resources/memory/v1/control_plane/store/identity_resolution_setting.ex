# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Memory.V1.ControlPlane.Store.IdentityResolutionSetting do
  @moduledoc """
  IdentityResolutionSetting resource.

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `identifierConfigs` | List of identifier types and their resolution settings. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `matchingRules` | Priority list of identifiers to locate profiles to apply new data to, or for  determining if two existing profiles should merge. Rules are evaluated in order. - If no rule matches against existing profiles, a new profile will be created.  - If a rule matches to a single existing profile, the profile will be updated.  - If a rule matches to multiple existing profiles, those existing profiles will be merged. |
  | `version` | The current version number of the Identity Resolution Settings. Incremented on each successful update. |
  """

  @type t :: %__MODULE__{
          identifierConfigs: list(),
          matchingRules: list(),
          version: integer()
        }

  defstruct [:identifierConfigs, :matchingRules, :version]

  @object_name "IdentityResolutionSettings"
  def object_name, do: @object_name
end
