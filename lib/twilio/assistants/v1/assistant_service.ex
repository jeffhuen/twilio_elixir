# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Assistants.V1.AssistantService do
  @moduledoc """
  Service for Assistant API operations.

  Operations: `list`, `create`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  list assistants

  Operation: `ListAssistants`
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Assistants",
           params: params,
           opts: opts,
           base_url: "https://assistants.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "assistants")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(page.items, Twilio.Resources.Assistants.V1.Assistant)
         }}

      error ->
        error
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
          {:ok, Twilio.Resources.Assistants.V1.Assistant.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Assistants",
             params: params,
             opts: opts,
             base_url: "https://assistants.twilio.com",
             content_type: :json
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Assistants.V1.Assistant)}
    end
  end

  @doc """
  get an assistant

  Operation: `FetchAssistant`
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Assistants.V1.Assistant.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Assistants/#{sid}",
             opts: opts,
             base_url: "https://assistants.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Assistants.V1.Assistant)}
    end
  end

  @doc """
  delete an assistant

  Operation: `DeleteAssistant`
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Assistants/#{sid}",
      opts: opts,
      base_url: "https://assistants.twilio.com"
    )
  end
end
