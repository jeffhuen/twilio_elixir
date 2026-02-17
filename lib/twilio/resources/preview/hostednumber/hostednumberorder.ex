# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Preview.Hostednumber.Hostednumberorder do
  @moduledoc """
  Hostednumberorder resource.

  SID prefix: `HR`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | A 34 character string that uniquely identifies the account. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `address_sid` | A 34 character string that uniquely identifies the Address resource that represents the address of the owner of this phone number. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `call_delay` | A value between 0-30 specifying the number of seconds to delay initiating the ownership verification call. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `capabilities` | Set of booleans describing the capabilities hosted on Twilio's platform. SMS is currently only supported.. Format: phone-number-capabilities |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `cc_emails` | A list of emails that LOA document for this HostedNumberOrder will be carbon copied to.. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date this resource was created, given as [GMT RFC 2822](http://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date that this resource was updated, given as [GMT RFC 2822](http://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `email` | Email of the owner of this phone number that is being hosted.. PII: standard |
  | `extension` | A numerical extension to be used when making the ownership verification call. |
  | `failure_reason` | A message that explains why a hosted_number_order went to status "action-required" |
  | `friendly_name` | A 64 character string that is a human-readable text that describes this resource.. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `incoming_phone_number_sid` | A 34 character string that uniquely identifies the [IncomingPhoneNumber](https://www.twilio.com/docs/phone-numbers/api/incomingphonenumber-resource) resource that represents the phone number being hosted. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `phone_number` | Phone number to be hosted. This must be in [E.164](https://en.wikipedia.org/wiki/E.164) format, e.g., +16175551212. Format: phone-number |
  | `sid` | A 34 character string that uniquely identifies this HostedNumberOrder. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `signing_document_sid` | A 34 character string that uniquely identifies the [Authorization Document](https://www.twilio.com/docs/phone-numbers/hosted-numbers/hosted-numbers-api/authorization-document-resource) the user needs to sign. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status` | Status of this resource. It can hold one of the values: 1. Twilio Processing 2. Received, 3. Pending LOA, 4. Carrier Processing, 5. Completed, 6. Action Required, 7. Failed. See the [HostedNumberOrders Status Values](https://www.twilio.com/docs/phone-numbers/hosted-numbers/hosted-numbers-api/hosted-number-order-resource#status-values) section for more information on each of these statuses.. Values: `twilio-processing`, `received`, `pending-verification`, `verified`, `pending-loa`, `carrier-processing`, `testing`, `completed`, `failed`, `action-required` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `unique_name` | Provides a unique and addressable name to be assigned to this HostedNumberOrder, assigned by the developer, to be optionally used in addition to SID.. PII: standard |
  | `url` | The URL of this HostedNumberOrder.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `verification_attempts` | The number of attempts made to verify ownership of the phone number that is being hosted. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `verification_call_sids` | A list of 34 character strings that are unique identifiers for the calls placed as part of ownership verification. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `verification_code` | A verification code provided in the response for a user to enter when they pick up the phone call. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `verification_document_sid` | A 34 character string that uniquely identifies the Identity Document resource that represents the document for verifying ownership of the number to be hosted. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `verification_type` | The type of ownership verification required to move the number to a `verified` state. The verification methods are `phone-call` or `phone-bill`.. Values: `phone-call`, `phone-bill` |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          address_sid: String.t() | nil,
          call_delay: integer(),
          capabilities: map() | nil,
          cc_emails: list() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          email: String.t() | nil,
          extension: String.t() | nil,
          failure_reason: String.t() | nil,
          friendly_name: String.t() | nil,
          incoming_phone_number_sid: String.t() | nil,
          phone_number: String.t() | nil,
          sid: String.t() | nil,
          signing_document_sid: String.t() | nil,
          status: String.t(),
          unique_name: String.t() | nil,
          url: String.t() | nil,
          verification_attempts: integer(),
          verification_call_sids: list() | nil,
          verification_code: String.t() | nil,
          verification_document_sid: String.t() | nil,
          verification_type: String.t()
        }

  defstruct [
    :account_sid,
    :address_sid,
    :call_delay,
    :capabilities,
    :cc_emails,
    :date_created,
    :date_updated,
    :email,
    :extension,
    :failure_reason,
    :friendly_name,
    :incoming_phone_number_sid,
    :phone_number,
    :sid,
    :signing_document_sid,
    :status,
    :unique_name,
    :url,
    :verification_attempts,
    :verification_call_sids,
    :verification_code,
    :verification_document_sid,
    :verification_type
  ]

  @object_name "preview.hosted_numbers.hosted_number_order"
  def object_name, do: @object_name

  @sid_prefix "HR"
  def sid_prefix, do: @sid_prefix
end
