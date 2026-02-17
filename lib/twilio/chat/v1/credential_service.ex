# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Chat.V1.CredentialService do
  @moduledoc """
  Credentials for push notifications channels

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListCredential` | Tags: ChatV1Credential
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Credentials",
           params: params,
           opts: opts,
           base_url: "https://chat.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "credentials")

        {:ok,
         %{
           page
           | items: Deserializer.deserialize_list(page.items, Twilio.Resources.Chat.V1.Credential)
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
      "credentials"
    )
  end

  @doc """


  Operation: `CreateCredential` | Tags: ChatV1Credential

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Type` | string |  Values: `gcm`, `apn`, `fcm` |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `ApiKey` | string | [GCM only] The API key for the project that was obtained from the Google Developer console for your GCM Service application credential. |
  | `Certificate` | string | [APN only] The URL encoded representation of the certificate. For example,  `-----BEGIN CERTIFICATE----- MIIFnTCCBIWgAwIBAgIIAjy9H849+E8wDQYJKoZIhvcNAQEFBQAwgZYxCzAJBgNV.....A== -----END CERTIFICATE-----` |
  | `FriendlyName` | string | A descriptive string that you create to describe the new resource. It can be up to 64 characters long. |
  | `PrivateKey` | string | [APN only] The URL encoded representation of the private key. For example, `-----BEGIN RSA PRIVATE KEY----- MIIEpQIBAAKCAQEAuyf/lNrH9ck8DmNyo3fGgvCI1l9s+cmBY3WIz+cUDqmxiieR. -----END RSA PRIVATE KEY-----` |
  | `Sandbox` | boolean | [APN only] Whether to send the credential to sandbox APNs. Can be `true` to send to sandbox APNs or `false` to send to production. |
  | `Secret` | string | [FCM only] The **Server key** of your project from the Firebase console, found under Settings / Cloud messaging. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Chat.V1.Credential.t()} | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Credentials",
             params: params,
             opts: opts,
             base_url: "https://chat.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Chat.V1.Credential)}
    end
  end

  @doc """


  Operation: `FetchCredential` | Tags: ChatV1Credential
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Chat.V1.Credential.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Credentials/#{sid}",
             opts: opts,
             base_url: "https://chat.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Chat.V1.Credential)}
    end
  end

  @doc """


  Operation: `UpdateCredential` | Tags: ChatV1Credential

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `ApiKey` | string | [GCM only] The API key for the project that was obtained from the Google Developer console for your GCM Service application credential. |
  | `Certificate` | string | [APN only] The URL encoded representation of the certificate. For example,  `-----BEGIN CERTIFICATE----- MIIFnTCCBIWgAwIBAgIIAjy9H849+E8wDQYJKoZIhvcNAQEFBQAwgZYxCzAJBgNV.....A== -----END CERTIFICATE-----` |
  | `FriendlyName` | string | A descriptive string that you create to describe the resource. It can be up to 64 characters long. |
  | `PrivateKey` | string | [APN only] The URL encoded representation of the private key. For example, `-----BEGIN RSA PRIVATE KEY----- MIIEpQIBAAKCAQEAuyf/lNrH9ck8DmNyo3fGgvCI1l9s+cmBY3WIz+cUDqmxiieR. -----END RSA PRIVATE KEY-----` |
  | `Sandbox` | boolean | [APN only] Whether to send the credential to sandbox APNs. Can be `true` to send to sandbox APNs or `false` to send to production. |
  | `Secret` | string | [FCM only] The **Server key** of your project from the Firebase console, found under Settings / Cloud messaging. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Chat.V1.Credential.t()} | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Credentials/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://chat.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Chat.V1.Credential)}
    end
  end

  @doc """


  Operation: `DeleteCredential` | Tags: ChatV1Credential
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Credentials/#{sid}",
      opts: opts,
      base_url: "https://chat.twilio.com"
    )
  end
end
