# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Trusthub.V1.CustomerProfile.CustomerProfilesEntityAssignments do
  @moduledoc """
  CustomerProfilesEntityAssignments resource.

  SID prefix: `BV`

  Parent: `/CustomerProfiles/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Item Assignment resource. |
  | `customer_profile_sid` | The unique string that we created to identify the CustomerProfile resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `object_sid` | The SID of an object bag that holds information of the different items. |
  | `sid` | The unique string that we created to identify the Item Assignment resource. |
  | `url` | The absolute URL of the Identity resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          customer_profile_sid: String.t() | nil,
          date_created: String.t() | nil,
          object_sid: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:account_sid, :customer_profile_sid, :date_created, :object_sid, :sid, :url]

  @object_name "trusthub.v1.customer_profile.customer_profile_entity_assignment"
  def object_name, do: @object_name

  @sid_prefix "BV"
  def sid_prefix, do: @sid_prefix
end
