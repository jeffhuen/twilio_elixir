# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Conversations.V1.CredentialService do
  @moduledoc """
  A Credential resource represents a push notification credential.

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all push notification credentials on your account

  Operation: `ListCredential` | Tags: ConversationsV1Credential
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Credentials",
           params: params,
           opts: opts,
           base_url: "https://conversations.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "credentials")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Conversations.V1.Credential
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all push notification credentials on your account (lazy auto-pagination)."
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
  Add a new push notification credential to your account

  Operation: `CreateCredential` | Tags: ConversationsV1Credential

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Type` | string |  Values: `apn`, `gcm`, `fcm` |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ApiKey` | string | [GCM only] The API key for the project that was obtained from the Google Developer console for your GCM Service application credential. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Certificate` | string | [APN only] The URL encoded representation of the certificate. For example,  `-----BEGIN CERTIFICATE----- MIIFnTCCBIWgAwIBAgIIAjy9H849+E8wDQYJKoZIhvcNAQEF.....A== -----END CERTIFICATE-----`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `FriendlyName` | string | A descriptive string that you create to describe the new resource. It can be up to 64 characters long. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `PrivateKey` | string | [APN only] The URL encoded representation of the private key. For example, `-----BEGIN RSA PRIVATE KEY----- MIIEpQIBAAKCAQEAuyf/lNrH9ck8DmNyo3fG... -----END RSA PRIVATE KEY-----`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Sandbox` | boolean | [APN only] Whether to send the credential to sandbox APNs. Can be `true` to send to sandbox APNs or `false` to send to production. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Secret` | string | [FCM only] The **Server key** of your project from the Firebase console, found under Settings / Cloud messaging. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Conversations.V1.Credential.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Credentials",
             params: params,
             opts: opts,
             base_url: "https://conversations.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Conversations.V1.Credential)}
    end
  end

  @doc """
  Fetch a push notification credential from your account

  Operation: `FetchCredential` | Tags: ConversationsV1Credential
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Conversations.V1.Credential.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Credentials/#{sid}",
             opts: opts,
             base_url: "https://conversations.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Conversations.V1.Credential)}
    end
  end

  @doc """
  Update an existing push notification credential on your account

  Operation: `UpdateCredential` | Tags: ConversationsV1Credential

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ApiKey` | string | [GCM only] The API key for the project that was obtained from the Google Developer console for your GCM Service application credential. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Certificate` | string | [APN only] The URL encoded representation of the certificate. For example,  `-----BEGIN CERTIFICATE----- MIIFnTCCBIWgAwIBAgIIAjy9H849+E8wDQYJKoZIhvcNAQEF.....A== -----END CERTIFICATE-----`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `FriendlyName` | string | A descriptive string that you create to describe the new resource. It can be up to 64 characters long. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `PrivateKey` | string | [APN only] The URL encoded representation of the private key. For example, `-----BEGIN RSA PRIVATE KEY----- MIIEpQIBAAKCAQEAuyf/lNrH9ck8DmNyo3fG... -----END RSA PRIVATE KEY-----`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Sandbox` | boolean | [APN only] Whether to send the credential to sandbox APNs. Can be `true` to send to sandbox APNs or `false` to send to production. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Secret` | string | [FCM only] The **Server key** of your project from the Firebase console, found under Settings / Cloud messaging. |
  | `Type` | string |  Values: `apn`, `gcm`, `fcm` |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Conversations.V1.Credential.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Credentials/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://conversations.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Conversations.V1.Credential)}
    end
  end

  @doc """
  Remove a push notification credential from your account

  Operation: `DeleteCredential` | Tags: ConversationsV1Credential
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Credentials/#{sid}",
      opts: opts,
      base_url: "https://conversations.twilio.com"
    )
  end
end
