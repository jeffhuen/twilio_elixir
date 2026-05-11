# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Insights.V1.Voice.Event do
  @moduledoc """
  Event resource.

  Parent: `/Voice/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The unique SID identifier of the Account. |
  | `call_sid` | The unique SID identifier of the Call. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `carrier_edge` | `object` Represents the connection between Twilio and our immediate carrier partners. The events here describe the call lifecycle as reported by Twilio's carrier media gateways. See [Details: Call Summary](https://www.twilio.com/docs/voice/voice-insights/api/call/details-call-summary#edges-and-their-properties) for the object properties. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `client_edge` | `object` Represents the Twilio media gateway for Client calls. The events here describe the call lifecycle as reported by Twilio's Voice SDK media gateways. See [Details: Call Summary](https://www.twilio.com/docs/voice/voice-insights/api/call/details-call-summary#edges-and-their-properties) for the object properties. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `edge` | The Edge of this Event. One of `unknown_edge`, `carrier_edge`, `sip_edge`, `sdk_edge` or `client_edge`.. Values: `unknown_edge`, `carrier_edge`, `sip_edge`, `sdk_edge`, `client_edge` |
  | `group` | Event group. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `level` | The Level of this Event. One of `UNKNOWN`, `DEBUG`, `INFO`, `WARNING` or `ERROR`.. Values: `UNKNOWN`, `DEBUG`, `INFO`, `WARNING`, `ERROR` |
  | `name` | Event name. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `sdk_edge` | `object` Represents the Voice SDK running locally in the browser or in the Android/iOS application. The events here are emitted by the Voice SDK in response to certain call progress events, network changes, or call quality conditions. See [Details: Call Summary](https://www.twilio.com/docs/voice/voice-insights/api/call/details-call-summary#edges-and-their-properties) for the object properties. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `sip_edge` | `object` Represents the Twilio media gateway for SIP interface and SIP trunking calls. The events here describe the call lifecycle as reported by Twilio's public media gateways. See [Details: Call Summary](https://www.twilio.com/docs/voice/voice-insights/api/call/details-call-summary#edges-and-their-properties) for the object properties. |
  | `timestamp` | Event time. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          call_sid: String.t() | nil,
          carrier_edge: String.t() | nil,
          client_edge: String.t() | nil,
          edge: String.t() | nil,
          group: String.t() | nil,
          level: String.t() | nil,
          name: String.t() | nil,
          sdk_edge: String.t() | nil,
          sip_edge: String.t() | nil,
          timestamp: String.t() | nil
        }

  defstruct [
    :account_sid,
    :call_sid,
    :carrier_edge,
    :client_edge,
    :edge,
    :group,
    :level,
    :name,
    :sdk_edge,
    :sip_edge,
    :timestamp
  ]

  @object_name "insights.v1.call.event"
  def object_name, do: @object_name
end
