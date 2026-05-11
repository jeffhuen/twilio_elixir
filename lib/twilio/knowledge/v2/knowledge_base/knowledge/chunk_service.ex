# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Knowledge.V2.KnowledgeBase.Knowledge.ChunkService do
  @moduledoc """
  Service for Chunk API operations.

  Operations: `list`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Retrieve a paginated list of all processed content chunks from a specific knowledge source.  Chunks are smaller segments of content that have been extracted and processed from the original  knowledge source. Each chunk contains content text and associated metadata that can be used  for semantic search and retrieval operations.

  Operation: `ListKnowledgeChunks` | Tags: Knowledge

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `pageSize` | integer | How many resources to return in each list page. The default is 50, and the maximum is 1000. |
  | `pageToken` | string | The page token. This is provided by the API. |
  """
  @spec list(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, kb_id, knowledge_id, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/v2/KnowledgeBases/#{kb_id}/Knowledge/#{knowledge_id}/Chunks",
           params: params,
           opts: opts,
           base_url: "https://knowledge.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "chunks")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Knowledge.V2.KnowledgeBase.Knowledge.Chunk
               )
         }}

      error ->
        error
    end
  end

  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  @doc "Stream: Retrieve a paginated list of all processed content chunks from a specific knowledge source.  Chunks are smaller segments of content that have been extracted and processed from the original  knowledge source. Each chunk contains content text and associated metadata that can be used  for semantic search and retrieval operations. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, kb_id, knowledge_id, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, kb_id, knowledge_id, Map.merge(params, page_opts), opts)
      end,
      "chunks"
    )
  end
end
