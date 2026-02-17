# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Flex.V1.Interaction.Channel.InteractionChannelParticipant do
  @moduledoc """


  SID prefix: `UT`

  Parent: `/Interactions/{InteractionSid}/Channels/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `channel_sid` | The Channel Sid for this Participant. |
  | `interaction_sid` | The Interaction Sid for this channel. |
  | `routing_properties` | The Participant's routing properties. |
  | `sid` | The unique string created by Twilio to identify an Interaction Channel Participant resource. |
  | `type` | Participant type. Can be: `agent`, `customer`, `supervisor`, `external`, `unknown`. Values: `supervisor`, `customer`, `external`, `agent`, `unknown` |
  | `url` | Format: uri |
  """

  @type t :: %__MODULE__{
          channel_sid: String.t() | nil,
          interaction_sid: String.t() | nil,
          routing_properties: String.t() | nil,
          sid: String.t() | nil,
          type: String.t(),
          url: String.t() | nil
        }

  defstruct [:channel_sid, :interaction_sid, :routing_properties, :sid, :type, :url]

  @object_name "flex.v1.interaction.interaction_channel.interaction_channel_participant"
  def object_name, do: @object_name

  @sid_prefix "UT"
  def sid_prefix, do: @sid_prefix
end
