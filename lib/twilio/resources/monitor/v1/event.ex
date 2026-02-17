# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Monitor.V1.Event do
  @moduledoc """
  Debugger events

  SID prefix: `AE`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Event resource. |
  | `actor_sid` | The SID of the actor that caused the event, if available. This can be either a User ID (matching the pattern `^US[0-9a-fA-F]{32}$`) or an Account SID (matching the pattern `^AC[0-9a-fA-F]{32}$`). If the actor's SID isn't available, this field will be `null`. |
  | `actor_type` | The type of actor that caused the event. Can be: `user` for a change made by a logged-in user in the Twilio Console, `account` for an event caused by an API request by an authenticating Account, `twilio-admin` for an event caused by a Twilio employee, and so on. |
  | `description` | A description of the event. Can be `null`. |
  | `event_data` | An object with additional data about the event. The  contents depend on `event_type`. For example, event-types of the form `RESOURCE.updated`, this value contains a `resource_properties` dictionary that describes the previous and updated properties of the resource. |
  | `event_date` | The date and time in GMT when the event was recorded specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `event_type` | The event's type. Event-types are typically in the form: `RESOURCE_TYPE.ACTION`, where `RESOURCE_TYPE` is the type of resource that was affected and `ACTION` is what happened to it. For example, `phone-number.created`. For a full list of all event-types, see the [Monitor Event Types](https://www.twilio.com/docs/usage/monitor-events#event-types). |
  | `links` | The absolute URLs of related resources.. Format: uri-map |
  | `resource_sid` | The SID of the resource that was affected. |
  | `resource_type` | The type of resource that was affected. For a full list of all resource-types, see the [Monitor Event Types](https://www.twilio.com/docs/usage/monitor-events#event-types). |
  | `sid` | The unique string that we created to identify the Event resource. |
  | `source` | The originating system or interface that caused the event.  Can be: `web` for events caused by user action in the Twilio Console, `api` for events caused by a request to our API, or   `twilio` for events caused by an automated or internal Twilio system. |
  | `source_ip_address` | The IP address of the source, if the source is outside the Twilio cloud. This value is `null` for events with `source` of `twilio` |
  | `url` | The absolute URL of the resource that was affected. Can be `null`.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          actor_sid: String.t() | nil,
          actor_type: String.t() | nil,
          description: String.t() | nil,
          event_data: String.t() | nil,
          event_date: String.t() | nil,
          event_type: String.t() | nil,
          links: map() | nil,
          resource_sid: String.t() | nil,
          resource_type: String.t() | nil,
          sid: String.t() | nil,
          source: String.t() | nil,
          source_ip_address: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :actor_sid,
    :actor_type,
    :description,
    :event_data,
    :event_date,
    :event_type,
    :links,
    :resource_sid,
    :resource_type,
    :sid,
    :source,
    :source_ip_address,
    :url
  ]

  @object_name "monitor.v1.event"
  def object_name, do: @object_name

  @sid_prefix "AE"
  def sid_prefix, do: @sid_prefix
end
