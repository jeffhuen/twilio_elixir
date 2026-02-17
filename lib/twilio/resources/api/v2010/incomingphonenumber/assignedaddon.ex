# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Api.V2010.Incomingphonenumber.Assignedaddon do
  @moduledoc """
  Assignedaddon resource.

  SID prefix: `XE`

  Parent: `/Accounts/{AccountSid}/IncomingPhoneNumbers/{Sid}.json`

  ## Sub-resources
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  - `extensions` — `/2010-04-01/Accounts/{account_sid}/IncomingPhoneNumbers/{resource_sid}/AssignedAddOns/{assigned_add_on_sid}/Extensions.json`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the resource. |
  | `configuration` | A JSON string that represents the current configuration of this Add-on installation. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time-rfc-2822 |
  | `description` | A short description of the functionality that the Add-on provides. |
  | `friendly_name` | The string that you assigned to describe the resource.. PII: standard |
  | `resource_sid` | The SID of the Phone Number to which the Add-on is assigned. |
  | `sid` | The unique string that that we created to identify the resource. |
  | `subresource_uris` | A list of related resources identified by their relative URIs.. Format: uri-map |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `unique_name` | An application-defined string that uniquely identifies the resource. It can be used in place of the resource's `sid` in the URL to address the resource. |
  | `uri` | The URI of the resource, relative to `https://api.twilio.com`. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          configuration: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          description: String.t() | nil,
          friendly_name: String.t() | nil,
          resource_sid: String.t() | nil,
          sid: String.t() | nil,
          subresource_uris: map() | nil,
          unique_name: String.t() | nil,
          uri: String.t() | nil
        }

  defstruct [
    :account_sid,
    :configuration,
    :date_created,
    :date_updated,
    :description,
    :friendly_name,
    :resource_sid,
    :sid,
    :subresource_uris,
    :unique_name,
    :uri
  ]

  @object_name "api.v2010.account.incoming_phone_number.incoming_phone_number_assigned_add_on"
  def object_name, do: @object_name

  @sid_prefix "XE"
  def sid_prefix, do: @sid_prefix
end
