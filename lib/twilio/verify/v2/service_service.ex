# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Verify.V2.ServiceService do
  @moduledoc """


  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all Verification Services for an account.

  Operation: `ListService` | Tags: VerifyV2Service
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v2/Services",
           params: params,
           opts: opts,
           base_url: "https://verify.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "services")

        {:ok,
         %{
           page
           | items: Deserializer.deserialize_list(page.items, Twilio.Resources.Verify.V2.Service)
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all Verification Services for an account. (lazy auto-pagination)."
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
  Create a new Verification Service.

  Operation: `CreateService` | Tags: VerifyV2Service

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `FriendlyName` | string | A descriptive string that you create to describe the verification service. It can be up to 32 characters long. **This value should not contain PII.** |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `CodeLength` | integer | The length of the verification code to generate. Must be an integer value between 4 and 10, inclusive. |
  | `CustomCodeEnabled` | boolean | Whether to allow sending verifications with a custom code instead of a randomly generated one. |
  | `DefaultTemplateSid` | string | The default message [template](https://www.twilio.com/docs/verify/api/templates). Will be used for all SMS verifications unless explicitly overriden. SMS channel only. |
  | `DoNotShareWarningEnabled` | boolean | Whether to add a security warning at the end of an SMS verification body. Disabled by default and applies only to SMS. Example SMS body: `Your AppName verification code is: 1234. Don’t share this code with anyone; our employees will never ask for the code` |
  | `DtmfInputRequired` | boolean | Whether to ask the user to press a number before delivering the verify code in a phone call. |
  | `LookupEnabled` | boolean | Whether to perform a lookup with each verification started and return info about the phone number. |
  | `Passkeys.AuthenticatorAttachment` | string | The Authenticator Attachment for Passkeys. This is the type of authenticator that will be used to create Passkeys. It can be empty or it can have the values `platform`, `cross-platform` or `any`. |
  | `Passkeys.DiscoverableCredentials` | string | Indicates whether credentials must be discoverable by the authenticator. It can be empty or it can have the values `required`, `preferred` or `discouraged`. |
  | `Passkeys.RelyingParty.Id` | string | The Relying Party ID for Passkeys. This is the domain of your application, e.g. `example.com`. It is used to identify your application when creating Passkeys. |
  | `Passkeys.RelyingParty.Name` | string | The Relying Party Name for Passkeys. This is the name of your application, e.g. `Example App`. It is used to identify your application when creating Passkeys. |
  | `Passkeys.RelyingParty.Origins` | string | The Relying Party Origins for Passkeys. This is the origin of your application, e.g. `login.example.com,www.example.com`. It is used to identify your application when creating Passkeys, it can have multiple origins split by `,`. |
  | `Passkeys.UserVerification` | string | The User Verification for Passkeys. This is the type of user verification that will be used to create Passkeys. It can be empty or it can have the values `required`, `preferred` or `discouraged`. |
  | `Psd2Enabled` | boolean | Whether to pass PSD2 transaction parameters when starting a verification. |
  | `Push.ApnCredentialSid` | string | Optional configuration for the Push factors. Set the APN Credential for this service. This will allow to send push notifications to iOS devices. See [Credential Resource](https://www.twilio.com/docs/notify/api/credential-resource) |
  | `Push.FcmCredentialSid` | string | Optional configuration for the Push factors. Set the FCM Credential for this service. This will allow to send push notifications to Android devices. See [Credential Resource](https://www.twilio.com/docs/notify/api/credential-resource) |
  | `Push.IncludeDate` | boolean | Optional configuration for the Push factors. If true, include the date in the Challenge's response. Otherwise, the date is omitted from the response. See [Challenge](https://www.twilio.com/docs/verify/api/challenge) resource’s details parameter for more info. Default: false. **Deprecated** do not use this parameter. This timestamp value is the same one as the one found in `date_created`, please use that one instead. |
  | `SkipSmsToLandlines` | boolean | Whether to skip sending SMS verifications to landlines. Requires `lookup_enabled`. |
  | `Totp.CodeLength` | integer | Optional configuration for the TOTP factors. Number of digits for generated TOTP codes. Must be between 3 and 8, inclusive. Defaults to 6 |
  | `Totp.Issuer` | string | Optional configuration for the TOTP factors. Set TOTP Issuer for this service. This will allow to configure the issuer of the TOTP URI. Defaults to the service friendly name if not provided. |
  | `Totp.Skew` | integer | Optional configuration for the TOTP factors. The number of time-steps, past and future, that are valid for validation of TOTP codes. Must be between 0 and 2, inclusive. Defaults to 1 |
  | `Totp.TimeStep` | integer | Optional configuration for the TOTP factors. Defines how often, in seconds, are TOTP codes generated. i.e, a new TOTP code is generated every time_step seconds. Must be between 20 and 60 seconds, inclusive. Defaults to 30 seconds |
  | `TtsName` | string | The name of an alternative text-to-speech service to use in phone calls. Applies only to TTS languages. |
  | `VerifyEventSubscriptionEnabled` | boolean | Whether to allow verifications from the service to reach the stream-events sinks if configured |
  | `Whatsapp.From` | string | The number to use as the WhatsApp Sender that Verify will use to send WhatsApp messages to your users.This WhatsApp Sender must be associated with a Messaging Service SID. |
  | `Whatsapp.MsgServiceSid` | string | The SID of the Messaging Service containing WhatsApp Sender(s) that Verify will use to send WhatsApp messages to your users. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Verify.V2.Service.t()} | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/Services",
             params: params,
             opts: opts,
             base_url: "https://verify.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Verify.V2.Service)}
    end
  end

  @doc """
  Fetch specific Verification Service Instance.

  Operation: `FetchService` | Tags: VerifyV2Service
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Verify.V2.Service.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v2/Services/#{sid}",
             opts: opts,
             base_url: "https://verify.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Verify.V2.Service)}
    end
  end

  @doc """
  Update a specific Verification Service.

  Operation: `UpdateService` | Tags: VerifyV2Service

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `CodeLength` | integer | The length of the verification code to generate. Must be an integer value between 4 and 10, inclusive. |
  | `CustomCodeEnabled` | boolean | Whether to allow sending verifications with a custom code instead of a randomly generated one. |
  | `DefaultTemplateSid` | string | The default message [template](https://www.twilio.com/docs/verify/api/templates). Will be used for all SMS verifications unless explicitly overriden. SMS channel only. |
  | `DoNotShareWarningEnabled` | boolean | Whether to add a privacy warning at the end of an SMS. **Disabled by default and applies only for SMS.** |
  | `DtmfInputRequired` | boolean | Whether to ask the user to press a number before delivering the verify code in a phone call. |
  | `FriendlyName` | string | A descriptive string that you create to describe the verification service. It can be up to 32 characters long. **This value should not contain PII.** |
  | `LookupEnabled` | boolean | Whether to perform a lookup with each verification started and return info about the phone number. |
  | `Passkeys.AuthenticatorAttachment` | string | The Authenticator Attachment for Passkeys. This is the type of authenticator that will be used to create Passkeys. It can be empty or it can have the values `platform`, `cross-platform` or `any`. |
  | `Passkeys.DiscoverableCredentials` | string | Indicates whether credentials must be discoverable by the authenticator. It can be empty or it can have the values `required`, `preferred` or `discouraged`. |
  | `Passkeys.RelyingParty.Id` | string | The Relying Party ID for Passkeys. This is the domain of your application, e.g. `example.com`. It is used to identify your application when creating Passkeys. |
  | `Passkeys.RelyingParty.Name` | string | The Relying Party Name for Passkeys. This is the name of your application, e.g. `Example App`. It is used to identify your application when creating Passkeys. |
  | `Passkeys.RelyingParty.Origins` | string | The Relying Party Origins for Passkeys. This is the origin of your application, e.g. `login.example.com,www.example.com`. It is used to identify your application when creating Passkeys, it can have multiple origins split by `,`. |
  | `Passkeys.UserVerification` | string | The User Verification for Passkeys. This is the type of user verification that will be used to create Passkeys. It can be empty or it can have the values `required`, `preferred` or `discouraged`. |
  | `Psd2Enabled` | boolean | Whether to pass PSD2 transaction parameters when starting a verification. |
  | `Push.ApnCredentialSid` | string | Optional configuration for the Push factors. Set the APN Credential for this service. This will allow to send push notifications to iOS devices. See [Credential Resource](https://www.twilio.com/docs/notify/api/credential-resource) |
  | `Push.FcmCredentialSid` | string | Optional configuration for the Push factors. Set the FCM Credential for this service. This will allow to send push notifications to Android devices. See [Credential Resource](https://www.twilio.com/docs/notify/api/credential-resource) |
  | `Push.IncludeDate` | boolean | Optional configuration for the Push factors. If true, include the date in the Challenge's response. Otherwise, the date is omitted from the response. See [Challenge](https://www.twilio.com/docs/verify/api/challenge) resource’s details parameter for more info. Default: false. **Deprecated** do not use this parameter. |
  | `SkipSmsToLandlines` | boolean | Whether to skip sending SMS verifications to landlines. Requires `lookup_enabled`. |
  | `Totp.CodeLength` | integer | Optional configuration for the TOTP factors. Number of digits for generated TOTP codes. Must be between 3 and 8, inclusive. Defaults to 6 |
  | `Totp.Issuer` | string | Optional configuration for the TOTP factors. Set TOTP Issuer for this service. This will allow to configure the issuer of the TOTP URI. |
  | `Totp.Skew` | integer | Optional configuration for the TOTP factors. The number of time-steps, past and future, that are valid for validation of TOTP codes. Must be between 0 and 2, inclusive. Defaults to 1 |
  | `Totp.TimeStep` | integer | Optional configuration for the TOTP factors. Defines how often, in seconds, are TOTP codes generated. i.e, a new TOTP code is generated every time_step seconds. Must be between 20 and 60 seconds, inclusive. Defaults to 30 seconds |
  | `TtsName` | string | The name of an alternative text-to-speech service to use in phone calls. Applies only to TTS languages. |
  | `VerifyEventSubscriptionEnabled` | boolean | Whether to allow verifications from the service to reach the stream-events sinks if configured |
  | `Whatsapp.From` | string | The WhatsApp number to use as the sender of the verification messages. This number must be associated with the WhatsApp Message Service. |
  | `Whatsapp.MsgServiceSid` | string | The SID of the [Messaging Service](https://www.twilio.com/docs/messaging/services) to associate with the Verification Service. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Verify.V2.Service.t()} | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/Services/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://verify.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Verify.V2.Service)}
    end
  end

  @doc """
  Delete a specific Verification Service Instance.

  Operation: `DeleteService` | Tags: VerifyV2Service
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v2/Services/#{sid}",
      opts: opts,
      base_url: "https://verify.twilio.com"
    )
  end
end
