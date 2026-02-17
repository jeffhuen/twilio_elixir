# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Serverless.V1.ServiceService do
  @moduledoc """
  The top-level resource for a Serverless application, which serves as a container for the application environments.

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all Services.

  Operation: `ListService` | Tags: ServerlessV1Service
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Services",
           params: params,
           opts: opts,
           base_url: "https://serverless.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "services")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(page.items, Twilio.Resources.Serverless.V1.Service)
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all Services. (lazy auto-pagination)."
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
  Create a new Service resource.

  Operation: `CreateService` | Tags: ServerlessV1Service

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `FriendlyName` | string | A descriptive string that you create to describe the Service resource. It can be a maximum of 255 characters. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `UniqueName` | string | A user-defined string that uniquely identifies the Service resource. It can be used as an alternative to the `sid` in the URL path to address the Service resource. This value must be 50 characters or less in length and be unique. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `IncludeCredentials` | boolean | Whether to inject Account credentials into a function invocation context. The default value is `true`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `UiEditable` | boolean | Whether the Service's properties and subresources can be edited via the UI. The default value is `false`. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Serverless.V1.Service.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Services",
             params: params,
             opts: opts,
             base_url: "https://serverless.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Serverless.V1.Service)}
    end
  end

  @doc """
  Retrieve a specific Service resource.

  Operation: `FetchService` | Tags: ServerlessV1Service
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Serverless.V1.Service.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Services/#{sid}",
             opts: opts,
             base_url: "https://serverless.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Serverless.V1.Service)}
    end
  end

  @doc """
  Update a specific Service resource.

  Operation: `UpdateService` | Tags: ServerlessV1Service

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `FriendlyName` | string | A descriptive string that you create to describe the Service resource. It can be a maximum of 255 characters. |
  | `IncludeCredentials` | boolean | Whether to inject Account credentials into a function invocation context. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `UiEditable` | boolean | Whether the Service resource's properties and subresources can be edited via the UI. The default value is `false`. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Serverless.V1.Service.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Services/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://serverless.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Serverless.V1.Service)}
    end
  end

  @doc """
  Delete a Service resource.

  Operation: `DeleteService` | Tags: ServerlessV1Service
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Services/#{sid}",
      opts: opts,
      base_url: "https://serverless.twilio.com"
    )
  end
end
