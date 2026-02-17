# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Supersim.V1.SettingsUpdate do
  @moduledoc """
  SettingsUpdate resource.

  SID prefix: `OB`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_completed` | The time, given in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format, when the update successfully completed and the new settings were applied to the SIM.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date that this Settings Update was created, given in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date that this Settings Update was updated, given in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `iccid` | The [ICCID](https://en.wikipedia.org/wiki/SIM_card#ICCID) associated with the SIM. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `packages` | Array containing the different Settings Packages that will be applied to the SIM after the update completes. Each object within the array indicates the name and the version of the Settings Package that will be on the SIM if the update is successful. |
  | `sid` | The unique identifier of this Settings Update. |
  | `sim_sid` | The SID of the Super SIM to which this Settings Update was applied. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status` | The Status of this Settings Update. One of `scheduled`, `in-progress`, `successful` or `failed`.. Values: `scheduled`, `in-progress`, `successful`, `failed` |
  """

  @type t :: %__MODULE__{
          date_completed: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          iccid: String.t() | nil,
          packages: list() | nil,
          sid: String.t() | nil,
          sim_sid: String.t() | nil,
          status: String.t()
        }

  defstruct [
    :date_completed,
    :date_created,
    :date_updated,
    :iccid,
    :packages,
    :sid,
    :sim_sid,
    :status
  ]

  @object_name "supersim.v1.settings_update"
  def object_name, do: @object_name

  @sid_prefix "OB"
  def sid_prefix, do: @sid_prefix
end
