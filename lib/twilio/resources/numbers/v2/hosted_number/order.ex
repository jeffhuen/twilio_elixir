# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Numbers.V2.HostedNumber.Order do
  @moduledoc """
  Order resource.

  SID prefix: `HR`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | A 34 character string that uniquely identifies the account. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `address_sid` | A 34 character string that uniquely identifies the Address resource that represents the address of the owner of this phone number. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `bulk_hosting_request_sid` | A 34 character string that uniquely identifies the bulk hosting request associated with this HostedNumberOrder. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `capabilities` | Set of booleans describing the capabilities hosted on Twilio's platform. SMS is currently only supported.. Format: phone-number-capabilities |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `cc_emails` | A list of emails that LOA document for this HostedNumberOrder will be carbon copied to.. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `contact_phone_number` | The contact phone number of the person authorized to sign the Authorization Document.. Format: phone-number |
  | `contact_title` | The title of the person authorized to sign the Authorization Document for this phone number. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date this resource was created, given as [GMT RFC 2822](http://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date that this resource was updated, given as [GMT RFC 2822](http://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `email` | Email of the owner of this phone number that is being hosted.. PII: standard |
  | `failure_reason` | A message that explains why a hosted_number_order went to status "action-required" |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `friendly_name` | A 128 character string that is a human-readable text that describes this resource.. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `incoming_phone_number_sid` | A 34 character string that uniquely identifies the [IncomingPhoneNumber](https://www.twilio.com/docs/phone-numbers/api/incomingphonenumber-resource) resource that represents the phone number being hosted. |
  | `next_step` | The next step you need to take to complete the hosted number order and request it successfully. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `phone_number` | Phone number to be hosted. This must be in [E.164](https://en.wikipedia.org/wiki/E.164) format, e.g., +16175551212. Format: phone-number. PII: standard |
  | `sid` | A 34 character string that uniquely identifies this HostedNumberOrder. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `signing_document_sid` | A 34 character string that uniquely identifies the [Authorization Document](https://www.twilio.com/docs/phone-numbers/hosted-numbers/hosted-numbers-api/authorization-document-resource) the user needs to sign. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status` | Status of this resource. It can hold one of the values: 1. Twilio Processing 2. Received, 3. Pending LOA, 4. Carrier Processing, 5. Completed, 6. Action Required, 7. Failed. See the [HostedNumberOrders Status Values](https://www.twilio.com/docs/phone-numbers/hosted-numbers/hosted-numbers-api/hosted-number-order-resource#status-values) section for more information on each of these statuses.. Values: `twilio-processing`, `received`, `pending-verification`, `verified`, `pending-loa`, `carrier-processing`, `testing`, `completed`, `failed`, `action-required` |
  | `url` | The URL of this HostedNumberOrder.. Format: uri |
  | `verification_attempts` | The number of attempts made to verify ownership via a call for the hosted phone number. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `verification_call_delay` | The number of seconds to wait before initiating the ownership verification call. Can be a value between 0 and 60, inclusive. |
  | `verification_call_extension` | The numerical extension to dial when making the ownership verification call. |
  | `verification_call_sids` | The Call SIDs that identify the calls placed to verify ownership. |
  | `verification_code` | The digits the user must pass in the ownership verification call. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `verification_type` | The method used to verify ownership of the number to be hosted. Can be: `phone-call` or `phone-bill` and the default is `phone-call`.. Values: `phone-call` |
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
          status: String.t(),
          url: String.t() | nil,
          verification_attempts: integer(),
          verification_call_delay: integer(),
          verification_call_extension: String.t() | nil,
          verification_call_sids: list() | nil,
          verification_code: String.t() | nil,
          verification_type: String.t()
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
    :status,
    :url,
    :verification_attempts,
    :verification_call_delay,
    :verification_call_extension,
    :verification_call_sids,
    :verification_code,
    :verification_type
  ]

  @object_name "numbers.v2.hosted_number_order"
  def object_name, do: @object_name

  @sid_prefix "HR"
  def sid_prefix, do: @sid_prefix
end
