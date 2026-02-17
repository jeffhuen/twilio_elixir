# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Conversations.V1.Configuration do
  @moduledoc """
  The Configuration resource manages a set of account-level settings applicable to the Conversations API.

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) responsible for this configuration. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `default_chat_service_sid` | The SID of the default [Conversation Service](https://www.twilio.com/docs/conversations/api/service-resource) used when creating a conversation. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `default_closed_timer` | Default ISO8601 duration when conversation will be switched to `closed` state. Minimum value for this timer is 10 minutes. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `default_inactive_timer` | Default ISO8601 duration when conversation will be switched to `inactive` state. Minimum value for this timer is 1 minute. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `default_messaging_service_sid` | The SID of the default [Messaging Service](https://www.twilio.com/docs/messaging/api/service-resource) used when creating a conversation. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `links` | Contains absolute API resource URLs to access the webhook and default service configurations.. Format: uri-map |
  | `url` | An absolute API resource URL for this global configuration.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          default_chat_service_sid: String.t() | nil,
          default_closed_timer: String.t() | nil,
          default_inactive_timer: String.t() | nil,
          default_messaging_service_sid: String.t() | nil,
          links: map() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :default_chat_service_sid,
    :default_closed_timer,
    :default_inactive_timer,
    :default_messaging_service_sid,
    :links,
    :url
  ]

  @object_name "conversations.v1.configuration"
  def object_name, do: @object_name
end
