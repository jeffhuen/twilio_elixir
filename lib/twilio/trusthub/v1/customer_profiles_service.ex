# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Trusthub.V1.CustomerProfilesService do
  @moduledoc """
  Service for CustomerProfiles API operations.

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all Customer-Profiles for an account.

  Operation: `ListCustomerProfile` | Tags: TrusthubV1CustomerProfiles

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Status` | string | The verification status of the Customer-Profile resource. |
  | `FriendlyName` | string | The string that you assigned to describe the resource. |
  | `PolicySid` | string | The unique string of a policy that is associated to the Customer-Profile resource. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/CustomerProfiles",
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
                 Twilio.Resources.Trusthub.V1.CustomerProfiles
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all Customer-Profiles for an account. (lazy auto-pagination)."
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
  Create a new Customer-Profile.

  Operation: `CreateCustomerProfile` | Tags: TrusthubV1CustomerProfiles

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Email` | string | The email address that will receive updates when the Customer-Profile resource changes status. |
  | `FriendlyName` | string | The string that you assigned to describe the resource. |
  | `PolicySid` | string | The unique string of a policy that is associated to the Customer-Profile resource. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `StatusCallback` | string (uri) | The URL we call to inform your application of status changes. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Trusthub.V1.CustomerProfiles.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/CustomerProfiles",
             params: params,
             opts: opts,
             base_url: "https://trusthub.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Trusthub.V1.CustomerProfiles)}
    end
  end

  @doc """
  Fetch a specific Customer-Profile instance.

  Operation: `FetchCustomerProfile` | Tags: TrusthubV1CustomerProfiles
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Trusthub.V1.CustomerProfiles.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/CustomerProfiles/#{sid}",
             opts: opts,
             base_url: "https://trusthub.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Trusthub.V1.CustomerProfiles)}
    end
  end

  @doc """
  Updates a Customer-Profile in an account.

  Operation: `UpdateCustomerProfile` | Tags: TrusthubV1CustomerProfiles

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Email` | string | The email address that will receive updates when the Customer-Profile resource changes status. |
  | `FriendlyName` | string | The string that you assigned to describe the resource. |
  | `Status` | string |  Values: `draft`, `pending-review`, `in-review`, `twilio-rejected`, `twilio-approved` |
  | `StatusCallback` | string (uri) | The URL we call to inform your application of status changes. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Trusthub.V1.CustomerProfiles.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/CustomerProfiles/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://trusthub.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Trusthub.V1.CustomerProfiles)}
    end
  end

  @doc """
  Delete a specific Customer-Profile.

  Operation: `DeleteCustomerProfile` | Tags: TrusthubV1CustomerProfiles
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/CustomerProfiles/#{sid}",
      opts: opts,
      base_url: "https://trusthub.twilio.com"
    )
  end
end
