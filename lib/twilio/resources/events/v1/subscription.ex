# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Events.V1.Subscription do
  @moduledoc """
  Subscription to send Event Types to a Sink

  SID prefix: `DF`

  ## Sub-resources
  - `subscribed_events` — `/v1/Subscriptions/{subscription_sid}/SubscribedEvents`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The unique SID identifier of the Account. |
  | `date_created` | The date that this Subscription was created, given in ISO 8601 format.. Format: date-time |
  | `date_updated` | The date that this Subscription was updated, given in ISO 8601 format.. Format: date-time |
  | `description` | A human readable description for the Subscription |
  | `links` | Contains a dictionary of URL links to nested resources of this Subscription.. Format: uri-map |
  | `sid` | A 34 character string that uniquely identifies this Subscription. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `sink_sid` | The SID of the sink that events selected by this subscription should be sent to. Sink must be active for the subscription to be created. |
  | `url` | The URL of this resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          description: String.t() | nil,
          links: map() | nil,
          sid: String.t() | nil,
          sink_sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :date_created,
    :date_updated,
    :description,
    :links,
    :sid,
    :sink_sid,
    :url
  ]

  @object_name "events.v1.subscription"
  def object_name, do: @object_name

  @sid_prefix "DF"
  def sid_prefix, do: @sid_prefix
end
