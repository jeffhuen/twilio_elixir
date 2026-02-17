# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Numbers.V2.Hostednumber.Authorizationdocument.Dependenthostednumberorder do
  @moduledoc """


  SID prefix: `HR`

  Parent: `/HostedNumber/AuthorizationDocuments/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The unique SID identifier of the Account. |
  | `address_sid` | A 34 character string that uniquely identifies the Address resource that represents the address of the owner of this phone number. |
  | `bulk_hosting_request_sid` | A 34 character string that uniquely identifies the bulk hosting request associated with this HostedNumberOrder. |
  | `capabilities` | A mapping of capabilities this hosted phone number will have enabled on Twilio's platform.. Format: phone-number-capabilities |
  | `cc_emails` | Email recipients who will be informed when an Authorization Document has been sent and signed. PII: standard |
  | `contact_phone_number` | The contact phone number of the person authorized to sign the Authorization Document.. Format: phone-number |
  | `contact_title` | The title of the person authorized to sign the Authorization Document for this phone number. |
  | `date_created` | The date this resource was created, given as [GMT RFC 2822](http://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `date_updated` | The date that this resource was updated, given as [GMT RFC 2822](http://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `email` | Email of the owner of this phone number that is being hosted.. PII: standard |
  | `failure_reason` | A message that explains why a hosted_number_order went to status "action-required" |
  | `friendly_name` | A human readable description of this resource, up to 128 characters.. PII: standard |
  | `incoming_phone_number_sid` | A 34 character string that uniquely identifies the IncomingPhoneNumber resource created by this HostedNumberOrder. |
  | `next_step` | The next step you need to take to complete the hosted number order and request it successfully. |
  | `phone_number` | An E164 formatted phone number hosted by this HostedNumberOrder.. Format: phone-number |
  | `sid` | A 34 character string that uniquely identifies this Authorization Document |
  | `signing_document_sid` | A 34 character string that uniquely identifies the LOA document associated with this HostedNumberOrder. |
  | `status` | Status of an instance resource. It can hold one of the values: 1. opened 2. signing, 3. signed LOA, 4. canceled, 5. failed. See the section entitled [Status Values](https://www.twilio.com/docs/phone-numbers/hosted-numbers/hosted-numbers-api/authorization-document-resource#status-values) for more information on each of these statuses.. Values: `received`, `verified`, `pending-loa`, `carrier-processing`, `completed`, `failed`, `action-required` |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          address_sid: String.t() | nil,
          bulk_hosting_request_sid: String.t() | nil,
          capabilities: map() | nil,
          cc_emails: list() | nil,
          contact_phone_number: String.t() | nil,
          contact_title: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          email: String.t() | nil,
          failure_reason: String.t() | nil,
          friendly_name: String.t() | nil,
          incoming_phone_number_sid: String.t() | nil,
          next_step: String.t() | nil,
          phone_number: String.t() | nil,
          sid: String.t() | nil,
          signing_document_sid: String.t() | nil,
          status: String.t()
        }

  defstruct [
    :account_sid,
    :address_sid,
    :bulk_hosting_request_sid,
    :capabilities,
    :cc_emails,
    :contact_phone_number,
    :contact_title,
    :date_created,
    :date_updated,
    :email,
    :failure_reason,
    :friendly_name,
    :incoming_phone_number_sid,
    :next_step,
    :phone_number,
    :sid,
    :signing_document_sid,
    :status
  ]

  @object_name "numbers.v2.authorization_document.dependent_hosted_number_order"
  def object_name, do: @object_name

  @sid_prefix "HR"
  def sid_prefix, do: @sid_prefix
end
