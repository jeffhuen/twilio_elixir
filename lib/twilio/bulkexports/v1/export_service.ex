# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Bulkexports.V1.ExportService do
  @moduledoc """
  Service for Export API operations.

  Operations: `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Fetch a specific Export.

  Operation: `FetchExport` | Tags: BulkexportsV1Export
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Bulkexports.V1.Export.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Exports/#{sid}",
             opts: opts,
             base_url: "https://bulkexports.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Bulkexports.V1.Export)}
    end
  end
end
