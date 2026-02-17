# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Api.V2010.Incomingphonenumber.Assignedaddon.AssignedAddOnExtension do
  @moduledoc """
  AssignedAddOnExtension resource.

  SID prefix: `XF`

  Parent: `/Accounts/{AccountSid}/IncomingPhoneNumbers/{ResourceSid}/AssignedAddOns/{Sid}.json`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the resource. |
  | `assigned_add_on_sid` | The SID that uniquely identifies the assigned Add-on installation. |
  | `enabled` | Whether the Extension will be invoked. |
  | `friendly_name` | The string that you assigned to describe the resource.. PII: standard |
  | `product_name` | A string that you assigned to describe the Product this Extension is used within. |
  | `resource_sid` | The SID of the Phone Number to which the Add-on is assigned. |
  | `sid` | The unique string that that we created to identify the resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `unique_name` | An application-defined string that uniquely identifies the resource. It can be used in place of the resource's `sid` in the URL to address the resource. |
  | `uri` | The URI of the resource, relative to `https://api.twilio.com`. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          assigned_add_on_sid: String.t() | nil,
          enabled: boolean() | nil,
          friendly_name: String.t() | nil,
          product_name: String.t() | nil,
          resource_sid: String.t() | nil,
          sid: String.t() | nil,
          unique_name: String.t() | nil,
          uri: String.t() | nil
        }

  defstruct [
    :account_sid,
    :assigned_add_on_sid,
    :enabled,
    :friendly_name,
    :product_name,
    :resource_sid,
    :sid,
    :unique_name,
    :uri
  ]

  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  @object_name "api.v2010.account.incoming_phone_number.incoming_phone_number_assigned_add_on.incoming_phone_number_assigned_add_on_extension"
  def object_name, do: @object_name

  @sid_prefix "XF"
  def sid_prefix, do: @sid_prefix
end
