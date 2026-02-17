# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Intelligence.V2.ServiceService do
  @moduledoc """


  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieves a list of all Services for an account.

  Operation: `ListService` | Tags: IntelligenceV2Service
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v2/Services",
           params: params,
           opts: opts,
           base_url: "https://intelligence.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "services")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(page.items, Twilio.Resources.Intelligence.V2.Service)
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieves a list of all Services for an account. (lazy auto-pagination)."
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
  Create a new Service for the given Account

  Operation: `CreateService` | Tags: IntelligenceV2Service

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `UniqueName` | string | Provides a unique and addressable name to be assigned to this Service, assigned by the developer, to be optionally used in addition to SID. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `AutoRedaction` | boolean | Instructs the Speech Recognition service to automatically redact PII from all transcripts made on this service. |
  | `AutoTranscribe` | boolean | Instructs the Speech Recognition service to automatically transcribe all recordings made on the account. |
  | `DataLogging` | boolean | Data logging allows Twilio to improve the quality of the speech recognition & language understanding services through using customer data to refine, fine tune and evaluate machine learning models. Note: Data logging cannot be activated via API, only via www.twilio.com, as it requires additional consent. |
  | `EncryptionCredentialSid` | string | The unique SID identifier of the Public Key resource used to encrypt the sentences and operator results. |
  | `FriendlyName` | string | A human readable description of this resource, up to 64 characters. |
  | `LanguageCode` | string | The language code set during Service creation determines the Transcription language for all call recordings processed by that Service. The default is en-US if no language code is set. A Service can only support one language code, and it cannot be updated once it's set. |
  | `MediaRedaction` | boolean | Instructs the Speech Recognition service to automatically redact PII from all transcripts media made on this service. The auto_redaction flag must be enabled, results in error otherwise. |
  | `WebhookHttpMethod` | string |  Values: `GET`, `POST`, `NULL` |
  | `WebhookUrl` | string | The URL Twilio will request when executing the Webhook. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Intelligence.V2.Service.t()} | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/Services",
             params: params,
             opts: opts,
             base_url: "https://intelligence.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Intelligence.V2.Service)}
    end
  end

  @doc """
  Fetch a specific Service.

  Operation: `FetchService` | Tags: IntelligenceV2Service
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Intelligence.V2.Service.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v2/Services/#{sid}",
             opts: opts,
             base_url: "https://intelligence.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Intelligence.V2.Service)}
    end
  end

  @doc """
  Update a specific Service.

  Operation: `UpdateService` | Tags: IntelligenceV2Service

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `AutoRedaction` | boolean | Instructs the Speech Recognition service to automatically redact PII from all transcripts made on this service. |
  | `AutoTranscribe` | boolean | Instructs the Speech Recognition service to automatically transcribe all recordings made on the account. |
  | `DataLogging` | boolean | Data logging allows Twilio to improve the quality of the speech recognition & language understanding services through using customer data to refine, fine tune and evaluate machine learning models. Note: Data logging cannot be activated via API, only via www.twilio.com, as it requires additional consent. |
  | `EncryptionCredentialSid` | string | The unique SID identifier of the Public Key resource used to encrypt the sentences and operator results. |
  | `FriendlyName` | string | A human readable description of this resource, up to 64 characters. |
  | `MediaRedaction` | boolean | Instructs the Speech Recognition service to automatically redact PII from all transcripts media made on this service. The auto_redaction flag must be enabled, results in error otherwise. |
  | `UniqueName` | string | Provides a unique and addressable name to be assigned to this Service, assigned by the developer, to be optionally used in addition to SID. |
  | `WebhookHttpMethod` | string |  Values: `GET`, `POST`, `NULL` |
  | `WebhookUrl` | string | The URL Twilio will request when executing the Webhook. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Intelligence.V2.Service.t()} | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/Services/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://intelligence.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Intelligence.V2.Service)}
    end
  end

  @doc """
  Delete a specific Service.

  Operation: `DeleteService` | Tags: IntelligenceV2Service
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v2/Services/#{sid}",
      opts: opts,
      base_url: "https://intelligence.twilio.com"
    )
  end
end
