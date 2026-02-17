# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Insights.V1.Voice.Annotation do
  @moduledoc """


  Parent: `/Voice/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The unique SID identifier of the Account. |
  | `answered_by` | Specifies which entity answered the call as determined by Answering Machine Detection. Possible enumerated values, one of: `human`, `machine`. `human` indicates the call was answered by a person. `machine` indicates the call was answered by an answering machine.. Values: `unknown_answered_by`, `human`, `machine` |
  | `call_score` | Specifies the Call Score, if available. This is of type integer. Use a range of 1-5 to indicate the call experience score, with the following mapping as a reference for rating the call [5: Excellent, 4: Good, 3 : Fair, 2 : Poor, 1: Bad]. |
  | `call_sid` | The unique SID identifier of the Call. |
  | `comment` | Specifies any comments pertaining to the call. Twilio does not treat this field as PII, so no PII should be included in comments. |
  | `connectivity_issue` | Specifies if the call had any connectivity issues. One of `no_connectivity_issue`, `invalid_number`, `caller_id`, `dropped_call`, or `number_reachability`.. Values: `unknown_connectivity_issue`, `no_connectivity_issue`, `invalid_number`, `caller_id`, `dropped_call`, `number_reachability` |
  | `incident` | Incident or support ticket associated with this call. The `incident` property is of type string with a maximum character limit of 100. Twilio does not treat this field as PII, so no PII should be included in `incident`. |
  | `quality_issues` | Specifies if the call had any subjective quality issues. Possible values are one or more of `no_quality_issue`, `low_volume`, `choppy_robotic`, `echo`, `dtmf`, `latency`, `owa`, or `static_noise`. |
  | `spam` | Specifies if the call was a spam call. Use this to provide feedback on whether calls placed from your account were marked as spam, or if inbound calls received by your account were unwanted spam. Is of type Boolean: true, false. Use true if the call was a spam call. |
  | `url` | Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          answered_by: String.t() | nil,
          call_score: integer() | nil,
          call_sid: String.t() | nil,
          comment: String.t() | nil,
          connectivity_issue: String.t() | nil,
          incident: String.t() | nil,
          quality_issues: list() | nil,
          spam: boolean() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :answered_by,
    :call_score,
    :call_sid,
    :comment,
    :connectivity_issue,
    :incident,
    :quality_issues,
    :spam,
    :url
  ]

  @object_name "insights.v1.call.annotation"
  def object_name, do: @object_name
end
