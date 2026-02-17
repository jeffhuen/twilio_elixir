# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Verify.V2.Form do
  @moduledoc """


  ## Properties

  | Field | Description |
  |-------|-------------|
  | `form_meta` | Additional information for the available forms for this type. E.g. The separator string used for `binding` in a Factor push. |
  | `form_type` | The Type of this Form. Currently only `form-push` is supported.. Values: `form-push` |
  | `forms` | Object that contains the available forms for this type. This available forms are given in the standard [JSON Schema](https://json-schema.org/) format |
  | `url` | The URL to access the forms for this type.. Format: uri |
  """

  @type t :: %__MODULE__{
          form_meta: String.t() | nil,
          form_type: String.t(),
          forms: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:form_meta, :form_type, :forms, :url]

  @object_name "verify.v2.form"
  def object_name, do: @object_name
end
