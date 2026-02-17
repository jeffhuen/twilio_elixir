# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Numbers.V2.Regulatorycompliance.SupportingdocumenttypeService do
  @moduledoc """


  Operations: `list`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all Supporting Document Types.

  Operation: `ListSupportingDocumentType` | Tags: NumbersV2SupportingDocumentType
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v2/RegulatoryCompliance/SupportingDocumentTypes",
           params: params,
           opts: opts,
           base_url: "https://numbers.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "supporting_document_types")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Numbers.V2.Regulatorycompliance.Supportingdocumenttype
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all Supporting Document Types. (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "supporting_document_types"
    )
  end

  @doc """
  Fetch a specific Supporting Document Type Instance.

  Operation: `FetchSupportingDocumentType` | Tags: NumbersV2SupportingDocumentType
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Numbers.V2.Regulatorycompliance.Supportingdocumenttype.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v2/RegulatoryCompliance/SupportingDocumentTypes/#{sid}",
             opts: opts,
             base_url: "https://numbers.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Numbers.V2.Regulatorycompliance.Supportingdocumenttype
       )}
    end
  end
end
