# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Numbers.V2.Regulatorycompliance.Bundle.Clone do
  @moduledoc """
  Clone resource.

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Bundle resource. |
  | `bundle_sid` | The unique string that we created to identify the Bundle resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `email` | The email address that will receive updates when the Bundle resource changes status. |
  | `friendly_name` | The string that you assigned to describe the resource. |
  | `regulation_sid` | The unique string of a regulation that is associated to the Bundle resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status` | The verification status of the Bundle resource.. Values: `draft`, `pending-review`, `in-review`, `twilio-rejected`, `twilio-approved`, `provisionally-approved` |
  | `status_callback` | The URL we call to inform your application of status changes.. Format: uri |
  | `url` | The URL of this resource.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `valid_until` | The date and time in GMT in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format when the resource will be valid until.. Format: date-time |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          bundle_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          email: String.t() | nil,
          friendly_name: String.t() | nil,
          regulation_sid: String.t() | nil,
          status: String.t(),
          status_callback: String.t() | nil,
          url: String.t() | nil,
          valid_until: String.t() | nil
        }

  defstruct [
    :account_sid,
    :bundle_sid,
    :date_created,
    :date_updated,
    :email,
    :friendly_name,
    :regulation_sid,
    :status,
    :status_callback,
    :url,
    :valid_until
  ]

  @object_name "numbers.v2.bundle_clone"
  def object_name, do: @object_name
end
