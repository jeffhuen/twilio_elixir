# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Api.V2010.Incomingphonenumber.MobileService do
  @moduledoc """
  Incoming mobile phone numbers on a Twilio account/project

  Operations: `list`, `create`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListIncomingPhoneNumberMobile` | Tags: Api20100401IncomingPhoneNumberMobile

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Beta` | boolean | Whether to include phone numbers new to the Twilio platform. Can be: `true` or `false` and the default is `true`. |
  | `FriendlyName` | string | A string that identifies the resources to read. |
  | `PhoneNumber` | string (phone-number) | The phone numbers of the IncomingPhoneNumber resources to read. You can specify partial numbers and use '*' as a wildcard for any digit. |
  | `Origin` | string | Whether to include phone numbers based on their origin. Can be: `twilio` or `hosted`. By default, phone numbers of all origin are included. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/2010-04-01/Accounts/#{client.account_sid}/IncomingPhoneNumbers/Mobile.json",
           params: params,
           opts: opts,
           base_url: "https://api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "incoming_phone_numbers")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Api.V2010.Incomingphonenumber.Mobile
               )
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
      "incoming_phone_numbers"
    )
  end

  @doc """


  Operation: `CreateIncomingPhoneNumberMobile` | Tags: Api20100401IncomingPhoneNumberMobile

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `PhoneNumber` | string (phone-number) | The phone number to purchase specified in [E.164](https://www.twilio.com/docs/glossary/what-e164) format.  E.164 phone numbers consist of a + followed by the country code and subscriber number without punctuation characters. For example, +14155551234. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `AddressSid` | string | The SID of the Address resource we should associate with the new phone number. Some regions require addresses to meet local regulations. |
  | `ApiVersion` | string | The API version to use for incoming calls made to the new phone number. The default is `2010-04-01`. |
  | `BundleSid` | string | The SID of the Bundle resource that you associate with the phone number. Some regions require a Bundle to meet local Regulations. |
  | `EmergencyAddressSid` | string | The SID of the emergency address configuration to use for emergency calling from the new phone number. |
  | `EmergencyStatus` | string |  Values: `Active`, `Inactive` |
  | `FriendlyName` | string | A descriptive string that you created to describe the new phone number. It can be up to 64 characters long. By default, the is a formatted version of the phone number. |
  | `IdentitySid` | string | The SID of the Identity resource that we should associate with the new phone number. Some regions require an identity to meet local regulations. |
  | `SmsApplicationSid` | string | The SID of the application that should handle SMS messages sent to the new phone number. If an `sms_application_sid` is present, we ignore all of the `sms_*_url` urls and use those of the application. |
  | `SmsFallbackMethod` | string (http-method) | The HTTP method that we should use to call `sms_fallback_url`. Can be: `GET` or `POST` and defaults to `POST`. Values: `GET`, `POST` |
  | `SmsFallbackUrl` | string (uri) | The URL that we should call when an error occurs while requesting or executing the TwiML defined by `sms_url`. |
  | `SmsMethod` | string (http-method) | The HTTP method that we should use to call `sms_url`. Can be: `GET` or `POST` and defaults to `POST`. Values: `GET`, `POST` |
  | `SmsUrl` | string (uri) | The URL we should call when the new phone number receives an incoming SMS message. |
  | `StatusCallback` | string (uri) | The URL we should call using the `status_callback_method` to send status information to your application. |
  | `StatusCallbackMethod` | string (http-method) | The HTTP method we should use to call `status_callback`. Can be: `GET` or `POST` and defaults to `POST`. Values: `GET`, `POST` |
  | `TrunkSid` | string | The SID of the Trunk we should use to handle calls to the new phone number. If a `trunk_sid` is present, we ignore all of the voice urls and voice applications and use only those set on the Trunk. Setting a `trunk_sid` will automatically delete your `voice_application_sid` and vice versa. |
  | `VoiceApplicationSid` | string | The SID of the application we should use to handle calls to the new phone number. If a `voice_application_sid` is present, we ignore all of the voice urls and use only those set on the application. Setting a `voice_application_sid` will automatically delete your `trunk_sid` and vice versa. |
  | `VoiceCallerIdLookup` | boolean | Whether to lookup the caller's name from the CNAM database and post it to your app. Can be: `true` or `false` and defaults to `false`. |
  | `VoiceFallbackMethod` | string (http-method) | The HTTP method that we should use to call `voice_fallback_url`. Can be: `GET` or `POST` and defaults to `POST`. Values: `GET`, `POST` |
  | `VoiceFallbackUrl` | string (uri) | The URL that we should call when an error occurs retrieving or executing the TwiML requested by `url`. |
  | `VoiceMethod` | string (http-method) | The HTTP method that we should use to call `voice_url`. Can be: `GET` or `POST` and defaults to `POST`. Values: `GET`, `POST` |
  | `VoiceReceiveMode` | string |  Values: `voice`, `fax` |
  | `VoiceUrl` | string (uri) | The URL that we should call to answer a call to the new phone number. The `voice_url` will not be called if a `voice_application_sid` or a `trunk_sid` is set. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Incomingphonenumber.Mobile.t()}
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/2010-04-01/Accounts/#{client.account_sid}/IncomingPhoneNumbers/Mobile.json",
             params: params,
             opts: opts,
             base_url: "https://api.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Incomingphonenumber.Mobile)}
    end
  end
end
