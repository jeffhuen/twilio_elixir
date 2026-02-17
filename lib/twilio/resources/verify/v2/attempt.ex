# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Verify.V2.Attempt do
  @moduledoc """
  Attempt resource.

  SID prefix: `VL`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Verification resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `channel` | A string specifying the communication channel used for the verification attempt.. Values: `sms`, `call`, `email`, `whatsapp`, `rbm` |
  | `channel_data` | An object containing the channel specific information for an attempt. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `conversion_status` | A string specifying the conversion status of the verification. A conversion happens when the user is able to provide the correct code. Possible values are `CONVERTED` and `UNCONVERTED`.. Values: `converted`, `unconverted` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date that this Attempt was created, given in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date that this Attempt was updated, given in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `price` | An object containing the charge for this verification attempt related to the channel costs and the currency used. The costs related to the succeeded verifications are not included. May not be immediately available. More information on pricing is available [here](https://www.twilio.com/en-us/verify/pricing). |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `service_sid` | The SID of the [Service](https://www.twilio.com/docs/verify/api/service) used to generate the attempt. |
  | `sid` | The SID that uniquely identifies the verification attempt resource. |
  | `url` | Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `verification_sid` | The SID of the [Verification](https://www.twilio.com/docs/verify/api/verification) that generated the attempt. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          channel: String.t(),
          channel_data: String.t() | nil,
          conversion_status: String.t(),
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          price: String.t() | nil,
          service_sid: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil,
          verification_sid: String.t() | nil
        }

  defstruct [
    :account_sid,
    :channel,
    :channel_data,
    :conversion_status,
    :date_created,
    :date_updated,
    :price,
    :service_sid,
    :sid,
    :url,
    :verification_sid
  ]

  @object_name "verify.v2.verification_attempt"
  def object_name, do: @object_name

  @sid_prefix "VL"
  def sid_prefix, do: @sid_prefix
end
