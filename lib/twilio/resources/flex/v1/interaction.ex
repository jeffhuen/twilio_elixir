# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Flex.V1.Interaction do
  @moduledoc """
  Interaction resource.

  SID prefix: `KD`

  ## Sub-resources
  - `channels` — `/v1/Interactions/{interaction_sid}/Channels`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `channel` | A JSON object that defines the Interaction’s communication channel and includes details about the channel. See the [Outbound SMS](https://www.twilio.com/docs/flex/developer/conversations/interactions-api/interactions#agent-initiated-outbound-interactions) and [inbound (API-initiated)](https://www.twilio.com/docs/flex/developer/conversations/interactions-api/interactions#api-initiated-contact) Channel object examples. |
  | `links` | Format: uri-map |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `routing` | A JSON Object representing the routing rules for the Interaction Channel. See [Outbound SMS Example](https://www.twilio.com/docs/flex/developer/conversations/interactions-api/interactions#agent-initiated-outbound-interactions) for an example Routing object. The Interactions resource uses TaskRouter for all routing functionality.   All attributes in the Routing object on your Interaction request body are added “as is” to the task. For a list of known attributes consumed by the Flex UI and/or Flex Insights, see [Known Task Attributes](https://www.twilio.com/docs/flex/developer/conversations/interactions-api#task-attributes). |
  | `sid` | The unique string created by Twilio to identify an Interaction resource, prefixed with KD. |
  | `url` | Format: uri |
  """

  @type t :: %__MODULE__{
          channel: String.t() | nil,
          interaction_context_sid: String.t() | nil,
          links: map() | nil,
          routing: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil,
          webhook_ttid: String.t() | nil
        }

  defstruct [:channel, :interaction_context_sid, :links, :routing, :sid, :url, :webhook_ttid]

  @object_name "flex.v1.interaction"
  def object_name, do: @object_name

  @sid_prefix "KD"
  def sid_prefix, do: @sid_prefix
end
