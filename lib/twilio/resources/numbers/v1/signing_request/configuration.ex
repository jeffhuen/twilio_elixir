# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Numbers.V1.SigningRequest.Configuration do
  @moduledoc """
  Configuration resource.

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `country` | The country ISO code to apply the configuration.. Format: iso-country-code |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `email_message` | Content of the email that the end client will receive ex: “This is a Hosting request from Twilio, please check the document and sign it”, maximum length of 5,000 characters. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `email_subject` | Subject of the email that the end client will receive ex: “Twilio Hosting Request”, maximum length of 255 characters. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `friendly_name` | This is the string that you assigned as a friendly name for describing the creation of the configuration. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `logo_sid` | The SID of the document  that includes the logo that will appear in the LOA. To upload documents follow the following guide: https://www.twilio.com/docs/phone-numbers/regulatory/getting-started/create-new-bundle-public-rest-apis#supporting-document-create  |
  | `product` | The product or service for which is requesting the signature. |
  | `url` | Format: uri |
  | `url_redirection` | Url the end client will be redirected after signing a document. |
  """

  @type t :: %__MODULE__{
          country: String.t() | nil,
          email_message: String.t() | nil,
          email_subject: String.t() | nil,
          friendly_name: String.t() | nil,
          logo_sid: String.t() | nil,
          product: String.t() | nil,
          url: String.t() | nil,
          url_redirection: String.t() | nil
        }

  defstruct [
    :country,
    :email_message,
    :email_subject,
    :friendly_name,
    :logo_sid,
    :product,
    :url,
    :url_redirection
  ]

  @object_name "numbers.v1.signing_request_configuration"
  def object_name, do: @object_name
end
