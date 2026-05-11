# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Memory.V1.ControlPlane.Store.TraitGroupService do
  @moduledoc """
  Service for TraitGroup API operations.

  Operations: `list`, `create`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Returns a list of Trait Groups for this Memory Store, with optional traits information.

  Operation: `ListTraitGroups` | Tags: TraitGroup

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `includeTraits` | boolean | Whether to include trait definitions in the response |
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, store_id, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/ControlPlane/Stores/#{store_id}/TraitGroups",
           params: params,
           opts: opts,
           base_url: "https://memory.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "traitGroups")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Memory.V1.ControlPlane.Store.TraitGroup
               )
         }}

      error ->
        error
    end
  end

  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  @doc "Stream: Returns a list of Trait Groups for this Memory Store, with optional traits information. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, store_id, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, store_id, Map.merge(params, page_opts), opts)
      end,
      "traitGroups"
    )
  end

  @doc """
  Creates a Trait Group with declarative trait schemas for this Memory Store.


  Operation: `CreateTraitGroup` | Tags: TraitGroup
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Memory.V1.ControlPlane.Store.TraitGroup.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, store_id, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/ControlPlane/Stores/#{store_id}/TraitGroups",
             params: params,
             opts: opts,
             base_url: "https://memory.twilio.com",
             content_type: :json
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Memory.V1.ControlPlane.Store.TraitGroup)}
    end
  end

  @doc """
  Retrieve a specific Trait Group by its unique name for this Memory Store, with optional traits information.

  Operation: `FetchTraitGroup` | Tags: TraitGroup

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `includeTraits` | boolean | Whether to include trait definitions in the response |
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Memory.V1.ControlPlane.Store.TraitGroup.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, store_id, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/ControlPlane/Stores/#{store_id}/TraitGroups/#{sid}",
             opts: opts,
             base_url: "https://memory.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Memory.V1.ControlPlane.Store.TraitGroup)}
    end
  end

  @doc """
  Deletes the Trait Group and all associated Traits from the Memory Store.


  Operation: `DeleteTraitGroup` | Tags: TraitGroup
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, store_id, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/ControlPlane/Stores/#{store_id}/TraitGroups/#{sid}",
      opts: opts,
      base_url: "https://memory.twilio.com"
    )
  end
end
