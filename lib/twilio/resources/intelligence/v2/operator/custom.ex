# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Intelligence.V2.Operator.Custom do
  @moduledoc """
  Custom resource.

  SID prefix: `LY`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The unique SID identifier of the Account the Custom Operator belongs to. |
  | `author` | The creator of the Custom Operator. Custom Operators can only be created by a Twilio Account. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `availability` | Custom Operator availability status. Possible values: internal, beta, public, retired.. Values: `internal`, `beta`, `public`, `retired`, `general-availability`, `deprecated` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `config` | Operator configuration, following the schema defined by the Operator Type. Only available on Operators created by the Account. |
  | `date_created` | The date that this Custom Operator was created, given in ISO 8601 format.. Format: date-time |
  | `date_updated` | The date that this Custom Operator was updated, given in ISO 8601 format.. Format: date-time |
  | `description` | A human-readable description of this resource, longer than the friendly name. |
  | `friendly_name` | A human-readable name of this resource, up to 64 characters. |
  | `operator_type` | Operator Type for this Operator. References an existing Operator Type resource. |
  | `sid` | A 34 character string that uniquely identifies this Custom Operator. |
  | `url` | The URL of this resource.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `version` | Numeric Custom Operator version. Incremented with each update on the resource, used to ensure integrity when updating the Custom Operator. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          author: String.t() | nil,
          availability: String.t(),
          config: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          description: String.t() | nil,
          friendly_name: String.t() | nil,
          operator_type: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil,
          version: integer()
        }

  defstruct [
    :account_sid,
    :author,
    :availability,
    :config,
    :date_created,
    :date_updated,
    :description,
    :friendly_name,
    :operator_type,
    :sid,
    :url,
    :version
  ]

  @object_name "intelligence.v2.custom_operator"
  def object_name, do: @object_name

  @sid_prefix "LY"
  def sid_prefix, do: @sid_prefix
end
