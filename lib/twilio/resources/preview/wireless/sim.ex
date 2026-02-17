# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Preview.Wireless.Sim do
  @moduledoc """


  SID prefix: `DE`

  ## Sub-resources
  - `usage` — `/wireless/Sims/{sim_sid}/Usage`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `commands_callback_url` | Format: uri |
  | `date_created` | Format: date-time |
  | `date_updated` | Format: date-time |
  | `links` | Format: uri-map |
  | `sms_fallback_method` | Values: `GET`, `POST`. Format: http-method |
  | `sms_fallback_url` | Format: uri |
  | `sms_method` | Values: `GET`, `POST`. Format: http-method |
  | `sms_url` | Format: uri |
  | `url` | Format: uri |
  | `voice_fallback_method` | Values: `GET`, `POST`. Format: http-method |
  | `voice_fallback_url` | Format: uri |
  | `voice_method` | Values: `GET`, `POST`. Format: http-method |
  | `voice_url` | Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          commands_callback_method: String.t() | nil,
          commands_callback_url: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          e_id: String.t() | nil,
          friendly_name: String.t() | nil,
          iccid: String.t() | nil,
          links: map() | nil,
          rate_plan_sid: String.t() | nil,
          sid: String.t() | nil,
          sms_fallback_method: String.t() | nil,
          sms_fallback_url: String.t() | nil,
          sms_method: String.t() | nil,
          sms_url: String.t() | nil,
          status: String.t() | nil,
          unique_name: String.t() | nil,
          url: String.t() | nil,
          voice_fallback_method: String.t() | nil,
          voice_fallback_url: String.t() | nil,
          voice_method: String.t() | nil,
          voice_url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :commands_callback_method,
    :commands_callback_url,
    :date_created,
    :date_updated,
    :e_id,
    :friendly_name,
    :iccid,
    :links,
    :rate_plan_sid,
    :sid,
    :sms_fallback_method,
    :sms_fallback_url,
    :sms_method,
    :sms_url,
    :status,
    :unique_name,
    :url,
    :voice_fallback_method,
    :voice_fallback_url,
    :voice_method,
    :voice_url
  ]

  @object_name "preview.wireless.sim"
  def object_name, do: @object_name

  @sid_prefix "DE"
  def sid_prefix, do: @sid_prefix
end
