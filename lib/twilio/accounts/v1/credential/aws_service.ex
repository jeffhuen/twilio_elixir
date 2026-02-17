# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Accounts.V1.Credential.AwsService do
  @moduledoc """
  User provided AWS keys

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieves a collection of AWS Credentials belonging to the account used to make the request

  Operation: `ListCredentialAws` | Tags: AccountsV1Aws
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Credentials/AWS",
           params: params,
           opts: opts,
           base_url: "https://accounts.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "credentials")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Accounts.V1.Credential.Aws
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieves a collection of AWS Credentials belonging to the account used to make the request (lazy auto-pagination)."
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
  Create a new AWS Credential

  Operation: `CreateCredentialAws` | Tags: AccountsV1Aws

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Credentials` | string | A string that contains the AWS access credentials in the format `<AWS_ACCESS_KEY_ID>:<AWS_SECRET_ACCESS_KEY>`. For example, `AKIAIOSFODNN7EXAMPLE:wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY` |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `AccountSid` | string | The SID of the Subaccount that this Credential should be associated with. Must be a valid Subaccount of the account issuing the request. |
  | `FriendlyName` | string | A descriptive string that you create to describe the resource. It can be up to 64 characters long. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Accounts.V1.Credential.Aws.t()} | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Credentials/AWS",
             params: params,
             opts: opts,
             base_url: "https://accounts.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Accounts.V1.Credential.Aws)}
    end
  end

  @doc """
  Fetch the AWS credentials specified by the provided Credential Sid

  Operation: `FetchCredentialAws` | Tags: AccountsV1Aws
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Accounts.V1.Credential.Aws.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Credentials/AWS/#{sid}",
             opts: opts,
             base_url: "https://accounts.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Accounts.V1.Credential.Aws)}
    end
  end

  @doc """
  Modify the properties of a given Account

  Operation: `UpdateCredentialAws` | Tags: AccountsV1Aws

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `FriendlyName` | string | A descriptive string that you create to describe the resource. It can be up to 64 characters long. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Accounts.V1.Credential.Aws.t()} | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Credentials/AWS/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://accounts.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Accounts.V1.Credential.Aws)}
    end
  end

  @doc """
  Delete a Credential from your account

  Operation: `DeleteCredentialAws` | Tags: AccountsV1Aws
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Credentials/AWS/#{sid}",
      opts: opts,
      base_url: "https://accounts.twilio.com"
    )
  end
end
