# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Messaging.V2.LinkShortening.Domain.DomainCerts do
  @moduledoc """
  DomainCerts resource.

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `cert_in_validation` | Optional JSON field describing the status and upload date of a new certificate in the process of validation |
  | `certificate_sid` | The unique string that we created to identify this Certificate resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | Date that this Domain was registered to the Twilio platform to create a new Domain object.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_expires` | Date that the private certificate associated with this domain expires. You will need to update the certificate before that date to ensure your shortened links will continue to work.. Format: date-time |
  | `date_updated` | Date that this Domain was last updated.. Format: date-time |
  | `domain_name` | Full url path for this domain.. Format: uri |
  | `domain_sid` | The unique string that we created to identify the Domain resource. |
  | `managed` | Boolean field that indicates whether the certificate is managed by Twilio or uploaded by the customer. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `requesting` | Boolean field that indicates whether a Twilio managed cert request is in progress or completed. True indicates a request is in progress and false indicates the request has completed or not requested yet. |
  | `url` | Format: uri |
  """

  @type t :: %__MODULE__{
          cert_in_validation: String.t() | nil,
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
    :cert_in_validation,
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

  @object_name "messaging.v2.domain_cert_v4"
  def object_name, do: @object_name
end
