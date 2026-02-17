# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Messaging.V1.Service.Shortcode do
  @moduledoc """
  A Messaging Service resource to add, fetch or remove short code numbers from a Messaging Service.

  SID prefix: `SC`

  Parent: `/Services/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the ShortCode resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `capabilities` | An array of values that describe whether the number can receive calls or messages. Can be: `SMS` and `MMS`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `country_code` | The 2-character [ISO Country Code](https://www.iso.org/iso-3166-country-codes.html) of the number. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `service_sid` | The SID of the [Service](https://www.twilio.com/docs/chat/rest/service-resource) the resource is associated with. |
  | `short_code` | The [E.164](https://www.twilio.com/docs/glossary/what-e164) format of the short code. |
  | `sid` | The unique string that we created to identify the ShortCode resource. |
  | `url` | The absolute URL of the ShortCode resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          capabilities: list() | nil,
          country_code: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          service_sid: String.t() | nil,
          short_code: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :capabilities,
    :country_code,
    :date_created,
    :date_updated,
    :service_sid,
    :short_code,
    :sid,
    :url
  ]

  @object_name "messaging.v1.service.short_code"
  def object_name, do: @object_name

  @sid_prefix "SC"
  def sid_prefix, do: @sid_prefix
end
