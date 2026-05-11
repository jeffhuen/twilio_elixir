# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Memory.V1.ControlPlane.StoreService do
  @moduledoc """
  Service for Store API operations.

  Operations: `list`, `create`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Get a list of memory stores for the Twilio account.

  Operation: `ListStores` | Tags: Store
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/ControlPlane/Stores",
           params: params,
           opts: opts,
           base_url: "https://memory.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "stores")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Memory.V1.ControlPlane.Store
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Get a list of memory stores for the Twilio account. (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "stores"
    )
  end

  @doc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Create a new Memory Store for the Twilio account. Accounts can have multiple memory stores, up to a maximum limit of 15.
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Each memory store will automatically provision other dependent resources as needed, including Conversational Intelligence
  capabilities.

  Operation: `CreateStore` | Tags: Store
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Memory.V1.ControlPlane.Store.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/ControlPlane/Stores",
             params: params,
             opts: opts,
             base_url: "https://memory.twilio.com",
             content_type: :json
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Memory.V1.ControlPlane.Store)}
    end
  end

  @doc """
  Retrieve the details of a specific Memory Store by its unique ID.

  Operation: `FetchStore` | Tags: Store
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Memory.V1.ControlPlane.Store.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/ControlPlane/Stores/#{sid}",
             opts: opts,
             base_url: "https://memory.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Memory.V1.ControlPlane.Store)}
    end
  end

  @doc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Deletes the Memory Store and all associated resources including identity resolution settings, trait groups, profiles, traits, observations, and summaries.

  Operation: `DeleteStore` | Tags: Store
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/ControlPlane/Stores/#{sid}",
      opts: opts,
      base_url: "https://memory.twilio.com"
    )
  end
end
