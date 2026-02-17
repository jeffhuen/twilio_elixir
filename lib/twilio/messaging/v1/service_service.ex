# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Messaging.V1.ServiceService do
  @moduledoc """
  A Messaging Service resource to create, fetch, update, delete or add/remove senders from Messaging Services.

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListService` | Tags: MessagingV1Service
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Services",
           params: params,
           opts: opts,
           base_url: "https://messaging.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "services")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(page.items, Twilio.Resources.Messaging.V1.Service)
         }}

      error ->
        error
    end
  end

  @doc "Stream:  (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "services"
    )
  end

  @doc """


  Operation: `CreateService` | Tags: MessagingV1Service

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `FriendlyName` | string | A descriptive string that you create to describe the resource. It can be up to 64 characters long. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `AreaCodeGeomatch` | boolean | Whether to enable [Area Code Geomatch](https://www.twilio.com/docs/messaging/services#area-code-geomatch) on the Service Instance. |
  | `FallbackMethod` | string (http-method) | The HTTP method we should use to call `fallback_url`. Can be: `GET` or `POST`. Values: `GET`, `POST` |
  | `FallbackToLongCode` | boolean | [OBSOLETE] Former feature used to fallback to long code sender after certain short code message failures. |
  | `FallbackUrl` | string (uri) | The URL that we call using `fallback_method` if an error occurs while retrieving or executing the TwiML from the Inbound Request URL. If the `use_inbound_webhook_on_number` field is enabled then the webhook url defined on the phone number will override the `fallback_url` defined for the Messaging Service. |
  | `InboundMethod` | string (http-method) | The HTTP method we should use to call `inbound_request_url`. Can be `GET` or `POST` and the default is `POST`. Values: `GET`, `POST` |
  | `InboundRequestUrl` | string (uri) | The URL we call using `inbound_method` when a message is received by any phone number or short code in the Service. When this property is `null`, receiving inbound messages is disabled. All messages sent to the Twilio phone number or short code will not be logged and received on the Account. If the `use_inbound_webhook_on_number` field is enabled then the webhook url defined on the phone number will override the `inbound_request_url` defined for the Messaging Service. |
  | `MmsConverter` | boolean | Whether to enable the [MMS Converter](https://www.twilio.com/docs/messaging/services#mms-converter) for messages sent through the Service instance. |
  | `ScanMessageContent` | string |  Values: `inherit`, `enable`, `disable` |
  | `SmartEncoding` | boolean | Whether to enable [Smart Encoding](https://www.twilio.com/docs/messaging/services#smart-encoding) for messages sent through the Service instance. |
  | `StatusCallback` | string (uri) | The URL we should call to [pass status updates](https://www.twilio.com/docs/sms/api/message-resource#message-status-values) about message delivery. |
  | `StickySender` | boolean | Whether to enable [Sticky Sender](https://www.twilio.com/docs/messaging/services#sticky-sender) on the Service instance. |
  | `SynchronousValidation` | boolean | Reserved. |
  | `UseInboundWebhookOnNumber` | boolean | A boolean value that indicates either the webhook url configured on the phone number will be used or `inbound_request_url`/`fallback_url` url will be called when a message is received from the phone number. If this field is enabled then the webhook url defined on the phone number will override the `inbound_request_url`/`fallback_url` defined for the Messaging Service. |
  | `Usecase` | string | A string that describes the scenario in which the Messaging Service will be used. Possible values are `notifications`, `marketing`, `verification`, `discussion`, `poll`, `undeclared`. |
  | `ValidityPeriod` | integer | How long, in seconds, messages sent from the Service are valid. Can be an integer from `1` to `36,000`. Default value is `36,000`. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Messaging.V1.Service.t()} | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Services",
             params: params,
             opts: opts,
             base_url: "https://messaging.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Messaging.V1.Service)}
    end
  end

  @doc """


  Operation: `FetchService` | Tags: MessagingV1Service
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Messaging.V1.Service.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Services/#{sid}",
             opts: opts,
             base_url: "https://messaging.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Messaging.V1.Service)}
    end
  end

  @doc """


  Operation: `UpdateService` | Tags: MessagingV1Service

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `AreaCodeGeomatch` | boolean | Whether to enable [Area Code Geomatch](https://www.twilio.com/docs/messaging/services#area-code-geomatch) on the Service Instance. |
  | `FallbackMethod` | string (http-method) | The HTTP method we should use to call `fallback_url`. Can be: `GET` or `POST`. Values: `GET`, `POST` |
  | `FallbackToLongCode` | boolean | [OBSOLETE] Former feature used to fallback to long code sender after certain short code message failures. |
  | `FallbackUrl` | string (uri) | The URL that we call using `fallback_method` if an error occurs while retrieving or executing the TwiML from the Inbound Request URL. If the `use_inbound_webhook_on_number` field is enabled then the webhook url defined on the phone number will override the `fallback_url` defined for the Messaging Service. |
  | `FriendlyName` | string | A descriptive string that you create to describe the resource. It can be up to 64 characters long. |
  | `InboundMethod` | string (http-method) | The HTTP method we should use to call `inbound_request_url`. Can be `GET` or `POST` and the default is `POST`. Values: `GET`, `POST` |
  | `InboundRequestUrl` | string (uri) | The URL we call using `inbound_method` when a message is received by any phone number or short code in the Service. When this property is `null`, receiving inbound messages is disabled. All messages sent to the Twilio phone number or short code will not be logged and received on the Account. If the `use_inbound_webhook_on_number` field is enabled then the webhook url defined on the phone number will override the `inbound_request_url` defined for the Messaging Service. |
  | `MmsConverter` | boolean | Whether to enable the [MMS Converter](https://www.twilio.com/docs/messaging/services#mms-converter) for messages sent through the Service instance. |
  | `ScanMessageContent` | string |  Values: `inherit`, `enable`, `disable` |
  | `SmartEncoding` | boolean | Whether to enable [Smart Encoding](https://www.twilio.com/docs/messaging/services#smart-encoding) for messages sent through the Service instance. |
  | `StatusCallback` | string (uri) | The URL we should call to [pass status updates](https://www.twilio.com/docs/sms/api/message-resource#message-status-values) about message delivery. |
  | `StickySender` | boolean | Whether to enable [Sticky Sender](https://www.twilio.com/docs/messaging/services#sticky-sender) on the Service instance. |
  | `SynchronousValidation` | boolean | Reserved. |
  | `UseInboundWebhookOnNumber` | boolean | A boolean value that indicates either the webhook url configured on the phone number will be used or `inbound_request_url`/`fallback_url` url will be called when a message is received from the phone number. If this field is enabled then the webhook url defined on the phone number will override the `inbound_request_url`/`fallback_url` defined for the Messaging Service. |
  | `Usecase` | string | A string that describes the scenario in which the Messaging Service will be used. Possible values are `notifications`, `marketing`, `verification`, `discussion`, `poll`, `undeclared`. |
  | `ValidityPeriod` | integer | How long, in seconds, messages sent from the Service are valid. Can be an integer from `1` to `36,000`. Default value is `36,000`. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Messaging.V1.Service.t()} | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Services/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://messaging.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Messaging.V1.Service)}
    end
  end

  @doc """


  Operation: `DeleteService` | Tags: MessagingV1Service
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Services/#{sid}",
      opts: opts,
      base_url: "https://messaging.twilio.com"
    )
  end
end
