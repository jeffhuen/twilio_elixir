# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Conversations.V1.Conversation.Webhook do
  @moduledoc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  A Scoped Webhook resource manages a set of callback URLs and their configuration for receiving events specific to one conversation.

  SID prefix: `WH`

  Parent: `/Conversations/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The unique ID of the [Account](https://www.twilio.com/docs/iam/api/account) responsible for this conversation. |
  | `configuration` | The configuration of this webhook. Is defined based on target. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `conversation_sid` | The unique ID of the [Conversation](https://www.twilio.com/docs/conversations/api/conversation-resource) for this webhook. |
  | `date_created` | The date that this resource was created.. Format: date-time |
  | `date_updated` | The date that this resource was last updated.. Format: date-time |
  | `sid` | A 34 character string that uniquely identifies this resource. |
  | `target` | The target of this webhook: `webhook`, `studio`, `trigger` |
  | `url` | An absolute API resource URL for this webhook.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          configuration: String.t() | nil,
          conversation_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          sid: String.t() | nil,
          target: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :configuration,
    :conversation_sid,
    :date_created,
    :date_updated,
    :sid,
    :target,
    :url
  ]

  @object_name "conversations.v1.conversation.conversation_scoped_webhook"
  def object_name, do: @object_name

  @sid_prefix "WH"
  def sid_prefix, do: @sid_prefix
end
