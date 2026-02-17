# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Studio.V2.Flow.Execution do
  @moduledoc """
  Executions of Studio flows

  SID prefix: `FN`

  Parent: `/Flows/{Sid}`

  ## Sub-resources
  - `execution_context` — `/v2/Flows/{flow_sid}/Executions/{execution_sid}/Context`
  - `steps` — `/v2/Flows/{flow_sid}/Executions/{execution_sid}/Steps`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Execution resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `contact_channel_address` | The phone number, SIP address or Client identifier that triggered the Execution. Phone numbers are in E.164 format (e.g. +16175551212). SIP addresses are formatted as `name@company.com`. Client identifiers are formatted `client:name`.. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `context` | The current state of the Flow's Execution. As a flow executes, we save its state in this context. We save data that your widgets can access as variables in configuration fields or in text areas as variable substitution.. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `flow_sid` | The SID of the Flow. |
  | `links` | The URLs of nested resources.. Format: uri-map |
  | `sid` | The unique string that we created to identify the Execution resource. |
  | `status` | The status of the Execution. Can be: `active` or `ended`.. Values: `active`, `ended` |
  | `url` | The absolute URL of the resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          contact_channel_address: String.t() | nil,
          context: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          flow_sid: String.t() | nil,
          links: map() | nil,
          sid: String.t() | nil,
          status: String.t(),
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :contact_channel_address,
    :context,
    :date_created,
    :date_updated,
    :flow_sid,
    :links,
    :sid,
    :status,
    :url
  ]

  @object_name "studio.v2.flow.execution"
  def object_name, do: @object_name

  @sid_prefix "FN"
  def sid_prefix, do: @sid_prefix
end
