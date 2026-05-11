# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Knowledge.V2.ControlPlane.KnowledgeBaseService do
  @moduledoc """
  Service for KnowledgeBase API operations.

  Operations: `list`, `create`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Get a list of knowledge bases for the Twilio account.

  Operation: `ListKnowledgeBases` | Tags: KnowledgeBases
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v2/ControlPlane/KnowledgeBases",
           params: params,
           opts: opts,
           base_url: "https://knowledge.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "knowledgebases")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Knowledge.V2.ControlPlane.KnowledgeBase
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Get a list of knowledge bases for the Twilio account. (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "knowledgebases"
    )
  end

  @doc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Create a new Knowledge Base for the Twilio account. Accounts can have multiple knowledge bases. Each knowledge base can contain multiple knowledge resources such as documents, websites, or text content that can be used for context and information retrieval.

  Operation: `CreateKnowledgeBase` | Tags: KnowledgeBases
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Knowledge.V2.ControlPlane.KnowledgeBase.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/ControlPlane/KnowledgeBases",
             params: params,
             opts: opts,
             base_url: "https://knowledge.twilio.com",
             content_type: :json
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Knowledge.V2.ControlPlane.KnowledgeBase)}
    end
  end

  @doc """
  Retrieve the details of a specific Knowledge Base by its unique ID.

  Operation: `FetchKnowledgeBase` | Tags: KnowledgeBases
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Knowledge.V2.ControlPlane.KnowledgeBase.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v2/ControlPlane/KnowledgeBases/#{sid}",
             opts: opts,
             base_url: "https://knowledge.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Knowledge.V2.ControlPlane.KnowledgeBase)}
    end
  end

  @doc """
  Delete a Knowledge Base and all associated knowledge resources. This action cannot be undone.

  Operation: `DeleteKnowledgeBase` | Tags: KnowledgeBases
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v2/ControlPlane/KnowledgeBases/#{sid}",
      opts: opts,
      base_url: "https://knowledge.twilio.com"
    )
  end
end
