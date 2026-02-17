# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Messaging.V1.LinkShortening.MessagingService.DomainConfig do
  @moduledoc """
  DomainConfig resource.

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `callback_url` | URL to receive click events to your webhook whenever the recipients click on the shortened links.. Format: uri |
  | `config_sid` | The unique string that we created to identify the Domain config (prefix ZK). |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `continue_on_failure` | Boolean field to set customer delivery preference when there is a failure in linkShortening service |
  | `date_created` | Date this Domain Config was created.. Format: date-time |
  | `date_updated` | Date that this Domain Config was last updated.. Format: date-time |
  | `domain_sid` | The unique string that we created to identify the Domain resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `fallback_url` | Any requests we receive to this domain that do not match an existing shortened message will be redirected to the fallback url. These will likely be either expired messages, random misdirected traffic, or intentional scraping.. Format: uri |
  | `messaging_service_sid` | The unique string that identifies the messaging service |
  | `url` | Format: uri |
  """

  @type t :: %__MODULE__{
          callback_url: String.t() | nil,
          config_sid: String.t() | nil,
          continue_on_failure: boolean() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          domain_sid: String.t() | nil,
          fallback_url: String.t() | nil,
          messaging_service_sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :callback_url,
    :config_sid,
    :continue_on_failure,
    :date_created,
    :date_updated,
    :domain_sid,
    :fallback_url,
    :messaging_service_sid,
    :url
  ]

  @object_name "messaging.v1.domain_config_messaging_service"
  def object_name, do: @object_name
end
