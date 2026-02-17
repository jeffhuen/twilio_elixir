# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Verify.V2.Service.VerificationService do
  @moduledoc """


  Operations: `create`, `fetch`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Create a new Verification using a Service

  Operation: `CreateVerification` | Tags: VerifyV2Verification

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Channel` | string | The verification method to use. One of: [`email`](https://www.twilio.com/docs/verify/email), `sms`, `whatsapp`, `call`, `sna` or `auto`. |
  | `To` | string | The phone number or [email](https://www.twilio.com/docs/verify/email) to verify. Phone numbers must be in [E.164 format](https://www.twilio.com/docs/glossary/what-e164). |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Amount` | string | The amount of the associated PSD2 compliant transaction. Requires the PSD2 Service flag enabled. |
  | `AppHash` | string | Your [App Hash](https://developers.google.com/identity/sms-retriever/verify#computing_your_apps_hash_string) to be appended at the end of your verification SMS body. Applies only to SMS. Example SMS body: `<#> Your AppName verification code is: 1234 He42w354ol9`. |
  | `ChannelConfiguration` | string | [`email`](https://www.twilio.com/docs/verify/email) channel configuration in json format. The fields 'from' and 'from_name' are optional but if included the 'from' field must have a valid email address. |
  | `CustomCode` | string | A pre-generated code to use for verification. The code can be between 4 and 10 characters, inclusive. |
  | `CustomFriendlyName` | string | A custom user defined friendly name that overwrites the existing one in the verification message |
  | `CustomMessage` | string | The text of a custom message to use for the verification. |
  | `DeviceIp` | string | Strongly encouraged if using the auto channel. The IP address of the client's device. If provided, it has to be a valid IPv4 or IPv6 address. |
  | `EnableSnaClientToken` | boolean | An optional Boolean value to indicate the requirement of sna client token in the SNA URL invocation response for added security. This token must match in the Verification Check request to confirm phone number verification. |
  | `Locale` | string | Locale will automatically resolve based on phone number country code for SMS, WhatsApp, and call channel verifications. It will fallback to English or the template’s default translation if the selected translation is not available. This parameter will override the automatic locale resolution. [See supported languages and more information here](https://www.twilio.com/docs/verify/supported-languages). |
  | `Payee` | string | The payee of the associated PSD2 compliant transaction. Requires the PSD2 Service flag enabled. |
  | `RateLimits` | string | The custom key-value pairs of Programmable Rate Limits. Keys correspond to `unique_name` fields defined when [creating your Rate Limit](https://www.twilio.com/docs/verify/api/service-rate-limits). Associated value pairs represent values in the request that you are rate limiting on. You may include multiple Rate Limit values in each request. |
  | `RiskCheck` | string |  Values: `enable`, `disable` |
  | `SendDigits` | string | The digits to send after a phone call is answered, for example, to dial an extension. For more information, see the Programmable Voice documentation of [sendDigits](https://www.twilio.com/docs/voice/twiml/number#attributes-sendDigits). |
  | `Tags` | string | A string containing a JSON map of key value pairs of tags to be recorded as metadata for the message. The object may contain up to 10 tags. Keys and values can each be up to 128 characters in length. |
  | `TemplateCustomSubstitutions` | string | A stringified JSON object in which the keys are the template's special variables and the values are the variables substitutions. |
  | `TemplateSid` | string | The message [template](https://www.twilio.com/docs/verify/api/templates). If provided, will override the default template for the Service. SMS and Voice channels only. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Verify.V2.Service.Verification.t()} | {:error, Twilio.Error.t()}
  def create(client, service_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/Services/#{service_sid}/Verifications",
             params: params,
             opts: opts,
             base_url: "https://verify.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Verify.V2.Service.Verification)}
    end
  end

  @doc """
  Fetch a specific Verification

  Operation: `FetchVerification` | Tags: VerifyV2Verification
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Verify.V2.Service.Verification.t()} | {:error, Twilio.Error.t()}
  def fetch(client, service_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v2/Services/#{service_sid}/Verifications/#{sid}",
             opts: opts,
             base_url: "https://verify.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Verify.V2.Service.Verification)}
    end
  end

  @doc """
  Update a Verification status

  Operation: `UpdateVerification` | Tags: VerifyV2Verification

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Status` | string |  Values: `canceled`, `approved` |
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Verify.V2.Service.Verification.t()} | {:error, Twilio.Error.t()}
  def update(client, service_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/Services/#{service_sid}/Verifications/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://verify.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Verify.V2.Service.Verification)}
    end
  end
end
