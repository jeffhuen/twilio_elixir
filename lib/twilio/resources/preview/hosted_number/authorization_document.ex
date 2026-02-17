# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Preview.HostedNumber.AuthorizationDocument do
  @moduledoc """
  AuthorizationDocument resource.

  SID prefix: `PX`

  ## Sub-resources
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  - `dependent_hosted_number_orders` — `/HostedNumbers/AuthorizationDocuments/{signing_document_sid}/DependentHostedNumberOrders`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `address_sid` | A 34 character string that uniquely identifies the Address resource that is associated with this AuthorizationDocument. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `cc_emails` | Email recipients who will be informed when an Authorization Document has been sent and signed.. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date this resource was created, given as [GMT RFC 2822](http://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date that this resource was updated, given as [GMT RFC 2822](http://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `email` | Email that this AuthorizationDocument will be sent to for signing.. PII: standard |
  | `links` | Format: uri-map |
  | `sid` | A 34 character string that uniquely identifies this AuthorizationDocument. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status` | Status of an instance resource. It can hold one of the values: 1. opened 2. signing, 3. signed LOA, 4. canceled, 5. failed. See the section entitled [Status Values](https://www.twilio.com/docs/phone-numbers/hosted-numbers/hosted-numbers-api/authorization-document-resource#status-values) for more information on each of these statuses.. Values: `opened`, `signing`, `signed`, `canceled`, `failed` |
  | `url` | Format: uri |
  """

  @type t :: %__MODULE__{
          address_sid: String.t() | nil,
          cc_emails: list() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          email: String.t() | nil,
          links: map() | nil,
          sid: String.t() | nil,
          status: String.t(),
          url: String.t() | nil
        }

  defstruct [
    :address_sid,
    :cc_emails,
    :date_created,
    :date_updated,
    :email,
    :links,
    :sid,
    :status,
    :url
  ]

  @object_name "preview.hosted_numbers.authorization_document"
  def object_name, do: @object_name

  @sid_prefix "PX"
  def sid_prefix, do: @sid_prefix
end
