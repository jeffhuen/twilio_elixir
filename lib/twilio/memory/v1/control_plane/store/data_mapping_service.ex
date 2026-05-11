# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Memory.V1.ControlPlane.Store.DataMappingService do
  @moduledoc """
  Service for DataMapping API operations.

  Operations: `list`, `create`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Get a list of data mappings configured for this Memory Store.

  Operation: `ListDataMappings` | Tags: DataMapping

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `type` | string | Filter data mappings by type. |
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, store_id, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/ControlPlane/Stores/#{store_id}/DataMappings",
           params: params,
           opts: opts,
           base_url: "https://memory.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "datamappings")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Memory.V1.ControlPlane.Store.DataMapping
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Get a list of data mappings configured for this Memory Store. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, store_id, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, store_id, Map.merge(params, page_opts), opts)
      end,
      "datamappings"
    )
  end

  @doc """
  Create a new data mapping to connect an external data source to this Memory Store.
  For DATASET types, validates that all mapped Trait Groups and traits exist
  and that dataset field data types match their respective mapped trait data types.

  Operation: `CreateDataMapping` | Tags: DataMapping
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Memory.V1.ControlPlane.Store.DataMapping.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, store_id, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/ControlPlane/Stores/#{store_id}/DataMappings",
             params: params,
             opts: opts,
             base_url: "https://memory.twilio.com",
             content_type: :json
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Memory.V1.ControlPlane.Store.DataMapping)}
    end
  end

  @doc """
  Retrieve the details of a specific data mapping by its unique ID.

  Operation: `FetchDataMapping` | Tags: DataMapping
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Memory.V1.ControlPlane.Store.DataMapping.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, store_id, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/ControlPlane/Stores/#{store_id}/DataMappings/#{sid}",
             opts: opts,
             base_url: "https://memory.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Memory.V1.ControlPlane.Store.DataMapping)}
    end
  end

  @doc """
  Delete a data mapping from the Memory Store. This action cannot be undone.

  Operation: `DeleteDataMapping` | Tags: DataMapping
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, store_id, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/ControlPlane/Stores/#{store_id}/DataMappings/#{sid}",
      opts: opts,
      base_url: "https://memory.twilio.com"
    )
  end
end
