# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Intelligence.V2.Operatortype do
  @moduledoc """


  SID prefix: `EY`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `availability` | Operator Type availability status. Possible values: internal, beta, general-availability, retired, deprecated.. Values: `internal`, `beta`, `general-availability`, `retired`, `deprecated` |
  | `config_schema` | JSON Schema for configuring an Operator with this Operator Type. Following https://json-schema.org/ |
  | `configurable` | Operators can be created from configurable Operator Types. |
  | `date_created` | The date that this Operator Type was created, given in ISO 8601 format.. Format: date-time |
  | `date_updated` | The date that this Operator Type was updated, given in ISO 8601 format.. Format: date-time |
  | `description` | A human-readable description of this resource, longer than the friendly name. |
  | `docs_link` | Additional documentation for the Operator Type.. Format: uri |
  | `friendly_name` | A human-readable name of this resource, up to 64 characters. |
  | `name` | A unique name that references an Operator's Operator Type. |
  | `output_type` | Operator Results for this Operator Type will follow this format. Possible values: text-classification, text-extraction, text-extraction-normalized, text-generation.. Values: `text-classification`, `text-extraction`, `text-extraction-normalized`, `text-generation`, `json` |
  | `provider` | Operators with this Operator Type are executed using this provider. Possible values: twilio, amazon, openai.. Values: `twilio`, `amazon`, `openai` |
  | `sid` | A 34 character string that uniquely identifies this Operator Type. |
  | `supported_languages` | List of languages this Operator Type supports. |
  | `url` | The URL of this resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          availability: String.t(),
          config_schema: String.t() | nil,
          configurable: boolean() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          description: String.t() | nil,
          docs_link: String.t() | nil,
          friendly_name: String.t() | nil,
          name: String.t() | nil,
          output_type: String.t(),
          provider: String.t(),
          sid: String.t() | nil,
          supported_languages: list() | nil,
          url: String.t() | nil
        }

  defstruct [
    :availability,
    :config_schema,
    :configurable,
    :date_created,
    :date_updated,
    :description,
    :docs_link,
    :friendly_name,
    :name,
    :output_type,
    :provider,
    :sid,
    :supported_languages,
    :url
  ]

  @object_name "intelligence.v2.operator_type"
  def object_name, do: @object_name

  @sid_prefix "EY"
  def sid_prefix, do: @sid_prefix
end
