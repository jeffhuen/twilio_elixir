# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Numbers.V2.Regulatorycompliance.Endusertype do
  @moduledoc """
  Endusertype resource.

  SID prefix: `OY`

  Parent: `/RegulatoryCompliance`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `fields` | The required information for creating an End-User. The required fields will change as regulatory needs change and will differ for businesses and individuals. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `friendly_name` | A human-readable description that is assigned to describe the End-User Type resource. Examples can include first name, last name, email, business name, etc |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `machine_name` | A machine-readable description of the End-User Type resource. Examples can include first_name, last_name, email, business_name, etc. |
  | `sid` | The unique string that identifies the End-User Type resource. |
  | `url` | The absolute URL of the End-User Type resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          fields: list() | nil,
          friendly_name: String.t() | nil,
          machine_name: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:fields, :friendly_name, :machine_name, :sid, :url]

  @object_name "numbers.v2.regulatory_compliance.end_user_type"
  def object_name, do: @object_name

  @sid_prefix "OY"
  def sid_prefix, do: @sid_prefix
end
