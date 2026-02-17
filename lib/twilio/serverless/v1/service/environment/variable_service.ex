# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Serverless.V1.Service.Environment.VariableService do
  @moduledoc """
  A key and value pair that is specific to an Environment.

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all Variables.

  Operation: `ListVariable` | Tags: ServerlessV1Variable
  """
  @spec list(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, service_sid, environment_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/v1/Services/#{service_sid}/Environments/#{environment_sid}/Variables",
           params: params,
           opts: opts,
           base_url: "https://serverless.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "variables")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Serverless.V1.Service.Environment.Variable
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all Variables. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, service_sid, environment_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, service_sid, environment_sid, Map.merge(params, page_opts), opts)
      end,
      "variables"
    )
  end

  @doc """
  Create a new Variable.

  Operation: `CreateVariable` | Tags: ServerlessV1Variable

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Key` | string | A string by which the Variable resource can be referenced. It can be a maximum of 128 characters. |
  | `Value` | string | A string that contains the actual value of the Variable. It can be a maximum of 450 bytes in size. |
  """
  @spec create(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Serverless.V1.Service.Environment.Variable.t()}
          | {:error, Twilio.Error.t()}
  def create(client, service_sid, environment_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/Services/#{service_sid}/Environments/#{environment_sid}/Variables",
             params: params,
             opts: opts,
             base_url: "https://serverless.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Serverless.V1.Service.Environment.Variable)}
    end
  end

  @doc """
  Retrieve a specific Variable.

  Operation: `FetchVariable` | Tags: ServerlessV1Variable
  """
  @spec fetch(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Serverless.V1.Service.Environment.Variable.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, service_sid, environment_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/Services/#{service_sid}/Environments/#{environment_sid}/Variables/#{sid}",
             opts: opts,
             base_url: "https://serverless.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Serverless.V1.Service.Environment.Variable)}
    end
  end

  @doc """
  Update a specific Variable.

  Operation: `UpdateVariable` | Tags: ServerlessV1Variable

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Key` | string | A string by which the Variable resource can be referenced. It can be a maximum of 128 characters. |
  | `Value` | string | A string that contains the actual value of the Variable. It can be a maximum of 450 bytes in size. |
  """
  @spec update(Client.t(), String.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Serverless.V1.Service.Environment.Variable.t()}
          | {:error, Twilio.Error.t()}
  def update(client, service_sid, environment_sid, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/Services/#{service_sid}/Environments/#{environment_sid}/Variables/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://serverless.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Serverless.V1.Service.Environment.Variable)}
    end
  end

  @doc """
  Delete a specific Variable.

  Operation: `DeleteVariable` | Tags: ServerlessV1Variable
  """
  @spec delete(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, service_sid, environment_sid, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v1/Services/#{service_sid}/Environments/#{environment_sid}/Variables/#{sid}",
      opts: opts,
      base_url: "https://serverless.twilio.com"
    )
  end
end
