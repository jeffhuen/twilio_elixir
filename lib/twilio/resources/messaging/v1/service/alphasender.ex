# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Messaging.V1.Service.Alphasender do
  @moduledoc """
  A Messaging Service resource to add, fetch or remove an Alpha Sender ID from a Messaging Service.

  SID prefix: `AI`

  Parent: `/Services/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the AlphaSender resource. |
  | `alpha_sender` | The Alphanumeric Sender ID string. |
  | `capabilities` | An array of values that describe whether the number can receive calls or messages. Can be: `SMS`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `service_sid` | The SID of the [Service](https://www.twilio.com/docs/chat/rest/service-resource) the resource is associated with. |
  | `sid` | The unique string that we created to identify the AlphaSender resource. |
  | `url` | The absolute URL of the AlphaSender resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          alpha_sender: String.t() | nil,
          capabilities: list() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          service_sid: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :alpha_sender,
    :capabilities,
    :date_created,
    :date_updated,
    :service_sid,
    :sid,
    :url
  ]

  @object_name "messaging.v1.service.alpha_sender"
  def object_name, do: @object_name

  @sid_prefix "AI"
  def sid_prefix, do: @sid_prefix
end
