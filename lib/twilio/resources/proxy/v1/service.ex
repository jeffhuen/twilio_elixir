# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Proxy.V1.Service do
  @moduledoc """
  Service resource.

  SID prefix: `KS`

  ## Sub-resources
  - `phone_numbers` — `/v1/Services/{service_sid}/PhoneNumbers`
  - `sessions` — `/v1/Services/{service_sid}/Sessions`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Service resource. |
  | `callback_url` | The URL we call when the interaction status changes.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `chat_instance_sid` | The SID of the Chat Service Instance managed by Proxy Service. The Chat Service enables Proxy to forward SMS and channel messages to this chat instance. This is a one-to-one relationship. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time in GMT when the resource was created.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time in GMT when the resource was last updated.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `default_ttl` | The default `ttl` value for Sessions created in the Service. The TTL (time to live) is measured in seconds after the Session's last create or last Interaction. The default value of `0` indicates an unlimited Session length. You can override a Session's default TTL value by setting its `ttl` value. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `geo_match_level` | Where a proxy number must be located relative to the participant identifier. Can be: `country`, `area-code`, or `extended-area-code`. The default value is `country` and more specific areas than `country` are only available in North America.. Values: `area-code`, `overlay`, `radius`, `country` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `intercept_callback_url` | The URL we call on each interaction. If we receive a 403 status, we block the interaction; otherwise the interaction continues.. Format: uri |
  | `links` | The URLs of resources related to the Service.. Format: uri-map |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `number_selection_behavior` | The preference for Proxy Number selection in the Service instance. Can be: `prefer-sticky` or `avoid-sticky`. `prefer-sticky` means that we will try and select the same Proxy Number for a given participant if they have previous [Sessions](https://www.twilio.com/docs/proxy/api/session), but we will not fail if that Proxy Number cannot be used.  `avoid-sticky` means that we will try to use different Proxy Numbers as long as that is possible within a given pool rather than try and use a previously assigned number.. Values: `avoid-sticky`, `prefer-sticky` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `out_of_session_callback_url` | The URL we call when an inbound call or SMS action occurs on a closed or non-existent Session. If your server (or a Twilio [function](https://www.twilio.com/en-us/serverless/functions)) responds with valid [TwiML](https://www.twilio.com/docs/voice/twiml), we will process it. This means it is possible, for example, to play a message for a call, send an automated text message response, or redirect a call to another Phone Number. See [Out-of-Session Callback Response Guide](https://www.twilio.com/docs/proxy/out-session-callback-response-guide) for more information.. Format: uri |
  | `sid` | The unique string that we created to identify the Service resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `unique_name` | An application-defined string that uniquely identifies the resource. This value must be 191 characters or fewer in length and be unique. Supports UTF-8 characters. **This value should not have PII.** |
  | `url` | The absolute URL of the Service resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          callback_url: String.t() | nil,
          chat_instance_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          default_ttl: integer(),
          geo_match_level: String.t(),
          intercept_callback_url: String.t() | nil,
          links: map() | nil,
          number_selection_behavior: String.t(),
          out_of_session_callback_url: String.t() | nil,
          sid: String.t() | nil,
          unique_name: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :callback_url,
    :chat_instance_sid,
    :date_created,
    :date_updated,
    :default_ttl,
    :geo_match_level,
    :intercept_callback_url,
    :links,
    :number_selection_behavior,
    :out_of_session_callback_url,
    :sid,
    :unique_name,
    :url
  ]

  @object_name "proxy.v1.service"
  def object_name, do: @object_name

  @sid_prefix "KS"
  def sid_prefix, do: @sid_prefix
end
