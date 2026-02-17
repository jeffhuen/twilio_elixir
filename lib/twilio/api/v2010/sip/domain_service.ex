# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Api.V2010.Sip.DomainService do
  @moduledoc """
  Custom DNS hostnames that can accept SIP traffic

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of domains belonging to the account used to make the request

  Operation: `ListSipDomain` | Tags: Api20100401Domain
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/2010-04-01/Accounts/#{client.account_sid}/SIP/Domains.json",
           params: params,
           opts: opts,
           base_url: "https://api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "domains")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(page.items, Twilio.Resources.Api.V2010.Sip.Domain)
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of domains belonging to the account used to make the request (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "domains"
    )
  end

  @doc """
  Create a new Domain

  Operation: `CreateSipDomain` | Tags: Api20100401Domain

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `DomainName` | string | The unique address you reserve on Twilio to which you route your SIP traffic. Domain names can contain letters, digits, and "-" and must end with `sip.twilio.com`. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ByocTrunkSid` | string | The SID of the BYOC Trunk(Bring Your Own Carrier) resource that the Sip Domain will be associated with. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `EmergencyCallerSid` | string | Whether an emergency caller sid is configured for the domain. If present, this phone number will be used as the callback for the emergency call. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `EmergencyCallingEnabled` | boolean | Whether emergency calling is enabled for the domain. If enabled, allows emergency calls on the domain from phone numbers with validated addresses. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `FriendlyName` | string | A descriptive string that you created to describe the resource. It can be up to 64 characters long. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Secure` | boolean | Whether secure SIP is enabled for the domain. If enabled, TLS will be enforced and SRTP will be negotiated on all incoming calls to this sip domain. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `SipRegistration` | boolean | Whether to allow SIP Endpoints to register with the domain to receive calls. Can be `true` or `false`. `true` allows SIP Endpoints to register with the domain to receive calls, `false` does not. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `VoiceFallbackMethod` | string (http-method) | The HTTP method we should use to call `voice_fallback_url`. Can be: `GET` or `POST`. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `VoiceFallbackUrl` | string (uri) | The URL that we should call when an error occurs while retrieving or executing the TwiML from `voice_url`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `VoiceMethod` | string (http-method) | The HTTP method we should use to call `voice_url`. Can be: `GET` or `POST`. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `VoiceStatusCallbackMethod` | string (http-method) | The HTTP method we should use to call `voice_status_callback_url`. Can be: `GET` or `POST`. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `VoiceStatusCallbackUrl` | string (uri) | The URL that we should call to pass status parameters (such as call ended) to your application. |
  | `VoiceUrl` | string (uri) | The URL we should when the domain receives a call. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Sip.Domain.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/2010-04-01/Accounts/#{client.account_sid}/SIP/Domains.json",
             params: params,
             opts: opts,
             base_url: "https://api.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Sip.Domain)}
    end
  end

  @doc """
  Fetch an instance of a Domain

  Operation: `FetchSipDomain` | Tags: Api20100401Domain
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Sip.Domain.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/2010-04-01/Accounts/#{client.account_sid}/SIP/Domains/#{sid}.json",
             opts: opts,
             base_url: "https://api.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Sip.Domain)}
    end
  end

  @doc """
  Update the attributes of a domain

  Operation: `UpdateSipDomain` | Tags: Api20100401Domain

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ByocTrunkSid` | string | The SID of the BYOC Trunk(Bring Your Own Carrier) resource that the Sip Domain will be associated with. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `DomainName` | string | The unique address you reserve on Twilio to which you route your SIP traffic. Domain names can contain letters, digits, and "-" and must end with `sip.twilio.com`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `EmergencyCallerSid` | string | Whether an emergency caller sid is configured for the domain. If present, this phone number will be used as the callback for the emergency call. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `EmergencyCallingEnabled` | boolean | Whether emergency calling is enabled for the domain. If enabled, allows emergency calls on the domain from phone numbers with validated addresses. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `FriendlyName` | string | A descriptive string that you created to describe the resource. It can be up to 64 characters long. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Secure` | boolean | Whether secure SIP is enabled for the domain. If enabled, TLS will be enforced and SRTP will be negotiated on all incoming calls to this sip domain. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `SipRegistration` | boolean | Whether to allow SIP Endpoints to register with the domain to receive calls. Can be `true` or `false`. `true` allows SIP Endpoints to register with the domain to receive calls, `false` does not. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `VoiceFallbackMethod` | string (http-method) | The HTTP method we should use to call `voice_fallback_url`. Can be: `GET` or `POST`. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `VoiceFallbackUrl` | string (uri) | The URL that we should call when an error occurs while retrieving or executing the TwiML requested by `voice_url`. |
  | `VoiceMethod` | string (http-method) | The HTTP method we should use to call `voice_url` Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `VoiceStatusCallbackMethod` | string (http-method) | The HTTP method we should use to call `voice_status_callback_url`. Can be: `GET` or `POST`. Values: `GET`, `POST` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `VoiceStatusCallbackUrl` | string (uri) | The URL that we should call to pass status parameters (such as call ended) to your application. |
  | `VoiceUrl` | string (uri) | The URL we should call when the domain receives a call. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Sip.Domain.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/2010-04-01/Accounts/#{client.account_sid}/SIP/Domains/#{sid}.json",
             params: params,
             opts: opts,
             base_url: "https://api.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Sip.Domain)}
    end
  end

  @doc """
  Delete an instance of a Domain

  Operation: `DeleteSipDomain` | Tags: Api20100401Domain
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/2010-04-01/Accounts/#{client.account_sid}/SIP/Domains/#{sid}.json",
      opts: opts,
      base_url: "https://api.twilio.com"
    )
  end
end
