# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Studio.V2.FlowService do
  @moduledoc """
  Studio flows

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all Flows.

  Operation: `ListFlow` | Tags: StudioV2Flow
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v2/Flows",
           params: params,
           opts: opts,
           base_url: "https://studio.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "flows")

        {:ok,
         %{
           page
           | items: Deserializer.deserialize_list(page.items, Twilio.Resources.Studio.V2.Flow)
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all Flows. (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "flows"
    )
  end

  @doc """
  Create a Flow.

  Operation: `CreateFlow` | Tags: StudioV2Flow

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Definition` | string | JSON representation of flow definition. |
  | `FriendlyName` | string | The string that you assigned to describe the Flow. |
  | `Status` | string |  Values: `draft`, `published` |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `CommitMessage` | string | Description of change made in the revision. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Studio.V2.Flow.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/Flows",
             params: params,
             opts: opts,
             base_url: "https://studio.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Studio.V2.Flow)}
    end
  end

  @doc """
  Retrieve a specific Flow.

  Operation: `FetchFlow` | Tags: StudioV2Flow
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Studio.V2.Flow.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v2/Flows/#{sid}",
             opts: opts,
             base_url: "https://studio.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Studio.V2.Flow)}
    end
  end

  @doc """
  Update a Flow.

  Operation: `UpdateFlow` | Tags: StudioV2Flow

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Status` | string |  Values: `draft`, `published` |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `CommitMessage` | string | Description of change made in the revision. |
  | `Definition` | string | JSON representation of flow definition. |
  | `FriendlyName` | string | The string that you assigned to describe the Flow. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Studio.V2.Flow.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/Flows/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://studio.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Studio.V2.Flow)}
    end
  end

  @doc """
  Delete a specific Flow.

  Operation: `DeleteFlow` | Tags: StudioV2Flow
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v2/Flows/#{sid}",
      opts: opts,
      base_url: "https://studio.twilio.com"
    )
  end
end
