# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Events.V1.Subscription.SubscribedEvent do
  @moduledoc """
  Event subscribed to in the parent Subscription

  Parent: `/Subscriptions/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The unique SID identifier of the Account. |
  | `schema_version` | The schema version that the Subscription should use. |
  | `subscription_sid` | The unique SID identifier of the Subscription. |
  | `type` | Type of event being subscribed to. |
  | `url` | The URL of this resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          schema_version: integer(),
          subscription_sid: String.t() | nil,
          type: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:account_sid, :schema_version, :subscription_sid, :type, :url]

  @object_name "events.v1.subscription.subscribed_event"
  def object_name, do: @object_name
end
