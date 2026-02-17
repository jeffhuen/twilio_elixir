# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Bulkexports.V1.Export.DayService do
  @moduledoc """
  Service for Day API operations.

  Operations: `list`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all Days for a resource.

  Operation: `ListDay` | Tags: BulkexportsV1Day
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, resource_type, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Exports/#{resource_type}/Days",
           params: params,
           opts: opts,
           base_url: "https://bulkexports.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "days")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Bulkexports.V1.Export.Day
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all Days for a resource. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, resource_type, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, resource_type, Map.merge(params, page_opts), opts)
      end,
      "days"
    )
  end

  @doc """
  Fetch a specific Day.

  Operation: `FetchDay` | Tags: BulkexportsV1Day
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Bulkexports.V1.Export.Day.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, resource_type, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Exports/#{resource_type}/Days/#{sid}",
             opts: opts,
             base_url: "https://bulkexports.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Bulkexports.V1.Export.Day)}
    end
  end
end
