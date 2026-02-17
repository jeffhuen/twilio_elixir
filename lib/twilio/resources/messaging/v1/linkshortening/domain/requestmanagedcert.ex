# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Messaging.V1.Linkshortening.Domain.Requestmanagedcert do
  @moduledoc """
  Requestmanagedcert resource.

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `certificate_sid` | The unique string that we created to identify this Certificate resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | Date that this Domain was registered to the Twilio platform to create a new Domain object.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_expires` | Date that the private certificate associated with this domain expires. This is the expiration date of your existing cert.. Format: date-time |
  | `date_updated` | Date that this Domain was last updated.. Format: date-time |
  | `domain_name` | Full url path for this domain.. Format: uri |
  | `domain_sid` | The unique string that we created to identify the Domain resource. |
  | `managed` | A boolean flag indicating if the certificate is managed by Twilio. |
  | `requesting` | A boolean flag indicating if a managed certificate needs to be fulfilled by Twilio. |
  | `url` | Format: uri |
  """

  @type t :: %__MODULE__{
          certificate_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_expires: String.t() | nil,
          date_updated: String.t() | nil,
          domain_name: String.t() | nil,
          domain_sid: String.t() | nil,
          managed: boolean() | nil,
          requesting: boolean() | nil,
          url: String.t() | nil
        }

  defstruct [
    :certificate_sid,
    :date_created,
    :date_expires,
    :date_updated,
    :domain_name,
    :domain_sid,
    :managed,
    :requesting,
    :url
  ]

  @object_name "messaging.v1.request_managed_cert"
  def object_name, do: @object_name
end
