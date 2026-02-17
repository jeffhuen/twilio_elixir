# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Studio.V1.FlowService do
  @moduledoc """
  Studio flows

  Operations: `list`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all Flows.

  Operation: `ListFlow` | Tags: StudioV1Flow
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Flows",
           params: params,
           opts: opts,
           base_url: "https://studio.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "flows")

        {:ok,
         %{
           page
           | items: Deserializer.deserialize_list(page.items, Twilio.Resources.Studio.V1.Flow)
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
  Retrieve a specific Flow.

  Operation: `FetchFlow` | Tags: StudioV1Flow
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Studio.V1.Flow.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Flows/#{sid}",
             opts: opts,
             base_url: "https://studio.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Studio.V1.Flow)}
    end
  end

  @doc """
  Delete a specific Flow.

  Operation: `DeleteFlow` | Tags: StudioV1Flow
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Flows/#{sid}",
      opts: opts,
      base_url: "https://studio.twilio.com"
    )
  end
end
