# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Memory.V1.Store.Profile.RecallService do
  @moduledoc """
  Service for Recall API operations.

  Operations: `create`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Tailored memory retrieval for agentic workloads. Supports hybrid semantic search, date ranges, and configurable result limits for different memory types. This endpoint is optimized for conversational AI and memory retrieval use cases. If a query is not specified then one is inferred from the conversation context. If neither a query nor a conversationId is provided, results are returned in most-recent order without relevance scores.

  Operation: `CreateFetchProfileMemory` | Tags: Retrieval
  """
  @spec create(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Memory.V1.Store.Profile.Recall.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, store_id, profile_id, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Stores/#{store_id}/Profiles/#{profile_id}/Recall",
             params: params,
             opts: opts,
             base_url: "https://memory.twilio.com",
             content_type: :json
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Memory.V1.Store.Profile.Recall)}
    end
  end
end
