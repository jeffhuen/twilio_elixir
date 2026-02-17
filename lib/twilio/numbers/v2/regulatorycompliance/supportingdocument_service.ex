# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Numbers.V2.Regulatorycompliance.SupportingdocumentService do
  @moduledoc """


  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all Supporting Document for an account.

  Operation: `ListSupportingDocument` | Tags: NumbersV2SupportingDocument
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v2/RegulatoryCompliance/SupportingDocuments",
           params: params,
           opts: opts,
           base_url: "https://numbers.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "results")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Numbers.V2.Regulatorycompliance.Supportingdocument
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

  Operation: `CreateSupportingDocument` | Tags: NumbersV2SupportingDocument

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `FriendlyName` | string | The string that you assigned to describe the resource. |
  | `Type` | string | The type of the Supporting Document. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Attributes` | string | The set of parameters that are the attributes of the Supporting Documents resource which are derived Supporting Document Types. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Numbers.V2.Regulatorycompliance.Supportingdocument.t()}
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/RegulatoryCompliance/SupportingDocuments",
             params: params,
             opts: opts,
             base_url: "https://numbers.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Numbers.V2.Regulatorycompliance.Supportingdocument
       )}
    end
  end

  @doc """
  Fetch specific Supporting Document Instance.

  Operation: `FetchSupportingDocument` | Tags: NumbersV2SupportingDocument
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Numbers.V2.Regulatorycompliance.Supportingdocument.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v2/RegulatoryCompliance/SupportingDocuments/#{sid}",
             opts: opts,
             base_url: "https://numbers.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Numbers.V2.Regulatorycompliance.Supportingdocument
       )}
    end
  end

  @doc """
  Update an existing Supporting Document.

  Operation: `UpdateSupportingDocument` | Tags: NumbersV2SupportingDocument

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Attributes` | string | The set of parameters that are the attributes of the Supporting Document resource which are derived Supporting Document Types. |
  | `FriendlyName` | string | The string that you assigned to describe the resource. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Numbers.V2.Regulatorycompliance.Supportingdocument.t()}
          | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/RegulatoryCompliance/SupportingDocuments/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://numbers.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Numbers.V2.Regulatorycompliance.Supportingdocument
       )}
    end
  end

  @doc """
  Delete a specific Supporting Document.

  Operation: `DeleteSupportingDocument` | Tags: NumbersV2SupportingDocument
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v2/RegulatoryCompliance/SupportingDocuments/#{sid}",
      opts: opts,
      base_url: "https://numbers.twilio.com"
    )
  end
end
