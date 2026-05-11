# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Memory.V1.Store.ProfileService do
  @moduledoc """
  Service for Profile API operations.

  Operations: `list`, `create`
  """

  alias Twilio.Client

  @doc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Return a paginated list of profile IDs ordered by most recently created first. Use the optional paging parameters (`pageSize`, `pageToken`, `orderBy`) to control pagination and sorting. This endpoint is optimized for browsing newly created profiles and lightweight lookups where only the identifiers are needed before requesting full profile details.

  Operation: `ListProfiles` | Tags: Profile
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, store_id, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Stores/#{store_id}/Profiles",
           params: params,
           opts: opts,
           base_url: "https://memory.twilio.com"
         ) do
      {:ok, data} -> {:ok, Twilio.Page.from_response(data, "profiles")}
      error -> error
    end
  end

  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  @doc "Stream: Return a paginated list of profile IDs ordered by most recently created first. Use the optional paging parameters (`pageSize`, `pageToken`, `orderBy`) to control pagination and sorting. This endpoint is optimized for browsing newly created profiles and lightweight lookups where only the identifiers are needed before requesting full profile details. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, store_id, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, store_id, Map.merge(params, page_opts), opts)
      end,
      "profiles"
    )
  end

  @doc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Create a new profile and set initial traits. The request synchronously resolves identity and either creates a new profile ID or retrieves the associated canonical profile ID based on any provided identifier traits present in the request. The request must contain at least one trait that is promoted to an identifier in its trait group settings. Any additional traits are queued for asynchronous processing.

  Operation: `CreateProfile` | Tags: Profile
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def create(client, store_id, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/Stores/#{store_id}/Profiles",
      params: params,
      opts: opts,
      base_url: "https://memory.twilio.com",
      content_type: :json
    )
  end
end
