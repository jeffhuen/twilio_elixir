# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Knowledge.V1.Knowledge.ChunkService do
  @moduledoc """
  Service for Chunk API operations.

  Operations: `list`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  List knowledge chunks

  Operation: `ListKnowledgeChunks`
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, id, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Knowledge/#{id}/Chunks",
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
                 Twilio.Resources.Knowledge.V1.Knowledge.Chunk
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: List knowledge chunks (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, id, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, id, Map.merge(params, page_opts), opts)
      end,
      "chunks"
    )
  end
end
