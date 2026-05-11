# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Knowledge.V2.KnowledgeBase.KnowledgeService do
  @moduledoc """
  Service for Knowledge API operations.

  Operations: `list`, `create`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a paginated list of all knowledge sources for a specific knowledge base.  Knowledge sources represent
  unstructured data sources such as documents,  websites, or text content that can be used for context and information
  retrieval.

  Operation: `ListKnowledge` | Tags: Knowledge

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `page` | integer | The page index. This value is simply for client state. |
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, kb_id, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v2/KnowledgeBases/#{kb_id}/Knowledge",
           params: params,
           opts: opts,
           base_url: "https://knowledge.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "knowledge")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Knowledge.V2.KnowledgeBase.Knowledge
               )
         }}

      error ->
        error
    end
  end

  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  @doc "Stream: Retrieve a paginated list of all knowledge sources for a specific knowledge base.  Knowledge sources represent
unstructured data sources such as documents,  websites, or text content that can be used for context and information
retrieval. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, kb_id, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, kb_id, Map.merge(params, page_opts), opts)
      end,
      "knowledge"
    )
  end

  @doc """
  Create a new knowledge source from various data sources such as web content,  files, or raw text. The
  knowledge source will be processed and indexed to enable semantic search and retrieval.

  ## Best practices

  To maximize the effectiveness of Knowledge, consider the following best practices:

  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  **Assess and optimize content:** Regularly evaluate your existing Knowledge sources for accuracy, relevance, and coverage.
  Identify any gaps or outdated information that could hinder the Assistant's performance.

  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  **Simplify and structure content:** Ensure that the content is clear and concise. Use headings, bullet points, and metadata to make information straightforward
  to navigate for both the AI Assistant and your users.

  **Prioritize high-impact content:** Focus on updating and
  maintaining content that is frequently accessed or critical to customer interactions. Consider using analytics to
  determine which Knowledge entries are most valuable.

  Operation: `CreateKnowledge` | Tags: Knowledge
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Knowledge.V2.KnowledgeBase.Knowledge.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, kb_id, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/KnowledgeBases/#{kb_id}/Knowledge",
             params: params,
             opts: opts,
             base_url: "https://knowledge.twilio.com",
             content_type: :json
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Knowledge.V2.KnowledgeBase.Knowledge)}
    end
  end

  @doc """
  Fetch detailed information about a specific knowledge source by its ID.  This returns the complete knowledge
  source object including  processing status, source details, and configuration information.

  Operation: `FetchKnowledge` | Tags: Knowledge
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Knowledge.V2.KnowledgeBase.Knowledge.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, kb_id, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v2/KnowledgeBases/#{kb_id}/Knowledge/#{sid}",
             opts: opts,
             base_url: "https://knowledge.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Knowledge.V2.KnowledgeBase.Knowledge)}
    end
  end

  @doc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Permanently delete knowledge source and all its associated data, including  processed chunks and embeddings. This action cannot be undone. The knowledge  resource will no longer be available for search or retrieval operations.

  Operation: `DeleteKnowledge` | Tags: Knowledge
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, kb_id, sid, opts \\ []) do
    Client.request(client, :delete, "/v2/KnowledgeBases/#{kb_id}/Knowledge/#{sid}",
      opts: opts,
      base_url: "https://knowledge.twilio.com"
    )
  end
end
