# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Notify.V1.ServiceService do
  @moduledoc """


  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListService` | Tags: NotifyV1Service

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `FriendlyName` | string | The string that identifies the Service resources to read. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Services",
           params: params,
           opts: opts,
           base_url: "https://notify.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "services")

        {:ok,
         %{
           page
           | items: Deserializer.deserialize_list(page.items, Twilio.Resources.Notify.V1.Service)
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


  Operation: `CreateService` | Tags: NotifyV1Service

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `AlexaSkillId` | string | Deprecated. |
  | `ApnCredentialSid` | string | The SID of the [Credential](https://www.twilio.com/docs/notify/api/credential-resource) to use for APN Bindings. |
  | `DefaultAlexaNotificationProtocolVersion` | string | Deprecated. |
  | `DefaultApnNotificationProtocolVersion` | string | The protocol version to use for sending APNS notifications. Can be overridden on a Binding by Binding basis when creating a [Binding](https://www.twilio.com/docs/notify/api/binding-resource) resource. |
  | `DefaultFcmNotificationProtocolVersion` | string | The protocol version to use for sending FCM notifications. Can be overridden on a Binding by Binding basis when creating a [Binding](https://www.twilio.com/docs/notify/api/binding-resource) resource. |
  | `DefaultGcmNotificationProtocolVersion` | string | The protocol version to use for sending GCM notifications. Can be overridden on a Binding by Binding basis when creating a [Binding](https://www.twilio.com/docs/notify/api/binding-resource) resource. |
  | `DeliveryCallbackEnabled` | boolean | Callback configuration that enables delivery callbacks, default false |
  | `DeliveryCallbackUrl` | string | URL to send delivery status callback. |
  | `FacebookMessengerPageId` | string | Deprecated. |
  | `FcmCredentialSid` | string | The SID of the [Credential](https://www.twilio.com/docs/notify/api/credential-resource) to use for FCM Bindings. |
  | `FriendlyName` | string | A descriptive string that you create to describe the resource. It can be up to 64 characters long. |
  | `GcmCredentialSid` | string | The SID of the [Credential](https://www.twilio.com/docs/notify/api/credential-resource) to use for GCM Bindings. |
  | `LogEnabled` | boolean | Whether to log notifications. Can be: `true` or `false` and the default is `true`. |
  | `MessagingServiceSid` | string | The SID of the [Messaging Service](https://www.twilio.com/docs/sms/quickstart#messaging-services) to use for SMS Bindings. This parameter must be set in order to send SMS notifications. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Notify.V1.Service.t()} | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Services",
             params: params,
             opts: opts,
             base_url: "https://notify.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Notify.V1.Service)}
    end
  end

  @doc """


  Operation: `FetchService` | Tags: NotifyV1Service
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Notify.V1.Service.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Services/#{sid}",
             opts: opts,
             base_url: "https://notify.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Notify.V1.Service)}
    end
  end

  @doc """


  Operation: `UpdateService` | Tags: NotifyV1Service

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `AlexaSkillId` | string | Deprecated. |
  | `ApnCredentialSid` | string | The SID of the [Credential](https://www.twilio.com/docs/notify/api/credential-resource) to use for APN Bindings. |
  | `DefaultAlexaNotificationProtocolVersion` | string | Deprecated. |
  | `DefaultApnNotificationProtocolVersion` | string | The protocol version to use for sending APNS notifications. Can be overridden on a Binding by Binding basis when creating a [Binding](https://www.twilio.com/docs/notify/api/binding-resource) resource. |
  | `DefaultFcmNotificationProtocolVersion` | string | The protocol version to use for sending FCM notifications. Can be overridden on a Binding by Binding basis when creating a [Binding](https://www.twilio.com/docs/notify/api/binding-resource) resource. |
  | `DefaultGcmNotificationProtocolVersion` | string | The protocol version to use for sending GCM notifications. Can be overridden on a Binding by Binding basis when creating a [Binding](https://www.twilio.com/docs/notify/api/binding-resource) resource. |
  | `DeliveryCallbackEnabled` | boolean | Callback configuration that enables delivery callbacks, default false |
  | `DeliveryCallbackUrl` | string | URL to send delivery status callback. |
  | `FacebookMessengerPageId` | string | Deprecated. |
  | `FcmCredentialSid` | string | The SID of the [Credential](https://www.twilio.com/docs/notify/api/credential-resource) to use for FCM Bindings. |
  | `FriendlyName` | string | A descriptive string that you create to describe the resource. It can be up to 64 characters long. |
  | `GcmCredentialSid` | string | The SID of the [Credential](https://www.twilio.com/docs/notify/api/credential-resource) to use for GCM Bindings. |
  | `LogEnabled` | boolean | Whether to log notifications. Can be: `true` or `false` and the default is `true`. |
  | `MessagingServiceSid` | string | The SID of the [Messaging Service](https://www.twilio.com/docs/sms/quickstart#messaging-services) to use for SMS Bindings. This parameter must be set in order to send SMS notifications. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Notify.V1.Service.t()} | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Services/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://notify.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Notify.V1.Service)}
    end
  end

  @doc """


  Operation: `DeleteService` | Tags: NotifyV1Service
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Services/#{sid}",
      opts: opts,
      base_url: "https://notify.twilio.com"
    )
  end
end
