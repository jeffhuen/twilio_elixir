# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Memory.V1.Store.Profile.IdentifierService do
  @moduledoc """
  Service for Identifier API operations.

  Operations: `list`, `create`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Retrieve all identifier types linked to a profile along with their stored values. Use this to audit which external keys (phone, email, externalId, etc.) are currently associated. Values are returned in the order enforced by each identifier settings `limitPolicy` and reflect any normalization applied by the service.

  Operation: `ListProfileIdentifiers` | Tags: Identifiers
  """
  @spec list(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, store_id, profile_id, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Stores/#{store_id}/Profiles/#{profile_id}/Identifiers",
           params: params,
           opts: opts,
           base_url: "https://memory.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "identifiers")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Memory.V1.Store.Profile.Identifier
               )
         }}

      error ->
        error
    end
  end

  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  @doc "Stream: Retrieve all identifier types linked to a profile along with their stored values. Use this to audit which external keys (phone, email, externalId, etc.) are currently associated. Values are returned in the order enforced by each identifier settings `limitPolicy` and reflect any normalization applied by the service. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, store_id, profile_id, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, store_id, profile_id, Map.merge(params, page_opts), opts)
      end,
      "identifiers"
    )
  end

  @doc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Asynchronously attach a new identifier value to a profile. When multiple values exist for an `idType`, ordering, limits, and uniqueness checks are enforced by the corresponding identifier settings `limitPolicy` and  reflect any normalization. If the identifier already exists and points to another profile, resolution rules or merge processes may apply. Use the identifier specific endpoint to inspect, update, or remove existing values.

  Operation: `CreateProfileIdentifier` | Tags: Identifiers
  """
  @spec create(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Memory.V1.Store.Profile.Identifier.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, store_id, profile_id, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/Stores/#{store_id}/Profiles/#{profile_id}/Identifiers",
             params: params,
             opts: opts,
             base_url: "https://memory.twilio.com",
             content_type: :json
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Memory.V1.Store.Profile.Identifier)}
    end
  end

  @doc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Retrieve all stored values for a specific identifier type on a profile. Values are normalized according to the configured identifier settings and returned in the order determined by its `limitPolicy`.

  Operation: `FetchProfileIdentifier` | Tags: Identifiers
  """
  @spec fetch(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Memory.V1.Store.Profile.Identifier.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, store_id, profile_id, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/Stores/#{store_id}/Profiles/#{profile_id}/Identifiers/#{sid}",
             opts: opts,
             base_url: "https://memory.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Memory.V1.Store.Profile.Identifier)}
    end
  end

  @doc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Asynchronously remove stored values for the identifier type. The optional `removeAll` query parameter allows bulk removal; otherwise the service selects a single value to delete using the identifier settings `limitPolicy`.

  Operation: `DeleteProfileIdentifier` | Tags: Identifiers

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `removeAll` | boolean | When true, removes every stored value for the identifier type in a single operation. Defaults to false. |
  """
  @spec delete(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, store_id, profile_id, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v1/Stores/#{store_id}/Profiles/#{profile_id}/Identifiers/#{sid}",
      opts: opts,
      base_url: "https://memory.twilio.com"
    )
  end
end
