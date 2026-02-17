# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Trusthub.V1.SupportingdocumentService do
  @moduledoc """
  Service for Supportingdocument API operations.

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all Supporting Document for an account.

  Operation: `ListSupportingDocument` | Tags: TrusthubV1SupportingDocument
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/SupportingDocuments",
           params: params,
           opts: opts,
           base_url: "https://trusthub.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "results")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Trusthub.V1.Supportingdocument
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all Supporting Document for an account. (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "results"
    )
  end

  @doc """
  Create a new Supporting Document.

  Operation: `CreateSupportingDocument` | Tags: TrusthubV1SupportingDocument

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `FriendlyName` | string | The string that you assigned to describe the resource. |
  | `Type` | string | The type of the Supporting Document. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Attributes` | string | The set of parameters that are the attributes of the Supporting Documents resource which are derived Supporting Document Types. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Trusthub.V1.Supportingdocument.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/SupportingDocuments",
             params: params,
             opts: opts,
             base_url: "https://trusthub.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Trusthub.V1.Supportingdocument)}
    end
  end

  @doc """
  Fetch specific Supporting Document Instance.

  Operation: `FetchSupportingDocument` | Tags: TrusthubV1SupportingDocument
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Trusthub.V1.Supportingdocument.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/SupportingDocuments/#{sid}",
             opts: opts,
             base_url: "https://trusthub.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Trusthub.V1.Supportingdocument)}
    end
  end

  @doc """
  Update an existing Supporting Document.

  Operation: `UpdateSupportingDocument` | Tags: TrusthubV1SupportingDocument

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Attributes` | string | The set of parameters that are the attributes of the Supporting Document resource which are derived Supporting Document Types. |
  | `FriendlyName` | string | The string that you assigned to describe the resource. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Trusthub.V1.Supportingdocument.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/SupportingDocuments/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://trusthub.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Trusthub.V1.Supportingdocument)}
    end
  end

  @doc """
  Delete a specific Supporting Document.

  Operation: `DeleteSupportingDocument` | Tags: TrusthubV1SupportingDocument
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/SupportingDocuments/#{sid}",
      opts: opts,
      base_url: "https://trusthub.twilio.com"
    )
  end
end
