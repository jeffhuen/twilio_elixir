# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Numbers.V2.Regulatorycompliance.Bundle.Copy do
  @moduledoc """


  SID prefix: `BU`

  Parent: `/RegulatoryCompliance/Bundles/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Bundle resource. |
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `email` | The email address that will receive updates when the Bundle resource changes status. |
  | `friendly_name` | The string that you assigned to describe the resource. |
  | `regulation_sid` | The unique string of a regulation that is associated to the Bundle resource. |
  | `sid` | The unique string that we created to identify the Bundle resource. |
  | `status` | The verification status of the Bundle resource.. Values: `draft`, `pending-review`, `in-review`, `twilio-rejected`, `twilio-approved`, `provisionally-approved` |
  | `status_callback` | The URL we call to inform your application of status changes.. Format: uri |
  | `valid_until` | The date and time in GMT in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format when the resource will be valid until.. Format: date-time |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          email: String.t() | nil,
          friendly_name: String.t() | nil,
          regulation_sid: String.t() | nil,
          sid: String.t() | nil,
          status: String.t(),
          status_callback: String.t() | nil,
          valid_until: String.t() | nil
        }

  defstruct [
    :account_sid,
    :date_created,
    :date_updated,
    :email,
    :friendly_name,
    :regulation_sid,
    :sid,
    :status,
    :status_callback,
    :valid_until
  ]

  @object_name "numbers.v2.regulatory_compliance.bundle.bundle_copy"
  def object_name, do: @object_name

  @sid_prefix "BU"
  def sid_prefix, do: @sid_prefix
end
