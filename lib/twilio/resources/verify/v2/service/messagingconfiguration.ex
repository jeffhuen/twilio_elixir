# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Verify.V2.Service.Messagingconfiguration do
  @moduledoc """


  Parent: `/Services/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Service resource. |
  | `country` | The [ISO-3166-1](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country code of the country this configuration will be applied to. If this is a global configuration, Country will take the value `all`. |
  | `date_created` | The date and time in GMT when the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `messaging_service_sid` | The SID of the [Messaging Service](https://www.twilio.com/docs/messaging/api/service-resource) to be used to send SMS to the country of this configuration. |
  | `service_sid` | The SID of the [Service](https://www.twilio.com/docs/verify/api/service) that the resource is associated with. |
  | `url` | The URL of this resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          country: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          messaging_service_sid: String.t() | nil,
          service_sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :country,
    :date_created,
    :date_updated,
    :messaging_service_sid,
    :service_sid,
    :url
  ]

  @object_name "verify.v2.service.messaging_configuration"
  def object_name, do: @object_name
end
