# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Memory.V1.Store.Profile.ImportService do
  @moduledoc """
  Service for Import API operations.

  Operations: `list`, `create`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Retrieve a list of profile import task IDs that have been submitted for this service. Use these IDs to query individual import status details.

  Operation: `ListProfileImportsV2` | Tags: Profile
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, store_id, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Stores/#{store_id}/Profiles/Imports",
           params: params,
           opts: opts,
           base_url: "https://memory.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "imports")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Memory.V1.Store.Profile.Import
               )
         }}

      error ->
        error
    end
  end

  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  @doc "Stream: Retrieve a list of profile import task IDs that have been submitted for this service. Use these IDs to query individual import status details. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, store_id, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, store_id, Map.merge(params, page_opts), opts)
      end,
      "imports"
    )
  end

  @doc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Initiate a profile import by requesting a pre-signed upload URL and an associated `importId`. Upload your CSV to the returned URL (single PUT). Query the import status endpoint to track processing progress. This endpoint creates the import task and allocates resources for subsequent ingestion.

  Operation: `CreateProfilesImportV2` | Tags: Profile

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `columnMappings` | array | Mappings of CSV header columns to traits' fields |
  | `fileSize` | integer | The size of the file in bytes (1 byte to 100 MiB) |
  | `filename` | string | The name of the file to generate a presigned URL |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Memory.V1.Store.Profile.Import.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, store_id, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Stores/#{store_id}/Profiles/Imports",
             params: params,
             opts: opts,
             base_url: "https://memory.twilio.com",
             content_type: :json
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Memory.V1.Store.Profile.Import)}
    end
  end

  @doc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Retrieve the current processing status of a previously submitted bulk import task. Query this endpoint using the `importId` returned from the upload URL request until a terminal state (COMPLETED or FAILED) is reached.

  Operation: `FetchProfileImportV2` | Tags: Profile
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Memory.V1.Store.Profile.Import.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, store_id, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Stores/#{store_id}/Profiles/Imports/#{sid}",
             opts: opts,
             base_url: "https://memory.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Memory.V1.Store.Profile.Import)}
    end
  end
end
