# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Verify.V2.Service.Verificationcheck do
  @moduledoc """


  SID prefix: `VE`

  Parent: `/Services/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the VerificationCheck resource. |
  | `amount` | The amount of the associated PSD2 compliant transaction. Requires the PSD2 Service flag enabled.. PII: sensitive |
  | `channel` | The verification method to use. One of: [`email`](https://www.twilio.com/docs/verify/email), `sms`, `whatsapp`, `call`, or `sna`.. Values: `sms`, `call`, `email`, `whatsapp`, `sna` |
  | `date_created` | The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time in GMT when the Verification Check resource was created.. Format: date-time |
  | `date_updated` | The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time in GMT when the Verification Check resource was last updated.. Format: date-time |
  | `payee` | The payee of the associated PSD2 compliant transaction. Requires the PSD2 Service flag enabled.. PII: sensitive |
  | `service_sid` | The SID of the [Service](https://www.twilio.com/docs/verify/api/service) the resource is associated with. |
  | `sid` | The unique string that we created to identify the VerificationCheck resource. |
  | `sna_attempts_error_codes` | List of error codes as a result of attempting a verification using the `sna` channel. The error codes are chronologically ordered, from the first attempt to the latest attempt. This will be an empty list if no errors occured or `null` if the last channel used wasn't `sna`. |
  | `status` | The status of the verification. Can be: `pending`, `approved`, `canceled`, `max_attempts_reached`, `deleted`, `failed` or `expired`. |
  | `to` | The phone number or [email](https://www.twilio.com/docs/verify/email) being verified. Phone numbers must be in [E.164 format](https://www.twilio.com/docs/glossary/what-e164).. PII: standard |
  | `valid` | Use "status" instead. Legacy property indicating whether the verification was successful. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          amount: String.t() | nil,
          channel: String.t(),
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          payee: String.t() | nil,
          service_sid: String.t() | nil,
          sid: String.t() | nil,
          sna_attempts_error_codes: list() | nil,
          status: String.t() | nil,
          to: String.t() | nil,
          valid: boolean() | nil
        }

  defstruct [
    :account_sid,
    :amount,
    :channel,
    :date_created,
    :date_updated,
    :payee,
    :service_sid,
    :sid,
    :sna_attempts_error_codes,
    :status,
    :to,
    :valid
  ]

  @object_name "verify.v2.service.verification_check"
  def object_name, do: @object_name

  @sid_prefix "VE"
  def sid_prefix, do: @sid_prefix
end
