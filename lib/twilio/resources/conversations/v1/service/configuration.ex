# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Conversations.V1.Service.Configuration do
  @moduledoc """
  A Service Configuration resource manages service-level settings applicable to the Conversation API.

  Parent: `/Services/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `chat_service_sid` | The unique string that we created to identify the Service configuration resource. |
  | `default_chat_service_role_sid` | The service-level role assigned to users when they are added to the service. See [Conversation Role](https://www.twilio.com/docs/conversations/api/role-resource) for more info about roles. |
  | `default_conversation_creator_role_sid` | The conversation-level role assigned to a conversation creator when they join a new conversation. See [Conversation Role](https://www.twilio.com/docs/conversations/api/role-resource) for more info about roles. |
  | `default_conversation_role_sid` | The conversation-level role assigned to users when they are added to a conversation. See [Conversation Role](https://www.twilio.com/docs/conversations/api/role-resource) for more info about roles. |
  | `links` | Contains an absolute API resource URL to access the push notifications configuration of this service.. Format: uri-map |
  | `reachability_enabled` | Whether the [Reachability Indicator](https://www.twilio.com/docs/conversations/reachability) is enabled for this Conversations Service. The default is `false`. |
  | `url` | An absolute API resource URL for this service configuration.. Format: uri |
  """

  @type t :: %__MODULE__{
          chat_service_sid: String.t() | nil,
          default_chat_service_role_sid: String.t() | nil,
          default_conversation_creator_role_sid: String.t() | nil,
          default_conversation_role_sid: String.t() | nil,
          links: map() | nil,
          reachability_enabled: boolean() | nil,
          url: String.t() | nil
        }

  defstruct [
    :chat_service_sid,
    :default_chat_service_role_sid,
    :default_conversation_creator_role_sid,
    :default_conversation_role_sid,
    :links,
    :reachability_enabled,
    :url
  ]

  @object_name "conversations.v1.service.service_configuration"
  def object_name, do: @object_name
end
