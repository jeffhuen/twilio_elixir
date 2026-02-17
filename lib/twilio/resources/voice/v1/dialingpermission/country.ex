# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Voice.V1.Dialingpermission.Country do
  @moduledoc """


  Parent: `/DialingPermissions`

  ## Sub-resources
  - `highrisk_special_prefixes` — `/v1/DialingPermissions/Countries/{iso_code}/HighRiskSpecialPrefixes`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `continent` | The name of the continent in which the country is located. |
  | `country_codes` | The E.164 assigned [country codes(s)](https://www.itu.int/itudoc/itu-t/ob-lists/icc/e164_763.html) |
  | `high_risk_special_numbers_enabled` | Whether dialing to high-risk special services numbers is enabled. These prefixes include number ranges allocated by the country and include premium numbers, special services, shared cost, and others |
  | `high_risk_tollfraud_numbers_enabled` | Whether dialing to high-risk [toll fraud](https://www.twilio.com/blog/how-to-protect-your-account-from-toll-fraud-with-voice-dialing-geo-permissions-html) numbers is enabled. These prefixes include narrow number ranges that have a high-risk of international revenue sharing fraud (IRSF) attacks, also known as [toll fraud](https://www.twilio.com/blog/how-to-protect-your-account-from-toll-fraud-with-voice-dialing-geo-permissions-html). These prefixes are collected from anti-fraud databases and verified by analyzing calls on our network. These prefixes are not available for download and are updated frequently |
  | `iso_code` | The [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2).. Format: iso-country-code |
  | `links` | A list of URLs related to this resource.. Format: uri-map |
  | `low_risk_numbers_enabled` | Whether dialing to low-risk numbers is enabled. |
  | `name` | The name of the country. |
  | `url` | The absolute URL of this resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          continent: String.t() | nil,
          country_codes: list() | nil,
          high_risk_special_numbers_enabled: boolean() | nil,
          high_risk_tollfraud_numbers_enabled: boolean() | nil,
          iso_code: String.t() | nil,
          links: map() | nil,
          low_risk_numbers_enabled: boolean() | nil,
          name: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :continent,
    :country_codes,
    :high_risk_special_numbers_enabled,
    :high_risk_tollfraud_numbers_enabled,
    :iso_code,
    :links,
    :low_risk_numbers_enabled,
    :name,
    :url
  ]

  @object_name "voice.v1.dialing_permissions.dialing_permissions_country-instance"
  def object_name, do: @object_name
end
