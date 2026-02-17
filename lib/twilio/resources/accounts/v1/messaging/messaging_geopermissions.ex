# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Accounts.V1.Messaging.MessagingGeopermissions do
  @moduledoc """
  Manage Geo Permissions for each country.

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `permissions` | A list of objects where each object represents the result of processing a messaging Geo Permission. Each object contains the following fields: `country_code`, the country code of the country for which the permission was updated; `type`, the type of the permission i.e. country; `enabled`, true if the permission is enabled else false; `error_code`, an integer where 0 indicates success and any non-zero value represents an error; and `error_messages`, an array of strings describing specific validation errors encountered. If the request is successful, the error_messages array will be empty. |
  """

  @type t :: %__MODULE__{
          permissions: String.t() | nil
        }

  defstruct [:permissions]

  @object_name "accounts.v1.messaging_geopermissions"
  def object_name, do: @object_name
end
