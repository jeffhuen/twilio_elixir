# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Iam.V1.GetApiKeysService do
  @moduledoc """
  API keys

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all Keys for a account.

  Operation: `ListGetKeys` | Tags: IamV1GetApiKeys

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `AccountSid` | string | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Payments resource. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Keys",
           params: params,
           opts: opts,
           base_url: "https://iam.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "keys")

        {:ok,
         %{
           page
           | items: Deserializer.deserialize_list(page.items, Twilio.Resources.Iam.V1.GetApiKeys)
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all Keys for a account. (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "keys"
    )
  end

  @doc """
  Create a new Signing Key for the account making the request.

  Operation: `CreateNewKey` | Tags: IamV1NewApiKey

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `AccountSid` | string | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Payments resource. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `FriendlyName` | string | A descriptive string that you create to describe the resource. It can be up to 64 characters long. |
  | `KeyType` | string | The \`KeyType\` form parameter is used to specify the type of key you want to create.  **Default Behavior**: If \`KeyType\` is not specified, the API will generate a standard key.  **Restricted Key**: If \`KeyType\` is set to \`restricted\`, the API will create a new restricted key. In this case, a policy object is required to define the permissions. Values: `restricted` |
  | `Policy` | string | The \`Policy\` object is a collection that specifies the allowed Twilio permissions for the restricted key. For more information on the permissions available with restricted API keys, refer to the [Twilio documentation](https://www.twilio.com/docs/iam/api-keys/restricted-api-keys#permissions-available-with-restricted-api-keys). |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Iam.V1.GetApiKeys.t()} | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Keys",
             params: params,
             opts: opts,
             base_url: "https://iam.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Iam.V1.GetApiKeys)}
    end
  end

  @doc """
  Fetch a specific Key.

  Operation: `FetchKey` | Tags: IamV1ApiKey
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Iam.V1.GetApiKeys.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Keys/#{sid}",
             opts: opts,
             base_url: "https://iam.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Iam.V1.GetApiKeys)}
    end
  end

  @doc """
  Update a specific Key.

  Operation: `UpdateKey` | Tags: IamV1ApiKey

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `FriendlyName` | string | A descriptive string that you create to describe the resource. It can be up to 64 characters long. |
  | `Policy` | string | The \`Policy\` object is a collection that specifies the allowed Twilio permissions for the restricted key. For more information on the permissions available with restricted API keys, refer to the [Twilio documentation](https://www.twilio.com/docs/iam/api-keys/restricted-api-keys#permissions-available-with-restricted-api-keys). |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Iam.V1.GetApiKeys.t()} | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Keys/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://iam.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Iam.V1.GetApiKeys)}
    end
  end

  @doc """
  Delete a specific Key.

  Operation: `DeleteKey` | Tags: IamV1ApiKey
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Keys/#{sid}",
      opts: opts,
      base_url: "https://iam.twilio.com"
    )
  end
end
