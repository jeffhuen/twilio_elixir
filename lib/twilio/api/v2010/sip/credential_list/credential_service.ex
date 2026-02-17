# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Api.V2010.SIP.CredentialList.CredentialService do
  @moduledoc """
  Username and password information for SIP Domains

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of credentials.

  Operation: `ListSipCredential` | Tags: Api20100401Credential
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, credential_list_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/2010-04-01/Accounts/#{client.account_sid}/SIP/CredentialLists/#{credential_list_sid}/Credentials.json",
           params: params,
           opts: opts,
           base_url: "https://api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "credentials")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Api.V2010.SIP.CredentialList.Credential
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of credentials. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, credential_list_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, credential_list_sid, Map.merge(params, page_opts), opts)
      end,
      "credentials"
    )
  end

  @doc """
  Create a new credential resource.

  Operation: `CreateSipCredential` | Tags: Api20100401Credential

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Password` | string | The password that the username will use when authenticating SIP requests. The password must be a minimum of 12 characters, contain at least 1 digit, and have mixed case. (eg `IWasAtSignal2018`) |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Username` | string | The username that will be passed when authenticating SIP requests. The username should be sent in response to Twilio's challenge of the initial INVITE. It can be up to 32 characters long. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.SIP.CredentialList.Credential.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, credential_list_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/2010-04-01/Accounts/#{client.account_sid}/SIP/CredentialLists/#{credential_list_sid}/Credentials.json",
             params: params,
             opts: opts,
             base_url: "https://api.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Api.V2010.SIP.CredentialList.Credential)}
    end
  end

  @doc """
  Fetch a single credential.

  Operation: `FetchSipCredential` | Tags: Api20100401Credential
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.SIP.CredentialList.Credential.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, credential_list_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
             "/2010-04-01/Accounts/#{client.account_sid}/SIP/CredentialLists/#{credential_list_sid}/Credentials/#{sid}.json",
             opts: opts,
             base_url: "https://api.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Api.V2010.SIP.CredentialList.Credential)}
    end
  end

  @doc """
  Update a credential resource.

  Operation: `UpdateSipCredential` | Tags: Api20100401Credential

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Password` | string | The password that the username will use when authenticating SIP requests. The password must be a minimum of 12 characters, contain at least 1 digit, and have mixed case. (eg `IWasAtSignal2018`) |
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.SIP.CredentialList.Credential.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, credential_list_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
             "/2010-04-01/Accounts/#{client.account_sid}/SIP/CredentialLists/#{credential_list_sid}/Credentials/#{sid}.json",
             params: params,
             opts: opts,
             base_url: "https://api.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Api.V2010.SIP.CredentialList.Credential)}
    end
  end

  @doc """
  Delete a credential resource.

  Operation: `DeleteSipCredential` | Tags: Api20100401Credential
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, credential_list_sid, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/2010-04-01/Accounts/#{client.account_sid}/SIP/CredentialLists/#{credential_list_sid}/Credentials/#{sid}.json",
      opts: opts,
      base_url: "https://api.twilio.com"
    )
  end
end
