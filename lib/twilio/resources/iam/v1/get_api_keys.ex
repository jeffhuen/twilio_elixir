# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Iam.V1.GetApiKeys do
  @moduledoc """
  API keys

  SID prefix: `SK`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `date_created` | The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  | `date_updated` | The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  | `friendly_name` | The string that you assigned to describe the resource.. PII: standard |
  | `policy` | The \`Policy\` object is a collection that specifies the allowed Twilio permissions for the restricted key. For more information on the permissions available with restricted API keys, refer to the [Twilio documentation](https://www.twilio.com/docs/iam/api-keys/restricted-api-keys#permissions-available-with-restricted-api-keys). |
  | `sid` | The unique string that we created to identify the Key resource. |
  """

  @type t :: %__MODULE__{
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          policy: map() | nil,
          sid: String.t() | nil
        }

  defstruct [:date_created, :date_updated, :friendly_name, :policy, :sid]

  @object_name "iam.v1.key"
  def object_name, do: @object_name

  @sid_prefix "SK"
  def sid_prefix, do: @sid_prefix
end
