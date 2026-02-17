# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Serverless.V1.Service.BuildService do
  @moduledoc """
  A collection of Function Versions, Asset Versions, Dependencies, and a Runtime that form a deployable unit.

  Operations: `list`, `create`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all Builds.

  Operation: `ListBuild` | Tags: ServerlessV1Build
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, service_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Services/#{service_sid}/Builds",
           params: params,
           opts: opts,
           base_url: "https://serverless.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "builds")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Serverless.V1.Service.Build
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all Builds. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, service_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, service_sid, Map.merge(params, page_opts), opts)
      end,
      "builds"
    )
  end

  @doc """
  Create a new Build resource. At least one function version or asset version is required.

  Operation: `CreateBuild` | Tags: ServerlessV1Build

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `AssetVersions` | array | The list of Asset Version resource SIDs to include in the Build. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Dependencies` | string | A list of objects that describe the Dependencies included in the Build. Each object contains the `name` and `version` of the dependency. |
  | `FunctionVersions` | array | The list of the Function Version resource SIDs to include in the Build. |
  | `Runtime` | string | The Runtime version that will be used to run the Build resource when it is deployed. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Serverless.V1.Service.Build.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, service_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Services/#{service_sid}/Builds",
             params: params,
             opts: opts,
             base_url: "https://serverless.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Serverless.V1.Service.Build)}
    end
  end

  @doc """
  Retrieve a specific Build resource.

  Operation: `FetchBuild` | Tags: ServerlessV1Build
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Serverless.V1.Service.Build.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, service_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Services/#{service_sid}/Builds/#{sid}",
             opts: opts,
             base_url: "https://serverless.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Serverless.V1.Service.Build)}
    end
  end

  @doc """
  Delete a Build resource.

  Operation: `DeleteBuild` | Tags: ServerlessV1Build
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, service_sid, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Services/#{service_sid}/Builds/#{sid}",
      opts: opts,
      base_url: "https://serverless.twilio.com"
    )
  end
end
