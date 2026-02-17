# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.IpMessaging.V2.CredentialService do
  @moduledoc """


  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListCredential` | Tags: IpMessagingV2Credential
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v2/Credentials",
           params: params,
           opts: opts,
           base_url: "https://ip-messaging.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "credentials")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.IpMessaging.V2.Credential
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
      "credentials"
    )
  end

  @doc """


  Operation: `CreateCredential` | Tags: IpMessagingV2Credential

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Type` | string |  Values: `gcm`, `apn`, `fcm` |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `ApiKey` | string |  |
  | `Certificate` | string |  |
  | `FriendlyName` | string |  |
  | `PrivateKey` | string |  |
  | `Sandbox` | boolean |  |
  | `Secret` | string |  |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.IpMessaging.V2.Credential.t()} | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/Credentials",
             params: params,
             opts: opts,
             base_url: "https://ip-messaging.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.IpMessaging.V2.Credential)}
    end
  end

  @doc """


  Operation: `FetchCredential` | Tags: IpMessagingV2Credential
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.IpMessaging.V2.Credential.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v2/Credentials/#{sid}",
             opts: opts,
             base_url: "https://ip-messaging.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.IpMessaging.V2.Credential)}
    end
  end

  @doc """


  Operation: `UpdateCredential` | Tags: IpMessagingV2Credential

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `ApiKey` | string |  |
  | `Certificate` | string |  |
  | `FriendlyName` | string |  |
  | `PrivateKey` | string |  |
  | `Sandbox` | boolean |  |
  | `Secret` | string |  |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.IpMessaging.V2.Credential.t()} | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/Credentials/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://ip-messaging.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.IpMessaging.V2.Credential)}
    end
  end

  @doc """


  Operation: `DeleteCredential` | Tags: IpMessagingV2Credential
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v2/Credentials/#{sid}",
      opts: opts,
      base_url: "https://ip-messaging.twilio.com"
    )
  end
end
