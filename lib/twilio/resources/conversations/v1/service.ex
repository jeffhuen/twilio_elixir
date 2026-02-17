# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Conversations.V1.Service do
  @moduledoc """
  A Service resource is a top-level conversation resource container that serves as a data silo.

  SID prefix: `IS`

  ## Sub-resources
  - `bindings` — `/v1/Services/{chat_service_sid}/Bindings`
  - `configuration` — `/v1/Services/{chat_service_sid}/Configuration`
  - `conversation_with_participants` — `/v1/Services/{chat_service_sid}/ConversationWithParticipants`
  - `conversations` — `/v1/Services/{chat_service_sid}/Conversations`
  - `participant_conversations` — `/v1/Services/{chat_service_sid}/ParticipantConversations`
  - `roles` — `/v1/Services/{chat_service_sid}/Roles`
  - `users` — `/v1/Services/{chat_service_sid}/Users`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The unique ID of the [Account](https://www.twilio.com/docs/iam/api/account) responsible for this service. |
  | `date_created` | The date that this resource was created.. Format: date-time |
  | `date_updated` | The date that this resource was last updated.. Format: date-time |
  | `friendly_name` | The human-readable name of this service, limited to 256 characters. Optional.. PII: standard |
  | `links` | Contains absolute API resource URLs to access conversations, users, roles, bindings and configuration of this service.. Format: uri-map |
  | `sid` | A 34 character string that uniquely identifies this resource. |
  | `url` | An absolute API resource URL for this service.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          links: map() | nil,
          sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:account_sid, :date_created, :date_updated, :friendly_name, :links, :sid, :url]

  @object_name "conversations.v1.service"
  def object_name, do: @object_name

  @sid_prefix "IS"
  def sid_prefix, do: @sid_prefix
end
