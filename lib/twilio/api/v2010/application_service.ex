# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Api.V2010.ApplicationService do
  @moduledoc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  An Application instance resource represents an application that you have created with Twilio. An application inside of Twilio is just a set of URLs and other configuration data that tells Twilio how to behave when one of your Twilio numbers receives a call or SMS message.

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of applications representing an application within the requesting account

  Operation: `ListApplication` | Tags: Api20100401Application

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `FriendlyName` | string | The string that identifies the Application resources to read. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/2010-04-01/Accounts/#{client.account_sid}/Applications.json",
           params: params,
           opts: opts,
           base_url: "https://api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "applications")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(page.items, Twilio.Resources.Api.V2010.Application)
         }}

      error ->
        error
    end
  end

  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  @doc "Stream: Retrieve a list of applications representing an application within the requesting account (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "applications"
    )
  end

  @doc """
  Create a new application within your account

  Operation: `CreateApplication` | Tags: Api20100401Application

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ApiVersion` | string | The API version to use to start a new TwiML session. Can be: `2010-04-01` or `2008-08-01`. The default value is the account's default API version. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `FriendlyName` | string | A descriptive string that you create to describe the new application. It can be up to 64 characters long. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `MessageStatusCallback` | string (uri) | The URL we should call using a POST method to send message status information to your application. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `PublicApplicationConnectEnabled` | boolean | Whether to allow other Twilio accounts to dial this applicaton using Dial verb. Can be: `true` or `false`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `SmsFallbackMethod` | string (http-method) | The HTTP method we should use to call `sms_fallback_url`. Can be: `GET` or `POST`. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `SmsFallbackUrl` | string (uri) | The URL that we should call when an error occurs while retrieving or executing the TwiML from `sms_url`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `SmsMethod` | string (http-method) | The HTTP method we should use to call `sms_url`. Can be: `GET` or `POST`. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `SmsStatusCallback` | string (uri) | The URL we should call using a POST method to send status information about SMS messages sent by the application. |
  | `SmsUrl` | string (uri) | The URL we should call when the phone number receives an incoming SMS message. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `StatusCallback` | string (uri) | The URL we should call using the `status_callback_method` to send status information to your application. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `StatusCallbackMethod` | string (http-method) | The HTTP method we should use to call `status_callback`. Can be: `GET` or `POST`. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `VoiceCallerIdLookup` | boolean | Whether we should look up the caller's caller-ID name from the CNAM database (additional charges apply). Can be: `true` or `false`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `VoiceFallbackMethod` | string (http-method) | The HTTP method we should use to call `voice_fallback_url`. Can be: `GET` or `POST`. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `VoiceFallbackUrl` | string (uri) | The URL that we should call when an error occurs retrieving or executing the TwiML requested by `url`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `VoiceMethod` | string (http-method) | The HTTP method we should use to call `voice_url`. Can be: `GET` or `POST`. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `VoiceUrl` | string (uri) | The URL we should call when the phone number assigned to this application receives a call. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Application.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/2010-04-01/Accounts/#{client.account_sid}/Applications.json",
             params: params,
             opts: opts,
             base_url: "https://api.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Application)}
    end
  end

  @doc """
  Fetch the application specified by the provided sid

  Operation: `FetchApplication` | Tags: Api20100401Application
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Application.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/2010-04-01/Accounts/#{client.account_sid}/Applications/#{sid}.json",
             opts: opts,
             base_url: "https://api.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Application)}
    end
  end

  @doc """
  Updates the application's properties

  Operation: `UpdateApplication` | Tags: Api20100401Application

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ApiVersion` | string | The API version to use to start a new TwiML session. Can be: `2010-04-01` or `2008-08-01`. The default value is your account's default API version. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `FriendlyName` | string | A descriptive string that you create to describe the resource. It can be up to 64 characters long. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `MessageStatusCallback` | string (uri) | The URL we should call using a POST method to send message status information to your application. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `PublicApplicationConnectEnabled` | boolean | Whether to allow other Twilio accounts to dial this applicaton using Dial verb. Can be: `true` or `false`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `SmsFallbackMethod` | string (http-method) | The HTTP method we should use to call `sms_fallback_url`. Can be: `GET` or `POST`. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `SmsFallbackUrl` | string (uri) | The URL that we should call when an error occurs while retrieving or executing the TwiML from `sms_url`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `SmsMethod` | string (http-method) | The HTTP method we should use to call `sms_url`. Can be: `GET` or `POST`. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `SmsStatusCallback` | string (uri) | Same as message_status_callback: The URL we should call using a POST method to send status information about SMS messages sent by the application. Deprecated, included for backwards compatibility. |
  | `SmsUrl` | string (uri) | The URL we should call when the phone number receives an incoming SMS message. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `StatusCallback` | string (uri) | The URL we should call using the `status_callback_method` to send status information to your application. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `StatusCallbackMethod` | string (http-method) | The HTTP method we should use to call `status_callback`. Can be: `GET` or `POST`. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `VoiceCallerIdLookup` | boolean | Whether we should look up the caller's caller-ID name from the CNAM database (additional charges apply). Can be: `true` or `false`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `VoiceFallbackMethod` | string (http-method) | The HTTP method we should use to call `voice_fallback_url`. Can be: `GET` or `POST`. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `VoiceFallbackUrl` | string (uri) | The URL that we should call when an error occurs retrieving or executing the TwiML requested by `url`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `VoiceMethod` | string (http-method) | The HTTP method we should use to call `voice_url`. Can be: `GET` or `POST`. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `VoiceUrl` | string (uri) | The URL we should call when the phone number assigned to this application receives a call. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Application.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/2010-04-01/Accounts/#{client.account_sid}/Applications/#{sid}.json",
             params: params,
             opts: opts,
             base_url: "https://api.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Application)}
    end
  end

  @doc """
  Delete the application by the specified application sid

  Operation: `DeleteApplication` | Tags: Api20100401Application
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/2010-04-01/Accounts/#{client.account_sid}/Applications/#{sid}.json",
      opts: opts,
      base_url: "https://api.twilio.com"
    )
  end
end
