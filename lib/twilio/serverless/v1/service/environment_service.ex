# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Serverless.V1.Service.EnvironmentService do
  @moduledoc """
  Represents a deployed build of a given set of Functions and/or Assets at a specific URL.

  Operations: `list`, `create`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all environments.

  Operation: `ListEnvironment` | Tags: ServerlessV1Environment
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, service_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Services/#{service_sid}/Environments",
           params: params,
           opts: opts,
           base_url: "https://serverless.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "environments")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Serverless.V1.Service.Environment
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all environments. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, service_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, service_sid, Map.merge(params, page_opts), opts)
      end,
      "environments"
    )
  end

  @doc """
  Create a new environment.

  Operation: `CreateEnvironment` | Tags: ServerlessV1Environment

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `UniqueName` | string | A user-defined string that uniquely identifies the Environment resource. It can be a maximum of 100 characters. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `DomainSuffix` | string | A URL-friendly name that represents the environment and forms part of the domain name. It can be a maximum of 16 characters. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Serverless.V1.Service.Environment.t()}
          | {:error, Twilio.Error.t()}
  def create(client, service_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Services/#{service_sid}/Environments",
             params: params,
             opts: opts,
             base_url: "https://serverless.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Serverless.V1.Service.Environment)}
    end
  end

  @doc """
  Retrieve a specific environment.

  Operation: `FetchEnvironment` | Tags: ServerlessV1Environment
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Serverless.V1.Service.Environment.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, service_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Services/#{service_sid}/Environments/#{sid}",
             opts: opts,
             base_url: "https://serverless.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Serverless.V1.Service.Environment)}
    end
  end

  @doc """
  Delete a specific environment.

  Operation: `DeleteEnvironment` | Tags: ServerlessV1Environment
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, service_sid, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Services/#{service_sid}/Environments/#{sid}",
      opts: opts,
      base_url: "https://serverless.twilio.com"
    )
  end
end
