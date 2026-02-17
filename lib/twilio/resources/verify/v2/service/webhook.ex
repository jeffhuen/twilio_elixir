# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Verify.V2.Service.Webhook do
  @moduledoc """
  Webhook resource.

  SID prefix: `YW`

  Parent: `/Services/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Service resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `event_types` | The array of events that this Webhook is subscribed to. Possible event types: `*, factor.deleted, factor.created, factor.verified, challenge.approved, challenge.denied` |
  | `friendly_name` | The string that you assigned to describe the webhook. **This value should not contain PII.** |
  | `service_sid` | The unique SID identifier of the Service. |
  | `sid` | The unique string that we created to identify the Webhook resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status` | The webhook status. Default value is `enabled`. One of: `enabled` or `disabled`. Values: `enabled`, `disabled` |
  | `url` | The absolute URL of the Webhook resource.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `version` | The webhook version. Default value is `v2` which includes all the latest fields. Version `v1` is legacy and may be removed in the future.. Values: `v1`, `v2` |
  | `webhook_method` | The method to be used when calling the webhook's URL.. Values: `GET`, `POST` |
  | `webhook_url` | The URL associated with this Webhook.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          event_types: list() | nil,
          friendly_name: String.t() | nil,
          service_sid: String.t() | nil,
          sid: String.t() | nil,
          status: String.t(),
          url: String.t() | nil,
          version: String.t(),
          webhook_method: String.t(),
          webhook_url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :date_created,
    :date_updated,
    :event_types,
    :friendly_name,
    :service_sid,
    :sid,
    :status,
    :url,
    :version,
    :webhook_method,
    :webhook_url
  ]

  @object_name "verify.v2.service.webhook"
  def object_name, do: @object_name

  @sid_prefix "YW"
  def sid_prefix, do: @sid_prefix
end
