# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Studio.V1.Flow.Engagement do
  @moduledoc """
  [DEPRECATED] Excecutions of Studio flows

  SID prefix: `FN`

  Parent: `/Flows/{Sid}`

  ## Sub-resources
  - `engagement_context` — `/v1/Flows/{flow_sid}/Engagements/{engagement_sid}/Context`
  - `steps` — `/v1/Flows/{flow_sid}/Engagements/{engagement_sid}/Steps`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Engagement resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `contact_channel_address` | The phone number, SIP address or Client identifier that triggered this Engagement. Phone numbers are in E.164 format (+16175551212). SIP addresses are formatted as `name@company.com`. Client identifiers are formatted `client:name`. |
  | `contact_sid` | The SID of the Contact. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `context` | The current state of the execution flow. As your flow executes, we save the state in a flow context. Your widgets can access the data in the flow context as variables, either in configuration fields or in text areas as variable substitution. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the Engagement was created in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the Engagement was updated in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `flow_sid` | The SID of the Flow. |
  | `links` | The URLs of the Engagement's nested resources.. Format: uri-map |
  | `sid` | The unique string that we created to identify the Engagement resource. |
  | `status` | The status of the Engagement. Can be: `active` or `ended`.. Values: `active`, `ended` |
  | `url` | The absolute URL of the resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          contact_channel_address: String.t() | nil,
          contact_sid: String.t() | nil,
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
    :contact_sid,
    :context,
    :date_created,
    :date_updated,
    :flow_sid,
    :links,
    :sid,
    :status,
    :url
  ]

  @object_name "studio.v1.flow.engagement"
  def object_name, do: @object_name

  @sid_prefix "FN"
  def sid_prefix, do: @sid_prefix
end
