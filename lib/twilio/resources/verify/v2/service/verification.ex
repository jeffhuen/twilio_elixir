# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Verify.V2.Service.Verification do
  @moduledoc """
  Verification resource.

  SID prefix: `VE`

  Parent: `/Services/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Verification resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `amount` | The amount of the associated PSD2 compliant transaction. Requires the PSD2 Service flag enabled.. PII: sensitive |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `channel` | The verification method used. One of: [`email`](https://www.twilio.com/docs/verify/email), `sms`, `whatsapp`, `call`, `sna`, or `rcs`.. Values: `sms`, `call`, `email`, `whatsapp`, `sna` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `lookup` | Information about the phone number being verified. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `payee` | The payee of the associated PSD2 compliant transaction. Requires the PSD2 Service flag enabled.. PII: sensitive |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `send_code_attempts` | An array of verification attempt objects containing the channel attempted and the channel-specific transaction SID. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `service_sid` | The SID of the [Service](https://www.twilio.com/docs/verify/api/service) the resource is associated with. |
  | `sid` | The unique string that we created to identify the Verification resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `sna` | The set of fields used for a silent network auth (`sna`) verification. Contains a single field with the URL to be invoked to verify the phone number. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status` | The status of the verification. Can be: `pending`, `approved`, `canceled`, `max_attempts_reached`, `deleted`, `failed` or `expired`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `to` | The phone number or [email](https://www.twilio.com/docs/verify/email) being verified. Phone numbers must be in [E.164 format](https://www.twilio.com/docs/glossary/what-e164).. PII: standard |
  | `url` | The absolute URL of the Verification resource.. Format: uri |
  | `valid` | Use "status" instead. Legacy property indicating whether the verification was successful. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          amount: String.t() | nil,
          channel: String.t(),
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          lookup: String.t() | nil,
          payee: String.t() | nil,
          send_code_attempts: list() | nil,
          service_sid: String.t() | nil,
          sid: String.t() | nil,
          sna: String.t() | nil,
          status: String.t() | nil,
          to: String.t() | nil,
          url: String.t() | nil,
          valid: boolean() | nil
        }

  defstruct [
    :account_sid,
    :amount,
    :channel,
    :date_created,
    :date_updated,
    :lookup,
    :payee,
    :send_code_attempts,
    :service_sid,
    :sid,
    :sna,
    :status,
    :to,
    :url,
    :valid
  ]

  @object_name "verify.v2.service.verification"
  def object_name, do: @object_name

  @sid_prefix "VE"
  def sid_prefix, do: @sid_prefix
end
