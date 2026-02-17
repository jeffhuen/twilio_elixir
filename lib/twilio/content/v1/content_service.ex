# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Content.V1.ContentService do
  @moduledoc """
  A Content resource represents rich messaging content.

  Operations: `list`, `create`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of Contents belonging to the account used to make the request

  Operation: `ListContent` | Tags: Contentv1Content
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Content",
           params: params,
           opts: opts,
           base_url: "https://content.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "contents")

        {:ok,
         %{
           page
           | items: Deserializer.deserialize_list(page.items, Twilio.Resources.Content.V1.Content)
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of Contents belonging to the account used to make the request (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "contents"
    )
  end

  @doc """
  Create a Content resource

  Operation: `CreateContent` | Tags: Contentv1Content
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Content.V1.Content.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Content",
             params: params,
             opts: opts,
             base_url: "https://content.twilio.com",
             content_type: :json
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Content.V1.Content)}
    end
  end

  @doc """
  Fetch a Content resource by its unique Content Sid

  Operation: `FetchContent` | Tags: Contentv1Content
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Content.V1.Content.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Content/#{sid}",
             opts: opts,
             base_url: "https://content.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Content.V1.Content)}
    end
  end

  @doc """
  Deletes a Content resource

  Operation: `DeleteContent` | Tags: Contentv1Content
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Content/#{sid}",
      opts: opts,
      base_url: "https://content.twilio.com"
    )
  end
end
