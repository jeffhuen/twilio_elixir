# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Verify.V2.Attempt do
  @moduledoc """


  SID prefix: `VL`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Verification resource. |
  | `channel` | A string specifying the communication channel used for the verification attempt.. Values: `sms`, `call`, `email`, `whatsapp`, `rbm` |
  | `channel_data` | An object containing the channel specific information for an attempt. |
  | `conversion_status` | A string specifying the conversion status of the verification. A conversion happens when the user is able to provide the correct code. Possible values are `CONVERTED` and `UNCONVERTED`.. Values: `converted`, `unconverted` |
  | `date_created` | The date that this Attempt was created, given in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `date_updated` | The date that this Attempt was updated, given in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `price` | An object containing the charge for this verification attempt related to the channel costs and the currency used. The costs related to the succeeded verifications are not included. May not be immediately available. More information on pricing is available [here](https://www.twilio.com/en-us/verify/pricing). |
  | `service_sid` | The SID of the [Service](https://www.twilio.com/docs/verify/api/service) used to generate the attempt. |
  | `sid` | The SID that uniquely identifies the verification attempt resource. |
  | `url` | Format: uri |
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
