# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Accounts.V1.Consent.BulkConsents do
  @moduledoc """


  ## Properties

  | Field | Description |
  |-------|-------------|
  | `items` | A list of objects where each object represents the result of processing a `correlation_id`. Each object contains the following fields: `correlation_id`, a unique 32-character UUID that maps the response to the original request; `error_code`, an integer where 0 indicates success and any non-zero value represents an error; and `error_messages`, an array of strings describing specific validation errors encountered. If the request is successful, the error_messages array will be empty.. PII: standard |
  """

  @type t :: %__MODULE__{
          items: String.t() | nil
        }

  defstruct [:items]

  @object_name "accounts.v1.bulk_consents"
  def object_name, do: @object_name
end
