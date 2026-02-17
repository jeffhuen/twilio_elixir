# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Api.V2010.Message do
  @moduledoc """
  A Message resource represents an inbound or outbound message.

  SID prefix: `SM|MM`

  Parent: `/Accounts/{Sid}.json`

  ## Sub-resources
  - `feedback` — `/2010-04-01/Accounts/{account_sid}/Messages/{message_sid}/Feedback.json`
  - `media` — `/2010-04-01/Accounts/{account_sid}/Messages/{message_sid}/Media.json`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) associated with the Message resource |
  | `api_version` | The API version used to process the Message |
  | `body` | The text content of the message. PII: standard |
  | `date_created` | The [RFC 2822](https://datatracker.ietf.org/doc/html/rfc2822#section-3.3) timestamp (in GMT) of when the Message resource was created. Format: date-time-rfc-2822 |
  | `date_sent` | The [RFC 2822](https://datatracker.ietf.org/doc/html/rfc2822#section-3.3) timestamp (in GMT) of when the Message was sent. For an outgoing message, this is when Twilio sent the message. For an incoming message, this is when Twilio sent the HTTP request to your incoming message webhook URL.. Format: date-time-rfc-2822 |
  | `date_updated` | The [RFC 2822](https://datatracker.ietf.org/doc/html/rfc2822#section-3.3) timestamp (in GMT) of when the Message resource was last updated. Format: date-time-rfc-2822 |
  | `direction` | The direction of the message. Can be: `inbound` for incoming messages, `outbound-api` for messages created by the REST API, `outbound-call` for messages created during a call, or `outbound-reply` for messages created in response to an incoming message.. Values: `inbound`, `outbound-api`, `outbound-call`, `outbound-reply` |
  | `error_code` | The [error code](https://www.twilio.com/docs/api/errors) returned if the Message `status` is `failed` or `undelivered`. If no error was encountered, the value is `null`. The value returned in this field for a specific error cause is subject to change as Twilio improves errors. Users should not use the `error_code` and `error_message` fields programmatically. |
  | `error_message` | The description of the `error_code` if the Message `status` is `failed` or `undelivered`. If no error was encountered, the value is `null`. The value returned in this field for a specific error cause is subject to change as Twilio improves errors. Users should not use the `error_code` and `error_message` fields programmatically. |
  | `from` | The sender's phone number (in [E.164](https://en.wikipedia.org/wiki/E.164) format), [alphanumeric sender ID](https://www.twilio.com/docs/sms/quickstart), [Wireless SIM](https://www.twilio.com/docs/iot/wireless/programmable-wireless-send-machine-machine-sms-commands), [short code](https://www.twilio.com/en-us/messaging/channels/sms/short-codes), or  [channel address](https://www.twilio.com/docs/messaging/channels) (e.g., `whatsapp:+15554449999`). For incoming messages, this is the number or channel address of the sender. For outgoing messages, this value is a Twilio phone number, alphanumeric sender ID, short code, or channel address from which the message is sent.. Format: phone-number. PII: standard |
  | `messaging_service_sid` | The SID of the [Messaging Service](https://www.twilio.com/docs/messaging/api/service-resource) associated with the Message resource. A unique default value is assigned if a Messaging Service is not used. |
  | `num_media` | The number of media files associated with the Message resource. |
  | `num_segments` | The number of segments that make up the complete message. SMS message bodies that exceed the [character limit](https://www.twilio.com/docs/glossary/what-sms-character-limit) are segmented and charged as multiple messages. Note: For messages sent via a Messaging Service, `num_segments` is initially `0`, since a sender hasn't yet been assigned. |
  | `price` | The amount billed for the message in the currency specified by `price_unit`. The `price` is populated after the message has been sent/received, and may not be immediately availalble. View the [Pricing page](https://www.twilio.com/en-us/pricing) for more details. |
  | `price_unit` | The currency in which `price` is measured, in [ISO 4127](https://www.iso.org/iso/home/standards/currency_codes.htm) format (e.g. `usd`, `eur`, `jpy`).. Format: currency |
  | `sid` | The unique, Twilio-provided string that identifies the Message resource. |
  | `status` | The status of the Message. Possible values: `accepted`, `scheduled`, `canceled`, `queued`, `sending`, `sent`, `failed`, `delivered`, `undelivered`, `receiving`, `received`, or `read` (WhatsApp only). For more information, See [detailed descriptions](https://www.twilio.com/docs/sms/api/message-resource#message-status-values).. Values: `queued`, `sending`, `sent`, `failed`, `delivered`, `undelivered`, `receiving`, `received`, `accepted`, `scheduled`, `read`, `partially_delivered`, `canceled` |
  | `subresource_uris` | A list of related resources identified by their URIs relative to `https://api.twilio.com`. Format: uri-map |
  | `to` | The recipient's phone number (in [E.164](https://en.wikipedia.org/wiki/E.164) format) or [channel address](https://www.twilio.com/docs/messaging/channels) (e.g. `whatsapp:+15552229999`). PII: standard |
  | `uri` | The URI of the Message resource, relative to `https://api.twilio.com`. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          api_version: String.t() | nil,
          body: String.t() | nil,
          date_created: String.t() | nil,
          date_sent: String.t() | nil,
          date_updated: String.t() | nil,
          direction: String.t(),
          error_code: integer() | nil,
          error_message: String.t() | nil,
          from: String.t() | nil,
          messaging_service_sid: String.t() | nil,
          num_media: String.t() | nil,
          num_segments: String.t() | nil,
          price: String.t() | nil,
          price_unit: String.t() | nil,
          sid: String.t() | nil,
          status: String.t(),
          subresource_uris: map() | nil,
          to: String.t() | nil,
          uri: String.t() | nil
        }

  defstruct [
    :account_sid,
    :api_version,
    :body,
    :date_created,
    :date_sent,
    :date_updated,
    :direction,
    :error_code,
    :error_message,
    :from,
    :messaging_service_sid,
    :num_media,
    :num_segments,
    :price,
    :price_unit,
    :sid,
    :status,
    :subresource_uris,
    :to,
    :uri
  ]

  @object_name "api.v2010.account.message"
  def object_name, do: @object_name

  @sid_prefix "SM|MM"
  def sid_prefix, do: @sid_prefix
end
