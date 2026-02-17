# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Events.V1.Schema.SchemaVersionService do
  @moduledoc """
  Version of the Schema

  Operations: `list`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a paginated list of versions of the schema.

  Operation: `ListSchemaVersion` | Tags: EventsV1SchemaVersion
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, id, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Schemas/#{id}/Versions",
           params: params,
           opts: opts,
           base_url: "https://events.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "schema_versions")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Events.V1.Schema.SchemaVersion
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a paginated list of versions of the schema. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, id, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, id, Map.merge(params, page_opts), opts)
      end,
      "schema_versions"
    )
  end

  @doc """
  Fetch a specific schema and version.

  Operation: `FetchSchemaVersion` | Tags: EventsV1SchemaVersion
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Events.V1.Schema.SchemaVersion.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, id, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Schemas/#{id}/Versions/#{sid}",
             opts: opts,
             base_url: "https://events.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Events.V1.Schema.SchemaVersion)}
    end
  end
end
