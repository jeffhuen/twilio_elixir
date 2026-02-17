# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Serverless.V1.Service.Environment.DeploymentService do
  @moduledoc """
  An association of a Build with an Environment so that the Build is published in the Environment.

  Operations: `list`, `create`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all Deployments.

  Operation: `ListDeployment` | Tags: ServerlessV1Deployment
  """
  @spec list(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, service_sid, environment_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/v1/Services/#{service_sid}/Environments/#{environment_sid}/Deployments",
           params: params,
           opts: opts,
           base_url: "https://serverless.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "deployments")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Serverless.V1.Service.Environment.Deployment
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all Deployments. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, service_sid, environment_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, service_sid, environment_sid, Map.merge(params, page_opts), opts)
      end,
      "deployments"
    )
  end

  @doc """
  Create a new Deployment.

  Operation: `CreateDeployment` | Tags: ServerlessV1Deployment

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `BuildSid` | string | The SID of the Build for the Deployment. |
  | `IsPlugin` | boolean | Whether the Deployment is a plugin. |
  """
  @spec create(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Serverless.V1.Service.Environment.Deployment.t()}
          | {:error, Twilio.Error.t()}
  def create(client, service_sid, environment_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/Services/#{service_sid}/Environments/#{environment_sid}/Deployments",
             params: params,
             opts: opts,
             base_url: "https://serverless.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Serverless.V1.Service.Environment.Deployment
       )}
    end
  end

  @doc """
  Retrieve a specific Deployment.

  Operation: `FetchDeployment` | Tags: ServerlessV1Deployment
  """
  @spec fetch(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Serverless.V1.Service.Environment.Deployment.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, service_sid, environment_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/Services/#{service_sid}/Environments/#{environment_sid}/Deployments/#{sid}",
             opts: opts,
             base_url: "https://serverless.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Serverless.V1.Service.Environment.Deployment
       )}
    end
  end
end
