# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Api.V2010.ConnectappService do
  @moduledoc """
  Twilio Connect apps

  Operations: `list`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of connect-apps belonging to the account used to make the request

  Operation: `ListConnectApp` | Tags: Api20100401ConnectApp
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/2010-04-01/Accounts/#{client.account_sid}/ConnectApps.json",
           params: params,
           opts: opts,
           base_url: "https://api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "connect_apps")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(page.items, Twilio.Resources.Api.V2010.Connectapp)
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of connect-apps belonging to the account used to make the request (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "connect_apps"
    )
  end

  @doc """
  Fetch an instance of a connect-app

  Operation: `FetchConnectApp` | Tags: Api20100401ConnectApp
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Connectapp.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/2010-04-01/Accounts/#{client.account_sid}/ConnectApps/#{sid}.json",
             opts: opts,
             base_url: "https://api.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Connectapp)}
    end
  end

  @doc """
  Update a connect-app with the specified parameters

  Operation: `UpdateConnectApp` | Tags: Api20100401ConnectApp

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `AuthorizeRedirectUrl` | string (uri) | The URL to redirect the user to after we authenticate the user and obtain authorization to access the Connect App. |
  | `CompanyName` | string | The company name to set for the Connect App. |
  | `DeauthorizeCallbackMethod` | string (http-method) | The HTTP method to use when calling `deauthorize_callback_url`. Values: `GET`, `POST` |
  | `DeauthorizeCallbackUrl` | string (uri) | The URL to call using the `deauthorize_callback_method` to de-authorize the Connect App. |
  | `Description` | string | A description of the Connect App. |
  | `FriendlyName` | string | A descriptive string that you create to describe the resource. It can be up to 64 characters long. |
  | `HomepageUrl` | string (uri) | A public URL where users can obtain more information about this Connect App. |
  | `Permissions` | array | A comma-separated list of the permissions you will request from the users of this ConnectApp.  Can include: `get-all` and `post-all`. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Api.V2010.Connectapp.t()} | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/2010-04-01/Accounts/#{client.account_sid}/ConnectApps/#{sid}.json",
             params: params,
             opts: opts,
             base_url: "https://api.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Connectapp)}
    end
  end

  @doc """
  Delete an instance of a connect-app

  Operation: `DeleteConnectApp` | Tags: Api20100401ConnectApp
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/2010-04-01/Accounts/#{client.account_sid}/ConnectApps/#{sid}.json",
      opts: opts,
      base_url: "https://api.twilio.com"
    )
  end
end
