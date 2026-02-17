# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Flex.V1.Interaction.Channel.InteractionTransfer do
  @moduledoc """


  SID prefix: `UX`

  Parent: `/Interactions/{InteractionSid}/Channels/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the Account that created the Transfer. |
  | `channel_sid` | The Channel Sid for this Transfer. |
  | `date_created` | The date and time when the Transfer was created.. Format: date-time |
  | `date_updated` | The date and time when the Transfer was last updated.. Format: date-time |
  | `execution_sid` | The Execution SID associated with the Transfer. |
  | `from` | The SID of the Participant initiating the Transfer. |
  | `instance_sid` | The SID of the Instance associated with the Transfer. |
  | `interaction_sid` | The Interaction Sid for this channel. |
  | `note_sid` | The SID of the Note associated with the Transfer. |
  | `sid` | The unique string created by Twilio to identify an Interaction Transfer resource. |
  | `status` | The status of the Transfer. Can be: `active`, `completed`, `failed`.. Values: `active`, `failed`, `completed` |
  | `summary_sid` | The SID of the Summary associated with the Transfer. |
  | `to` | The SID of the Participant receiving the Transfer. |
  | `type` | The type of the Transfer. Can be: `cold`, `warm`.. Values: `warm`, `cold`, `external` |
  | `url` | Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          channel_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          execution_sid: String.t() | nil,
          from: String.t() | nil,
          instance_sid: String.t() | nil,
          interaction_sid: String.t() | nil,
          note_sid: String.t() | nil,
          sid: String.t() | nil,
          status: String.t(),
          summary_sid: String.t() | nil,
          to: String.t() | nil,
          type: String.t(),
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :channel_sid,
    :date_created,
    :date_updated,
    :execution_sid,
    :from,
    :instance_sid,
    :interaction_sid,
    :note_sid,
    :sid,
    :status,
    :summary_sid,
    :to,
    :type,
    :url
  ]

  @object_name "flex.v1.interaction.interaction_channel.interaction_transfer"
  def object_name, do: @object_name

  @sid_prefix "UX"
  def sid_prefix, do: @sid_prefix
end
