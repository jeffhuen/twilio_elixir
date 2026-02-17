# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Numbers.V2.RegulatoryCompliance.SupportingDocumentType do
  @moduledoc """
  SupportingDocumentType resource.

  SID prefix: `OY`

  Parent: `/RegulatoryCompliance`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `fields` | The required information for creating a Supporting Document. The required fields will change as regulatory needs change and will differ for businesses and individuals. |
  | `friendly_name` | A human-readable description of the Supporting Document Type resource. |
  | `machine_name` | The machine-readable description of the Supporting Document Type resource. |
  | `sid` | The unique string that identifies the Supporting Document Type resource. |
  | `url` | The absolute URL of the Supporting Document Type resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          fields: list() | nil,
          friendly_name: String.t() | nil,
          machine_name: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:fields, :friendly_name, :machine_name, :sid, :url]

  @object_name "numbers.v2.regulatory_compliance.supporting_document_type"
  def object_name, do: @object_name

  @sid_prefix "OY"
  def sid_prefix, do: @sid_prefix
end
