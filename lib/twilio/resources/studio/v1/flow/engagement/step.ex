# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Studio.V1.Flow.Engagement.Step do
  @moduledoc """
  Steps within a Studio flow

  SID prefix: `FT`

  Parent: `/Flows/{FlowSid}/Engagements/{Sid}`

  ## Sub-resources
  - `step_context` — `/v1/Flows/{flow_sid}/Engagements/{engagement_sid}/Steps/{step_sid}/Context`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Step resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `context` | The current state of the Flow's Execution. As a flow executes, we save its state in this context. We save data that your widgets can access as variables in configuration fields or in text areas as variable substitution.. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `engagement_sid` | The SID of the Engagement. |
  | `flow_sid` | The SID of the Flow. |
  | `links` | The URLs of related resources.. Format: uri-map |
  | `name` | The event that caused the Flow to transition to the Step. |
  | `parent_step_sid` | The SID of the parent Step. |
  | `sid` | The unique string that we created to identify the Step resource. |
  | `transitioned_from` | The Widget that preceded the Widget for the Step. |
  | `transitioned_to` | The Widget that will follow the Widget for the Step. |
  | `type` | The type of the widget that was executed. |
  | `url` | The absolute URL of the resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          context: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          engagement_sid: String.t() | nil,
          flow_sid: String.t() | nil,
          links: map() | nil,
          name: String.t() | nil,
          parent_step_sid: String.t() | nil,
          sid: String.t() | nil,
          transitioned_from: String.t() | nil,
          transitioned_to: String.t() | nil,
          type: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :context,
    :date_created,
    :date_updated,
    :engagement_sid,
    :flow_sid,
    :links,
    :name,
    :parent_step_sid,
    :sid,
    :transitioned_from,
    :transitioned_to,
    :type,
    :url
  ]

  @object_name "studio.v1.flow.engagement.step"
  def object_name, do: @object_name

  @sid_prefix "FT"
  def sid_prefix, do: @sid_prefix
end
