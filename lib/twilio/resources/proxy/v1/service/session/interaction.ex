# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Proxy.V1.Service.Session.Interaction do
  @moduledoc """


  SID prefix: `KI`

  Parent: `/Services/{ServiceSid}/Sessions/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Interaction resource. |
  | `data` | A JSON string that includes the message body of message interactions (e.g. `{"body": "hello"}`) or the call duration (when available) of a call (e.g. `{"duration": "5"}`).. PII: sensitive |
  | `date_created` | The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time in GMT when the Interaction was created.. Format: date-time |
  | `date_updated` | The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time in GMT when the resource was last updated.. Format: date-time |
  | `inbound_participant_sid` | The SID of the inbound [Participant](https://www.twilio.com/docs/proxy/api/participant) resource. |
  | `inbound_resource_sid` | The SID of the inbound resource; either the [Call](https://www.twilio.com/docs/voice/api/call-resource) or [Message](https://www.twilio.com/docs/sms/api/message-resource). |
  | `inbound_resource_status` | The inbound resource status of the Interaction. Will always be `delivered` for messages and `in-progress` for calls.. Values: `accepted`, `answered`, `busy`, `canceled`, `completed`, `deleted`, `delivered`, `delivery-unknown`, `failed`, `in-progress`, `initiated`, `no-answer`, `queued`, `received`, `receiving`, `ringing`, `scheduled`, `sending`, `sent`, `undelivered`, `unknown` |
  | `inbound_resource_type` | The inbound resource type. Can be [Call](https://www.twilio.com/docs/voice/api/call-resource) or [Message](https://www.twilio.com/docs/sms/api/message-resource). |
  | `inbound_resource_url` | The URL of the Twilio inbound resource. Format: uri |
  | `outbound_participant_sid` | The SID of the outbound [Participant](https://www.twilio.com/docs/proxy/api/participant)). |
  | `outbound_resource_sid` | The SID of the outbound resource; either the [Call](https://www.twilio.com/docs/voice/api/call-resource) or [Message](https://www.twilio.com/docs/sms/api/message-resource). |
  | `outbound_resource_status` | The inbound resource status of the Interaction. Will always be `delivered` for messages and `in-progress` for calls.. Values: `accepted`, `answered`, `busy`, `canceled`, `completed`, `deleted`, `delivered`, `delivery-unknown`, `failed`, `in-progress`, `initiated`, `no-answer`, `queued`, `received`, `receiving`, `ringing`, `scheduled`, `sending`, `sent`, `undelivered`, `unknown` |
  | `outbound_resource_type` | The outbound resource type. Can be: [Call](https://www.twilio.com/docs/voice/api/call-resource) or [Message](https://www.twilio.com/docs/sms/api/message-resource). |
  | `outbound_resource_url` | The URL of the Twilio outbound resource.. Format: uri |
  | `service_sid` | The SID of the parent [Service](https://www.twilio.com/docs/proxy/api/service) resource. |
  | `session_sid` | The SID of the parent [Session](https://www.twilio.com/docs/proxy/api/session) resource. |
  | `sid` | The unique string that we created to identify the Interaction resource. |
  | `type` | The Type of the Interaction. Can be: `message`, `voice` or `unknown`.. Values: `message`, `voice`, `unknown` |
  | `url` | The absolute URL of the Interaction resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          data: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          inbound_participant_sid: String.t() | nil,
          inbound_resource_sid: String.t() | nil,
          inbound_resource_status: String.t(),
          inbound_resource_type: String.t() | nil,
          inbound_resource_url: String.t() | nil,
          outbound_participant_sid: String.t() | nil,
          outbound_resource_sid: String.t() | nil,
          outbound_resource_status: String.t(),
          outbound_resource_type: String.t() | nil,
          outbound_resource_url: String.t() | nil,
          service_sid: String.t() | nil,
          session_sid: String.t() | nil,
          sid: String.t() | nil,
          type: String.t(),
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :data,
    :date_created,
    :date_updated,
    :inbound_participant_sid,
    :inbound_resource_sid,
    :inbound_resource_status,
    :inbound_resource_type,
    :inbound_resource_url,
    :outbound_participant_sid,
    :outbound_resource_sid,
    :outbound_resource_status,
    :outbound_resource_type,
    :outbound_resource_url,
    :service_sid,
    :session_sid,
    :sid,
    :type,
    :url
  ]

  @object_name "proxy.v1.service.session.interaction"
  def object_name, do: @object_name

  @sid_prefix "KI"
  def sid_prefix, do: @sid_prefix
end
