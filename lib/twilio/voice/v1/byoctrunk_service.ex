# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Voice.V1.ByoctrunkService do
  @moduledoc """
  BYOC Trunks allow you to bring your own voice carrier to Twilio, enabling your calls to use our Programmable Voice APIs.

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListByocTrunk` | Tags: VoiceV1ByocTrunk
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/ByocTrunks",
           params: params,
           opts: opts,
           base_url: "https://voice.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "byoc_trunks")

        {:ok,
         %{
           page
           | items: Deserializer.deserialize_list(page.items, Twilio.Resources.Voice.V1.Byoctrunk)
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
      "byoc_trunks"
    )
  end

  @doc """


  Operation: `CreateByocTrunk` | Tags: VoiceV1ByocTrunk

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `CnamLookupEnabled` | boolean | Whether Caller ID Name (CNAM) lookup is enabled for the trunk. If enabled, all inbound calls to the BYOC Trunk from the United States and Canada automatically perform a CNAM Lookup and display Caller ID data on your phone. See [CNAM Lookups](https://www.twilio.com/docs/sip-trunking#CNAM) for more information. |
  | `ConnectionPolicySid` | string | The SID of the Connection Policy that Twilio will use when routing traffic to your communications infrastructure. |
  | `FriendlyName` | string | A descriptive string that you create to describe the resource. It is not unique and can be up to 255 characters long. |
  | `FromDomainSid` | string | The SID of the SIP Domain that should be used in the `From` header of originating calls sent to your SIP infrastructure. If your SIP infrastructure allows users to "call back" an incoming call, configure this with a [SIP Domain](https://www.twilio.com/docs/voice/api/sending-sip) to ensure proper routing. If not configured, the from domain will default to "sip.twilio.com". |
  | `StatusCallbackMethod` | string (http-method) | The HTTP method we should use to call `status_callback_url`. Can be: `GET` or `POST`. Values: `GET`, `POST` |
  | `StatusCallbackUrl` | string (uri) | The URL that we should call to pass status parameters (such as call ended) to your application. |
  | `VoiceFallbackMethod` | string (http-method) | The HTTP method we should use to call `voice_fallback_url`. Can be: `GET` or `POST`. Values: `GET`, `POST` |
  | `VoiceFallbackUrl` | string (uri) | The URL that we should call when an error occurs while retrieving or executing the TwiML from `voice_url`. |
  | `VoiceMethod` | string (http-method) | The HTTP method we should use to call `voice_url`. Can be: `GET` or `POST`. Values: `GET`, `POST` |
  | `VoiceUrl` | string (uri) | The URL we should call when the BYOC Trunk receives a call. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Voice.V1.Byoctrunk.t()} | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/ByocTrunks",
             params: params,
             opts: opts,
             base_url: "https://voice.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Voice.V1.Byoctrunk)}
    end
  end

  @doc """


  Operation: `FetchByocTrunk` | Tags: VoiceV1ByocTrunk
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Voice.V1.Byoctrunk.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/ByocTrunks/#{sid}",
             opts: opts,
             base_url: "https://voice.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Voice.V1.Byoctrunk)}
    end
  end

  @doc """


  Operation: `UpdateByocTrunk` | Tags: VoiceV1ByocTrunk

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `CnamLookupEnabled` | boolean | Whether Caller ID Name (CNAM) lookup is enabled for the trunk. If enabled, all inbound calls to the BYOC Trunk from the United States and Canada automatically perform a CNAM Lookup and display Caller ID data on your phone. See [CNAM Lookups](https://www.twilio.com/docs/sip-trunking#CNAM) for more information. |
  | `ConnectionPolicySid` | string | The SID of the Connection Policy that Twilio will use when routing traffic to your communications infrastructure. |
  | `FriendlyName` | string | A descriptive string that you create to describe the resource. It is not unique and can be up to 255 characters long. |
  | `FromDomainSid` | string | The SID of the SIP Domain that should be used in the `From` header of originating calls sent to your SIP infrastructure. If your SIP infrastructure allows users to "call back" an incoming call, configure this with a [SIP Domain](https://www.twilio.com/docs/voice/api/sending-sip) to ensure proper routing. If not configured, the from domain will default to "sip.twilio.com". |
  | `StatusCallbackMethod` | string (http-method) | The HTTP method we should use to call `status_callback_url`. Can be: `GET` or `POST`. Values: `GET`, `POST` |
  | `StatusCallbackUrl` | string (uri) | The URL that we should call to pass status parameters (such as call ended) to your application. |
  | `VoiceFallbackMethod` | string (http-method) | The HTTP method we should use to call `voice_fallback_url`. Can be: `GET` or `POST`. Values: `GET`, `POST` |
  | `VoiceFallbackUrl` | string (uri) | The URL that we should call when an error occurs while retrieving or executing the TwiML requested by `voice_url`. |
  | `VoiceMethod` | string (http-method) | The HTTP method we should use to call `voice_url` Values: `GET`, `POST` |
  | `VoiceUrl` | string (uri) | The URL we should call when the BYOC Trunk receives a call. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Voice.V1.Byoctrunk.t()} | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/ByocTrunks/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://voice.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Voice.V1.Byoctrunk)}
    end
  end

  @doc """


  Operation: `DeleteByocTrunk` | Tags: VoiceV1ByocTrunk
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/ByocTrunks/#{sid}",
      opts: opts,
      base_url: "https://voice.twilio.com"
    )
  end
end
