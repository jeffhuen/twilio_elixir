# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Insights.V1.Voice.Metric do
  @moduledoc """
  Metric resource.

  Parent: `/Voice/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The unique SID identifier of the Account. |
  | `call_sid` | The unique SID identifier of the Call. |
  | `carrier_edge` | Contains metrics and properties for the Twilio media gateway of a PSTN call. |
  | `client_edge` | Contains metrics and properties for the Twilio media gateway of a Client call. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `direction` | The Direction of the media stream from the perspective of the Twilio media edge. One of `unknown`, `inbound`, `outbound` or `both`.. Values: `unknown`, `inbound`, `outbound`, `both` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `edge` | The Twilio media edge this Metric was captured on. One of `unknown_edge`, `carrier_edge`, `sip_edge`, `sdk_edge` or `client_edge`.. Values: `unknown_edge`, `carrier_edge`, `sip_edge`, `sdk_edge`, `client_edge` |
  | `sdk_edge` | Contains metrics and properties for the SDK sensor library for Client calls. |
  | `sip_edge` | Contains metrics and properties for the Twilio media gateway of a SIP Interface or Trunking call. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `timestamp` | Timestamp of metric sample. Samples are taken every 10 seconds and contain the metrics for the previous 10 seconds. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          call_sid: String.t() | nil,
          carrier_edge: String.t() | nil,
          client_edge: String.t() | nil,
          direction: String.t() | nil,
          edge: String.t() | nil,
          sdk_edge: String.t() | nil,
          sip_edge: String.t() | nil,
          timestamp: String.t() | nil
        }

  defstruct [
    :account_sid,
    :call_sid,
    :carrier_edge,
    :client_edge,
    :direction,
    :edge,
    :sdk_edge,
    :sip_edge,
    :timestamp
  ]

  @object_name "insights.v1.call.metric"
  def object_name, do: @object_name
end
