# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Messaging.V1.A2p.BrandRegistration.Vetting do
  @moduledoc """
  A Messaging Service resource to add and get Brand Vettings.

  Parent: `/a2p/BrandRegistrations/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the vetting record. |
  | `brand_sid` | The unique string to identify Brand Registration. |
  | `brand_vetting_sid` | The Twilio SID of the third-party vetting record. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `url` | The absolute URL of the Brand Vetting resource.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `vetting_class` | The type of vetting that has been conducted. One of “STANDARD” (Aegis) or “POLITICAL” (Campaign Verify). |
  | `vetting_id` | The unique identifier of the vetting from the third-party provider. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `vetting_provider` | The third-party provider that has conducted the vetting. One of “CampaignVerify” (Campaign Verify tokens) or “AEGIS” (Secondary Vetting).. Values: `campaign-verify`, `aegis` |
  | `vetting_status` | The status of the import vetting attempt. One of “PENDING,” “SUCCESS,” or “FAILED”. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          brand_sid: String.t() | nil,
          brand_vetting_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          url: String.t() | nil,
          vetting_class: String.t() | nil,
          vetting_id: String.t() | nil,
          vetting_provider: String.t(),
          vetting_status: String.t() | nil
        }

  defstruct [
    :account_sid,
    :brand_sid,
    :brand_vetting_sid,
    :date_created,
    :date_updated,
    :url,
    :vetting_class,
    :vetting_id,
    :vetting_provider,
    :vetting_status
  ]

  @object_name "messaging.v1.brand_registrations.brand_vetting"
  def object_name, do: @object_name
end
