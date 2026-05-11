# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Memory.V1.Store.Profile.ConversationSummaryService do
  @moduledoc """
  Service for ConversationSummary API operations.

  Operations: `list`, `create`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Retrieve a paginated list of conversation summaries for a specific profile.  Supports response compression for large datasets.

  Operation: `ListProfileConversationSummaries` | Tags: ConversationSummaries
  """
  @spec list(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, store_id, profile_id, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/v1/Stores/#{store_id}/Profiles/#{profile_id}/ConversationSummaries",
           params: params,
           opts: opts,
           base_url: "https://memory.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "summaries")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Memory.V1.Store.Profile.ConversationSummary
               )
         }}

      error ->
        error
    end
  end

  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  @doc "Stream: Retrieve a paginated list of conversation summaries for a specific profile.  Supports response compression for large datasets. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, store_id, profile_id, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, store_id, profile_id, Map.merge(params, page_opts), opts)
      end,
      "summaries"
    )
  end

  @doc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Create one or more conversation summaries associated with the specified profile. Supports both single summary creation and batch creation of up to 10 summaries. Supports request compression for large batch operations and response compression for the response. All summaries will be automatically indexed for semantic search capabilities. The content summary can be up to 4KB in length. Each summary will be created with a unique ID in Twilio Type ID (TTID) format.

  Operation: `CreateProfileConversationSummary` | Tags: ConversationSummaries
  """
  @spec create(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Memory.V1.Store.Profile.ConversationSummary.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, store_id, profile_id, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/Stores/#{store_id}/Profiles/#{profile_id}/ConversationSummaries",
             params: params,
             opts: opts,
             base_url: "https://memory.twilio.com",
             content_type: :json
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Memory.V1.Store.Profile.ConversationSummary
       )}
    end
  end

  @doc """
  Retrieve a specific conversation summary by its ID for the given profile.

  Operation: `FetchProfileConversationSummary` | Tags: ConversationSummaries
  """
  @spec fetch(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Memory.V1.Store.Profile.ConversationSummary.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, store_id, profile_id, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/Stores/#{store_id}/Profiles/#{profile_id}/ConversationSummaries/#{sid}",
             opts: opts,
             base_url: "https://memory.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Memory.V1.Store.Profile.ConversationSummary
       )}
    end
  end

  @doc """
  Delete a specific conversation summary by its ID. This action is irreversible.

  Operation: `DeleteProfileConversationSummary` | Tags: ConversationSummaries
  """
  @spec delete(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, store_id, profile_id, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v1/Stores/#{store_id}/Profiles/#{profile_id}/ConversationSummaries/#{sid}",
      opts: opts,
      base_url: "https://memory.twilio.com"
    )
  end
end
