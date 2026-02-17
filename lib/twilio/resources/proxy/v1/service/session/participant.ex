# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Proxy.V1.Service.Session.Participant do
  @moduledoc """


  SID prefix: `KP`

  Parent: `/Services/{ServiceSid}/Sessions/{Sid}`

  ## Sub-resources
  - `message_interactions` — `/v1/Services/{service_sid}/Sessions/{session_sid}/Participants/{participant_sid}/MessageInteractions`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Participant resource. |
  | `date_created` | The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time in GMT when the resource was created.. Format: date-time |
  | `date_deleted` | The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date when the Participant was removed from the session.. Format: date-time |
  | `date_updated` | The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time in GMT when the resource was last updated.. Format: date-time |
  | `friendly_name` | The string that you assigned to describe the participant. This value must be 255 characters or fewer. Supports UTF-8 characters. **This value should not have PII.** |
  | `identifier` | The phone number or channel identifier of the Participant. This value must be 191 characters or fewer. Supports UTF-8 characters.. PII: standard |
  | `links` | The URLs to resources related the participant.. Format: uri-map |
  | `proxy_identifier` | The phone number or short code (masked number) of the participant's partner. The participant will call or message the partner participant at this number. |
  | `proxy_identifier_sid` | The SID of the Proxy Identifier assigned to the Participant. |
  | `service_sid` | The SID of the resource's parent [Service](https://www.twilio.com/docs/proxy/api/service) resource. |
  | `session_sid` | The SID of the parent [Session](https://www.twilio.com/docs/proxy/api/session) resource. |
  | `sid` | The unique string that we created to identify the Participant resource. |
  | `url` | The absolute URL of the Participant resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_deleted: String.t() | nil,
          date_updated: String.t() | nil,
          friendly_name: String.t() | nil,
          identifier: String.t() | nil,
          links: map() | nil,
          proxy_identifier: String.t() | nil,
          proxy_identifier_sid: String.t() | nil,
          service_sid: String.t() | nil,
          session_sid: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :date_created,
    :date_deleted,
    :date_updated,
    :friendly_name,
    :identifier,
    :links,
    :proxy_identifier,
    :proxy_identifier_sid,
    :service_sid,
    :session_sid,
    :sid,
    :url
  ]

  @object_name "proxy.v1.service.session.participant"
  def object_name, do: @object_name

  @sid_prefix "KP"
  def sid_prefix, do: @sid_prefix
end
