# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Proxy.V1.Service.Session do
  @moduledoc """
  Session resource.

  SID prefix: `KC`

  Parent: `/Services/{Sid}`

  ## Sub-resources
  - `interactions` — `/v1/Services/{service_sid}/Sessions/{session_sid}/Interactions`
  - `participants` — `/v1/Services/{service_sid}/Sessions/{session_sid}/Participants`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Session resource. |
  | `closed_reason` | The reason the Session ended. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time in GMT when the resource was created.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_ended` | The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date when the Session ended.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_expiry` | The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date when the Session should expire. If this is value is present, it overrides the `ttl` value.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_last_interaction` | The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date when the Session last had an interaction.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_started` | The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date when the Session started.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time in GMT when the resource was last updated.. Format: date-time |
  | `links` | The URLs of resources related to the Session.. Format: uri-map |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `mode` | The Mode of the Session. Can be: `message-only`, `voice-only`, or `voice-and-message`.. Values: `message-only`, `voice-only`, `voice-and-message` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `service_sid` | The SID of the [Service](https://www.twilio.com/docs/proxy/api/service) the session is associated with. |
  | `sid` | The unique string that we created to identify the Session resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status` | The status of the Session. Can be: `open`, `in-progress`, `closed`, `failed`, or `unknown`.. Values: `open`, `in-progress`, `closed`, `failed`, `unknown` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ttl` | The time, in seconds, when the session will expire. The time is measured from the last Session create or the Session's last Interaction. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `unique_name` | An application-defined string that uniquely identifies the resource. This value must be 191 characters or fewer in length and be unique. Supports UTF-8 characters. **This value should not have PII.** |
  | `url` | The absolute URL of the Session resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          closed_reason: String.t() | nil,
          date_created: String.t() | nil,
          date_ended: String.t() | nil,
          date_expiry: String.t() | nil,
          date_last_interaction: String.t() | nil,
          date_started: String.t() | nil,
          date_updated: String.t() | nil,
          links: map() | nil,
          mode: String.t(),
          service_sid: String.t() | nil,
          sid: String.t() | nil,
          status: String.t(),
          ttl: integer(),
          unique_name: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :closed_reason,
    :date_created,
    :date_ended,
    :date_expiry,
    :date_last_interaction,
    :date_started,
    :date_updated,
    :links,
    :mode,
    :service_sid,
    :sid,
    :status,
    :ttl,
    :unique_name,
    :url
  ]

  @object_name "proxy.v1.service.session"
  def object_name, do: @object_name

  @sid_prefix "KC"
  def sid_prefix, do: @sid_prefix
end
