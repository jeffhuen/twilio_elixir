# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Notify.V1.Service.BindingService do
  @moduledoc """
  Service for Binding API operations.

  Operations: `list`, `create`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListBinding` | Tags: NotifyV1Binding

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `StartDate` | string (date) | Only include usage that has occurred on or after this date. Specify the date in GMT and format as `YYYY-MM-DD`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `EndDate` | string (date) | Only include usage that occurred on or before this date. Specify the date in GMT and format as `YYYY-MM-DD`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Identity` | array | The [User](https://www.twilio.com/docs/chat/rest/user-resource)'s `identity` value of the resources to read. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Tag` | array | Only list Bindings that have all of the specified Tags. The following implicit tags are available: `all`, `apn`, `fcm`, `gcm`, `sms`, `facebook-messenger`. Up to 5 tags are allowed. |
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, service_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Services/#{service_sid}/Bindings",
           params: params,
           opts: opts,
           base_url: "https://notify.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "bindings")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Notify.V1.Service.Binding
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream:  (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, service_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, service_sid, Map.merge(params, page_opts), opts)
      end,
      "bindings"
    )
  end

  @doc """


  Operation: `CreateBinding` | Tags: NotifyV1Binding

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Address` | string | The channel-specific address. For APNS, the device token. For FCM and GCM, the registration token. For SMS, a phone number in E.164 format. For Facebook Messenger, the Messenger ID of the user or a phone number in E.164 format. |
  | `BindingType` | string |  Values: `apn`, `gcm`, `sms`, `fcm`, `facebook-messenger`, `alexa` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Identity` | string | The `identity` value that uniquely identifies the new resource's [User](https://www.twilio.com/docs/chat/rest/user-resource) within the [Service](https://www.twilio.com/docs/notify/api/service-resource). Up to 20 Bindings can be created for the same Identity in a given Service. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `CredentialSid` | string | The SID of the [Credential](https://www.twilio.com/docs/notify/api/credential-resource) resource to be used to send notifications to this Binding. If present, this overrides the Credential specified in the Service resource. Applies to only `apn`, `fcm`, and `gcm` type Bindings. |
  | `Endpoint` | string | Deprecated. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `NotificationProtocolVersion` | string | The protocol version to use to send the notification. This defaults to the value of `default_xxxx_notification_protocol_version` for the protocol in the [Service](https://www.twilio.com/docs/notify/api/service-resource). The current version is `"3"` for `apn`, `fcm`, and `gcm` type Bindings. The parameter is not applicable to `sms` and `facebook-messenger` type Bindings as the data format is fixed. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Tag` | array | A tag that can be used to select the Bindings to notify. Repeat this parameter to specify more than one tag, up to a total of 20 tags. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Notify.V1.Service.Binding.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, service_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Services/#{service_sid}/Bindings",
             params: params,
             opts: opts,
             base_url: "https://notify.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Notify.V1.Service.Binding)}
    end
  end

  @doc """


  Operation: `FetchBinding` | Tags: NotifyV1Binding
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Notify.V1.Service.Binding.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, service_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Services/#{service_sid}/Bindings/#{sid}",
             opts: opts,
             base_url: "https://notify.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Notify.V1.Service.Binding)}
    end
  end

  @doc """


  Operation: `DeleteBinding` | Tags: NotifyV1Binding
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, service_sid, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Services/#{service_sid}/Bindings/#{sid}",
      opts: opts,
      base_url: "https://notify.twilio.com"
    )
  end
end
