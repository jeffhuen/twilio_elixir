# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Serverless.V1.Service.FunctionService do
  @moduledoc """
  A wrapper that represents a Serverless JavaScript function and groups the different  and groups the different Versions of this code.

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all Functions.

  Operation: `ListFunction` | Tags: ServerlessV1Function
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, service_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Services/#{service_sid}/Functions",
           params: params,
           opts: opts,
           base_url: "https://serverless.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "functions")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Serverless.V1.Service.Function
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all Functions. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, service_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, service_sid, Map.merge(params, page_opts), opts)
      end,
      "functions"
    )
  end

  @doc """
  Create a new Function resource.

  Operation: `CreateFunction` | Tags: ServerlessV1Function

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `FriendlyName` | string | A descriptive string that you create to describe the Function resource. It can be a maximum of 255 characters. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Serverless.V1.Service.Function.t()} | {:error, Twilio.Error.t()}
  def create(client, service_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Services/#{service_sid}/Functions",
             params: params,
             opts: opts,
             base_url: "https://serverless.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Serverless.V1.Service.Function)}
    end
  end

  @doc """
  Retrieve a specific Function resource.

  Operation: `FetchFunction` | Tags: ServerlessV1Function
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Serverless.V1.Service.Function.t()} | {:error, Twilio.Error.t()}
  def fetch(client, service_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Services/#{service_sid}/Functions/#{sid}",
             opts: opts,
             base_url: "https://serverless.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Serverless.V1.Service.Function)}
    end
  end

  @doc """
  Update a specific Function resource.

  Operation: `UpdateFunction` | Tags: ServerlessV1Function

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `FriendlyName` | string | A descriptive string that you create to describe the Function resource. It can be a maximum of 255 characters. |
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Serverless.V1.Service.Function.t()} | {:error, Twilio.Error.t()}
  def update(client, service_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Services/#{service_sid}/Functions/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://serverless.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Serverless.V1.Service.Function)}
    end
  end

  @doc """
  Delete a Function resource.

  Operation: `DeleteFunction` | Tags: ServerlessV1Function
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, service_sid, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Services/#{service_sid}/Functions/#{sid}",
      opts: opts,
      base_url: "https://serverless.twilio.com"
    )
  end
end
