# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Intelligence.V3.OperatorResultService do
  @moduledoc """
  Service for OperatorResult API operations.

  Operations: `list`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  List OperatorResult resources.

  Operation: `ListOperatorResults` | Tags: OperatorResults

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `conversationId` | string | Filter Operator Results by attached Conversation `id`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `intelligenceConfigurationId` | string | Filter Operator Results by Intelligence Configuration `id` used to generate them. |
  | `operatorId` | string | Filter Operator Results by Language Operator `id`. |
  | `pageSize` | integer | The maximum number of resources to return |
  | `pageToken` | string | Token for pagination |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v3/OperatorResults",
           params: params,
           opts: opts,
           base_url: "https://intelligence.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "items")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Intelligence.V3.OperatorResult
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream all resources with lazy auto-pagination."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "items"
    )
  end

  @doc """
  Fetch a OperatorResult.

  Operation: `FetchOperatorResult` | Tags: OperatorResults
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Intelligence.V3.OperatorResult.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v3/OperatorResults/#{sid}",
             opts: opts,
             base_url: "https://intelligence.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Intelligence.V3.OperatorResult)}
    end
  end

  @doc """
  Delete a OperatorResult.

  Operation: `DeleteOperatorResult` | Tags: OperatorResults
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v3/OperatorResults/#{sid}",
      opts: opts,
      base_url: "https://intelligence.twilio.com"
    )
  end
end
