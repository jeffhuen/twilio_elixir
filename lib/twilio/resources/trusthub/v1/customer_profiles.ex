# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Trusthub.V1.CustomerProfiles do
  @moduledoc """


  SID prefix: `BU`

  ## Sub-resources
  - `customer_profiles_channel_endpoint_assignment` — `/v1/CustomerProfiles/{customer_profile_sid}/ChannelEndpointAssignments`
  - `customer_profiles_entity_assignments` — `/v1/CustomerProfiles/{customer_profile_sid}/EntityAssignments`
  - `customer_profiles_evaluations` — `/v1/CustomerProfiles/{customer_profile_sid}/Evaluations`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Customer-Profile resource. |
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `email` | The email address that will receive updates when the Customer-Profile resource changes status. |
  | `errors` | The error codes associated with the rejection of the Customer-Profile. |
  | `friendly_name` | The string that you assigned to describe the resource. |
  | `links` | The URLs of the Assigned Items of the Customer-Profile resource.. Format: uri-map |
  | `policy_sid` | The unique string of a policy that is associated to the Customer-Profile resource. |
  | `sid` | The unique string that we created to identify the Customer-Profile resource. |
  | `status` | The verification status of the Customer-Profile resource.. Values: `draft`, `pending-review`, `in-review`, `twilio-rejected`, `twilio-approved` |
  | `status_callback` | The URL we call to inform your application of status changes.. Format: uri |
  | `url` | The absolute URL of the Customer-Profile resource.. Format: uri |
  | `valid_until` | The date and time in GMT in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format when the resource will be valid until.. Format: date-time |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          email: String.t() | nil,
          errors: list() | nil,
          friendly_name: String.t() | nil,
          links: map() | nil,
          policy_sid: String.t() | nil,
          sid: String.t() | nil,
          status: String.t(),
          status_callback: String.t() | nil,
          url: String.t() | nil,
          valid_until: String.t() | nil
        }

  defstruct [
    :account_sid,
    :date_created,
    :date_updated,
    :email,
    :errors,
    :friendly_name,
    :links,
    :policy_sid,
    :sid,
    :status,
    :status_callback,
    :url,
    :valid_until
  ]

  @object_name "trusthub.v1.customer_profile"
  def object_name, do: @object_name

  @sid_prefix "BU"
  def sid_prefix, do: @sid_prefix
end
