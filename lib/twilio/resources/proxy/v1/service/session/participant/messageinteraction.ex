# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Proxy.V1.Service.Session.Participant.Messageinteraction do
  @moduledoc """
  Messageinteraction resource.

  SID prefix: `KI`

  Parent: `/Services/{ServiceSid}/Sessions/{SessionSid}/Participants/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the MessageInteraction resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `data` | A JSON string that includes the message body sent to the participant. (e.g. `{"body": "hello"}`). PII: sensitive |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time in GMT when the resource was created.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time in GMT when the resource was last updated.. Format: date-time |
  | `inbound_participant_sid` | Always empty for created Message Interactions. |
  | `inbound_resource_sid` | Always empty for created Message Interactions. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `inbound_resource_status` | Always empty for created Message Interactions.. Values: `accepted`, `answered`, `busy`, `canceled`, `completed`, `deleted`, `delivered`, `delivery-unknown`, `failed`, `in-progress`, `initiated`, `no-answer`, `queued`, `received`, `receiving`, `ringing`, `scheduled`, `sending`, `sent`, `undelivered`, `unknown` |
  | `inbound_resource_type` | Always empty for created Message Interactions. |
  | `inbound_resource_url` | Always empty for created Message Interactions.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `outbound_participant_sid` | The SID of the outbound [Participant](https://www.twilio.com/docs/proxy/api/participant) resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `outbound_resource_sid` | The SID of the outbound [Message](https://www.twilio.com/docs/sms/api/message-resource) resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `outbound_resource_status` | Always empty for created Message Interactions.. Values: `accepted`, `answered`, `busy`, `canceled`, `completed`, `deleted`, `delivered`, `delivery-unknown`, `failed`, `in-progress`, `initiated`, `no-answer`, `queued`, `received`, `receiving`, `ringing`, `scheduled`, `sending`, `sent`, `undelivered`, `unknown` |
  | `outbound_resource_type` | The outbound resource type. This value is always `Message`. |
  | `outbound_resource_url` | The URL of the Twilio message resource.. Format: uri |
  | `participant_sid` | The SID of the [Participant](https://www.twilio.com/docs/proxy/api/participant) resource. |
  | `service_sid` | The SID of the parent [Service](https://www.twilio.com/docs/proxy/api/service) resource. |
  | `session_sid` | The SID of the parent [Session](https://www.twilio.com/docs/proxy/api/session) resource. |
  | `sid` | The unique string that we created to identify the MessageInteraction resource. |
  | `type` | The Type of Message Interaction. This value is always `message`.. Values: `message`, `voice`, `unknown` |
  | `url` | The absolute URL of the MessageInteraction resource.. Format: uri |
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
          participant_sid: String.t() | nil,
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
    :participant_sid,
    :service_sid,
    :session_sid,
    :sid,
    :type,
    :url
  ]

  @object_name "proxy.v1.service.session.participant.message_interaction"
  def object_name, do: @object_name

  @sid_prefix "KI"
  def sid_prefix, do: @sid_prefix
end
