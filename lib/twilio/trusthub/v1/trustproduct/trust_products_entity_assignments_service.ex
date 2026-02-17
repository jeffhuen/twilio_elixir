# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Trusthub.V1.Trustproduct.TrustProductsEntityAssignmentsService do
  @moduledoc """


  Operations: `list`, `create`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all Assigned Items for an account.

  Operation: `ListTrustProductEntityAssignment` | Tags: TrusthubV1TrustProductsEntityAssignments

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `ObjectType` | string | A string to filter the results by (EndUserType or SupportingDocumentType) machine-name. This is useful when you want to retrieve the entity-assignment of a specific end-user or supporting document. |
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, trust_product_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/TrustProducts/#{trust_product_sid}/EntityAssignments",
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
                 Twilio.Resources.Trusthub.V1.Trustproduct.TrustProductsEntityAssignments
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all Assigned Items for an account. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, trust_product_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, trust_product_sid, Map.merge(params, page_opts), opts)
      end,
      "results"
    )
  end

  @doc """
  Create a new Assigned Item.

  Operation: `CreateTrustProductEntityAssignment` | Tags: TrusthubV1TrustProductsEntityAssignments

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `ObjectSid` | string | The SID of an object bag that holds information of the different items. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Trusthub.V1.Trustproduct.TrustProductsEntityAssignments.t()}
          | {:error, Twilio.Error.t()}
  def create(client, trust_product_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v1/TrustProducts/#{trust_product_sid}/EntityAssignments",
             params: params,
             opts: opts,
             base_url: "https://trusthub.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Trusthub.V1.Trustproduct.TrustProductsEntityAssignments
       )}
    end
  end

  @doc """
  Fetch specific Assigned Item Instance.

  Operation: `FetchTrustProductEntityAssignment` | Tags: TrusthubV1TrustProductsEntityAssignments
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Trusthub.V1.Trustproduct.TrustProductsEntityAssignments.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, trust_product_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/TrustProducts/#{trust_product_sid}/EntityAssignments/#{sid}",
             opts: opts,
             base_url: "https://trusthub.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Trusthub.V1.Trustproduct.TrustProductsEntityAssignments
       )}
    end
  end

  @doc """
  Remove an Assignment Item Instance.

  Operation: `DeleteTrustProductEntityAssignment` | Tags: TrusthubV1TrustProductsEntityAssignments
  """
  @spec delete(Client.t(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, trust_product_sid, sid, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v1/TrustProducts/#{trust_product_sid}/EntityAssignments/#{sid}",
      opts: opts,
      base_url: "https://trusthub.twilio.com"
    )
  end
end
