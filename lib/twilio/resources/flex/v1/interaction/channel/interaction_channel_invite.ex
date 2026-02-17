# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Flex.V1.Interaction.Channel.InteractionChannelInvite do
  @moduledoc """
  InteractionChannelInvite resource.

  SID prefix: `KG`

  Parent: `/Interactions/{InteractionSid}/Channels/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `channel_sid` | The Channel SID for this Invite. |
  | `interaction_sid` | The Interaction SID for this Channel. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `routing` | A JSON object representing the routing rules for the Interaction Channel. See [Outbound SMS Example](https://www.twilio.com/docs/flex/developer/conversations/interactions-api/interactions#agent-initiated-outbound-interactions) for an example Routing object. The Interactions resource uses TaskRouter for all routing functionality.   All attributes in the Routing object on your Interaction request body are added “as is” to the task. For a list of known attributes consumed by the Flex UI and/or Flex Insights, see [Known Task Attributes](https://www.twilio.com/docs/flex/developer/conversations/interactions-api#task-attributes). |
  | `sid` | The unique string created by Twilio to identify an Interaction Channel Invite resource. |
  | `url` | Format: uri |
  """

  @type t :: %__MODULE__{
          channel_sid: String.t() | nil,
          interaction_sid: String.t() | nil,
          routing: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:channel_sid, :interaction_sid, :routing, :sid, :url]

  @object_name "flex.v1.interaction.interaction_channel.interaction_channel_invite"
  def object_name, do: @object_name

  @sid_prefix "KG"
  def sid_prefix, do: @sid_prefix
end
