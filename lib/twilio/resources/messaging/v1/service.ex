# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Messaging.V1.Service do
  @moduledoc """
  A Messaging Service resource to create, fetch, update, delete or add/remove senders from Messaging Services.

  SID prefix: `MG`

  ## Sub-resources
  - `alpha_senders` — `/v1/Services/{service_sid}/AlphaSenders`
  - `channel_senders` — `/v1/Services/{messaging_service_sid}/ChannelSenders`
  - `destination_alpha_senders` — `/v1/Services/{service_sid}/DestinationAlphaSenders`
  - `messages` — `/v1/Services/{messaging_service_sid}/Messages`
  - `phone_numbers` — `/v1/Services/{service_sid}/PhoneNumbers`
  - `short_codes` — `/v1/Services/{service_sid}/ShortCodes`
  - `us_app_to_person` — `/v1/Services/{messaging_service_sid}/Compliance/Usa2p`
  - `us_app_to_person_usecases` — `/v1/Services/{messaging_service_sid}/Compliance/Usa2p/Usecases`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Service resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `area_code_geomatch` | Whether to enable [Area Code Geomatch](https://www.twilio.com/docs/messaging/services#area-code-geomatch) on the Service Instance. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `fallback_method` | The HTTP method we use to call `fallback_url`. Can be: `GET` or `POST`.. Values: `GET`, `POST`. Format: http-method |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `fallback_to_long_code` | [OBSOLETE] Former feature used to fallback to long code sender after certain short code message failures. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `fallback_url` | The URL that we call using `fallback_method` if an error occurs while retrieving or executing the TwiML from the Inbound Request URL. If the `use_inbound_webhook_on_number` field is enabled then the webhook url defined on the phone number will override the `fallback_url` defined for the Messaging Service.. Format: uri |
  | `friendly_name` | The string that you assigned to describe the resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `inbound_method` | The HTTP method we use to call `inbound_request_url`. Can be `GET` or `POST`.. Values: `GET`, `POST`. Format: http-method |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `inbound_request_url` | The URL we call using `inbound_method` when a message is received by any phone number or short code in the Service. When this property is `null`, receiving inbound messages is disabled. All messages sent to the Twilio phone number or short code will not be logged and received on the Account. If the `use_inbound_webhook_on_number` field is enabled then the webhook url defined on the phone number will override the `inbound_request_url` defined for the Messaging Service.. Format: uri |
  | `links` | The absolute URLs of related resources.. Format: uri-map |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `mms_converter` | Whether to enable the [MMS Converter](https://www.twilio.com/docs/messaging/services#mms-converter) for messages sent through the Service instance. |
  | `scan_message_content` | Reserved.. Values: `inherit`, `enable`, `disable` |
  | `sid` | The unique string that we created to identify the Service resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `smart_encoding` | Whether to enable [Smart Encoding](https://www.twilio.com/docs/messaging/services#smart-encoding) for messages sent through the Service instance. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status_callback` | The URL we call to [pass status updates](https://www.twilio.com/docs/sms/api/message-resource#message-status-values) about message delivery.. Format: uri |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `sticky_sender` | Whether to enable [Sticky Sender](https://www.twilio.com/docs/messaging/services#sticky-sender) on the Service instance. |
  | `synchronous_validation` | Reserved. |
  | `url` | The absolute URL of the Service resource.. Format: uri |
  | `us_app_to_person_registered` | Whether US A2P campaign is registered for this Service. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `use_inbound_webhook_on_number` | A boolean value that indicates either the webhook url configured on the phone number will be used or `inbound_request_url`/`fallback_url` url will be called when a message is received from the phone number. If this field is enabled then the webhook url defined on the phone number will override the `inbound_request_url`/`fallback_url` defined for the Messaging Service. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `usecase` | A string that describes the scenario in which the Messaging Service will be used. Possible values are `notifications`, `marketing`, `verification`, `discussion`, `poll`, `undeclared`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `validity_period` | How long, in seconds, messages sent from the Service are valid. Can be an integer from `1` to `36,000`. Default value is `36,000`. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          area_code_geomatch: boolean() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          fallback_method: String.t() | nil,
          fallback_to_long_code: boolean() | nil,
          fallback_url: String.t() | nil,
          friendly_name: String.t() | nil,
          inbound_method: String.t() | nil,
          inbound_request_url: String.t() | nil,
          links: map() | nil,
          mms_converter: boolean() | nil,
          scan_message_content: String.t(),
          sid: String.t() | nil,
          smart_encoding: boolean() | nil,
          status_callback: String.t() | nil,
          sticky_sender: boolean() | nil,
          synchronous_validation: boolean() | nil,
          url: String.t() | nil,
          us_app_to_person_registered: boolean() | nil,
          use_inbound_webhook_on_number: boolean() | nil,
          usecase: String.t() | nil,
          validity_period: integer()
        }

  defstruct [
    :account_sid,
    :area_code_geomatch,
    :date_created,
    :date_updated,
    :fallback_method,
    :fallback_to_long_code,
    :fallback_url,
    :friendly_name,
    :inbound_method,
    :inbound_request_url,
    :links,
    :mms_converter,
    :scan_message_content,
    :sid,
    :smart_encoding,
    :status_callback,
    :sticky_sender,
    :synchronous_validation,
    :url,
    :us_app_to_person_registered,
    :use_inbound_webhook_on_number,
    :usecase,
    :validity_period
  ]

  @object_name "messaging.v1.service"
  def object_name, do: @object_name

  @sid_prefix "MG"
  def sid_prefix, do: @sid_prefix
end
