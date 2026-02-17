# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Assistants.V1.AssistantService do
  @moduledoc """
  Service for Assistant API operations.

  Operations: `list`, `create`, `fetch`, `delete`
  """

  alias Twilio.Client

  @doc """
  list assistants

  Operation: `ListAssistants`
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Assistants",
           params: params,
           opts: opts,
           base_url: "https://assistants.twilio.com"
         ) do
      {:ok, data} -> {:ok, Twilio.Page.from_response(data, "assistants")}
      error -> error
    end
  end

  @doc "Stream: list assistants (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "assistants"
    )
  end

  @doc """
  create an assistant

  Operation: `CreateAssistant`
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, map()} | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/Assistants",
      params: params,
      opts: opts,
      base_url: "https://assistants.twilio.com",
      content_type: :json
    )
  end

  @doc """
  get an assistant

  Operation: `FetchAssistant`
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    Client.request(client, :get, "/v1/Assistants/#{sid}",
      opts: opts,
      base_url: "https://assistants.twilio.com"
    )
  end

  @doc """
  delete an assistant

  Operation: `DeleteAssistant`
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Assistants/#{sid}",
      opts: opts,
      base_url: "https://assistants.twilio.com"
    )
  end
end
