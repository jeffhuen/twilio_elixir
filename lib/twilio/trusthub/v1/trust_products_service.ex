# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Trusthub.V1.TrustProductsService do
  @moduledoc """


  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all Trust Products for an account.

  Operation: `ListTrustProduct` | Tags: TrusthubV1TrustProducts

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Status` | string | The verification status of the Trust Product resource. |
  | `FriendlyName` | string | The string that you assigned to describe the resource. |
  | `PolicySid` | string | The unique string of a policy that is associated to the Trust Product resource. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/TrustProducts",
           params: params,
           opts: opts,
           base_url: "https://trusthub.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "results")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Trusthub.V1.TrustProducts
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all Trust Products for an account. (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "results"
    )
  end

  @doc """
  Create a new Trust Product.

  Operation: `CreateTrustProduct` | Tags: TrusthubV1TrustProducts

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Email` | string | The email address that will receive updates when the Trust Product resource changes status. |
  | `FriendlyName` | string | The string that you assigned to describe the resource. |
  | `PolicySid` | string | The unique string of a policy that is associated to the Trust Product resource. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `StatusCallback` | string (uri) | The URL we call to inform your application of status changes. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Trusthub.V1.TrustProducts.t()} | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/TrustProducts",
             params: params,
             opts: opts,
             base_url: "https://trusthub.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Trusthub.V1.TrustProducts)}
    end
  end

  @doc """
  Fetch a specific Trust Product instance.

  Operation: `FetchTrustProduct` | Tags: TrusthubV1TrustProducts
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Trusthub.V1.TrustProducts.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/TrustProducts/#{sid}",
             opts: opts,
             base_url: "https://trusthub.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Trusthub.V1.TrustProducts)}
    end
  end

  @doc """
  Updates a Trust Product in an account.

  Operation: `UpdateTrustProduct` | Tags: TrusthubV1TrustProducts

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Email` | string | The email address that will receive updates when the Trust Product resource changes status. |
  | `FriendlyName` | string | The string that you assigned to describe the resource. |
  | `Status` | string |  Values: `draft`, `pending-review`, `in-review`, `twilio-rejected`, `twilio-approved` |
  | `StatusCallback` | string (uri) | The URL we call to inform your application of status changes. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Trusthub.V1.TrustProducts.t()} | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/TrustProducts/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://trusthub.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Trusthub.V1.TrustProducts)}
    end
  end

  @doc """
  Delete a specific Trust Product.

  Operation: `DeleteTrustProduct` | Tags: TrusthubV1TrustProducts
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/TrustProducts/#{sid}",
      opts: opts,
      base_url: "https://trusthub.twilio.com"
    )
  end
end
