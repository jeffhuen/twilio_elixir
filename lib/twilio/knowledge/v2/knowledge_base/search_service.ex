# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Knowledge.V2.KnowledgeBase.SearchService do
  @moduledoc """
  Service for Search API operations.

  Operations: `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Perform semantic search across knowledge sources within a knowledge base to find the most relevant content
  chunks based on a natural language query.  Returns ranked chunks with similarity scores, allowing you to retrieve
  contextually relevant information for AI applications, chatbots, or  information retrieval systems. You can filter
  results by specific knowledge sources.

  Operation: `CreateKnowledgeSearch` | Tags: Knowledge
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Knowledge.V2.KnowledgeBase.Search.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, kb_id, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/KnowledgeBases/#{kb_id}/Search",
             params: params,
             opts: opts,
             base_url: "https://knowledge.twilio.com",
             content_type: :json
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Knowledge.V2.KnowledgeBase.Search)}
    end
  end
end
