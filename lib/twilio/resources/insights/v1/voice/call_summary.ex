# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Insights.V1.Voice.CallSummary do
  @moduledoc """
  CallSummary resource.

  Parent: `/Voice/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The unique SID identifier of the Account. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `annotation` | `object` Programmatically labeled annotations for the Call. Developers can update the Call Summary records with Annotation during or after a Call. Annotations can be updated as long as the Call Summary record is addressable via the API. See [Details: Call Summary](https://www.twilio.com/docs/voice/voice-insights/api/call/details-call-summary#annotation-object) for the object properties. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `answered_by` | The Answered By value for the summarized call based on `Answering Machine Detection (AMD)`. One of `unknown`, `machine_start`, `machine_end_beep`, `machine_end_silence`, `machine_end_other`, `human` or `fax`. Refer to [AMD](https://www.twilio.com/docs/voice/answering-machine-detection) for more detail.. Values: `unknown`, `machine_start`, `machine_end_beep`, `machine_end_silence`, `machine_end_other`, `human`, `fax` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `attributes` | `object` Attributes capturing call-flow-specific details. See [Details: Call Summary](https://www.twilio.com/docs/voice/voice-insights/api/call/details-call-summary#attributes-object) for the object properties. |
  | `call_sid` | The unique SID identifier of the Call. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `call_state` | The Call State of the summarized Call. One of `ringing`, `completed`, `busy`, `fail`, `noanswer`, `canceled`, `answered`, `undialed`.. Values: `ringing`, `completed`, `busy`, `fail`, `noanswer`, `canceled`, `answered`, `undialed` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `call_type` | The Call Type of the summarized Call. One of `carrier`, `sip`, `trunking`, `client` and `whatsapp`.. Values: `carrier`, `sip`, `trunking`, `client`, `whatsapp` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `carrier_edge` | `object` Contains metrics and properties for the Twilio media gateway of a PSTN call. See [Details: Call Summary](https://www.twilio.com/docs/voice/voice-insights/api/call/details-call-summary#edges-and-their-properties) for the object properties. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `client_edge` | `object` Contains metrics and properties for the Twilio media gateway of a Client call. See [Details: Call Summary](https://www.twilio.com/docs/voice/voice-insights/api/call/details-call-summary#edges-and-their-properties) for the object properties. |
  | `connect_duration` | Duration between when the call was answered and when it ended |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `created_time` | The time at which the Call was created, given in ISO 8601 format. Can be different from `start_time` in the event of queueing due to CPS. Format: date-time |
  | `duration` | Duration between when the call was initiated and the call was ended |
  | `end_time` | The time at which the Call was ended, given in ISO 8601 format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `from` | `object` The calling party. See [Details: Call Summary](https://www.twilio.com/docs/voice/voice-insights/api/call/details-call-summary#tofrom-object) for the object properties.. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `processing_state` | The Processing State of the Call Summary. The Processing State will be `partial` until the assembly of the Call Summary finishes, which occurs approximately 30 minutes after Call end. Then the Processing State changes to `complete`. Values: `complete`, `partial` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `properties` | `object` Contains edge-agnostic call-level details. See [Details: Call Summary](https://www.twilio.com/docs/voice/voice-insights/api/call/details-call-summary#properties-object) for the object properties. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `sdk_edge` | `object` Contains metrics and properties for the SDK sensor library for Client calls. See [Details: Call Summary](https://www.twilio.com/docs/voice/voice-insights/api/call/details-call-summary#edges-and-their-properties) for the object properties. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `sip_edge` | `object` Contains metrics and properties for the Twilio media gateway of a SIP Interface or Trunking call. See [Details: Call Summary](https://www.twilio.com/docs/voice/voice-insights/api/call/details-call-summary#edges-and-their-properties) for the object properties. |
  | `start_time` | The time at which the Call was started, given in ISO 8601 format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `tags` | Tags applied to calls by Voice Insights analysis indicating a condition that could result in subjective degradation of the call quality. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `to` | `object` The called party. See [Details: Call Summary](https://www.twilio.com/docs/voice/voice-insights/api/call/details-call-summary#tofrom-object) for the object properties.. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `trust` | `object` Contains trusted communications details including Branded Call and verified caller ID. See [Details: Call Summary](https://www.twilio.com/docs/voice/voice-insights/api/call/details-call-summary#trust-object) for the object properties. |
  | `url` | The URL of this resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          annotation: String.t() | nil,
          answered_by: String.t() | nil,
          attributes: String.t() | nil,
          call_sid: String.t() | nil,
          call_state: String.t() | nil,
          call_type: String.t() | nil,
          carrier_edge: String.t() | nil,
          client_edge: String.t() | nil,
          connect_duration: integer() | nil,
          created_time: String.t() | nil,
          duration: integer() | nil,
          end_time: String.t() | nil,
          from: String.t() | nil,
          processing_state: String.t() | nil,
          properties: String.t() | nil,
          sdk_edge: String.t() | nil,
          sip_edge: String.t() | nil,
          start_time: String.t() | nil,
          tags: list() | nil,
          to: String.t() | nil,
          trust: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :annotation,
    :answered_by,
    :attributes,
    :call_sid,
    :call_state,
    :call_type,
    :carrier_edge,
    :client_edge,
    :connect_duration,
    :created_time,
    :duration,
    :end_time,
    :from,
    :processing_state,
    :properties,
    :sdk_edge,
    :sip_edge,
    :start_time,
    :tags,
    :to,
    :trust,
    :url
  ]

  @object_name "insights.v1.call.summary"
  def object_name, do: @object_name
end
