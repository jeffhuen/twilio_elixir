# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Trusthub.V1.TrustProduct.TrustProductsEvaluationsService do
  @moduledoc """
  Service for TrustProductsEvaluations API operations.

  Operations: `list`, `create`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of Evaluations associated to the trust_product resource.

  Operation: `ListTrustProductEvaluation` | Tags: TrusthubV1TrustProductsEvaluations
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, trust_product_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/TrustProducts/#{trust_product_sid}/Evaluations",
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
                 Twilio.Resources.Trusthub.V1.TrustProduct.TrustProductsEvaluations
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of Evaluations associated to the trust_product resource. (lazy auto-pagination)."
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
  Create a new Evaluation

  Operation: `CreateTrustProductEvaluation` | Tags: TrusthubV1TrustProductsEvaluations

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `PolicySid` | string | The unique string of a policy that is associated to the customer_profile resource. |
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Trusthub.V1.TrustProduct.TrustProductsEvaluations.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, trust_product_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/TrustProducts/#{trust_product_sid}/Evaluations",
             params: params,
             opts: opts,
             base_url: "https://trusthub.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Trusthub.V1.TrustProduct.TrustProductsEvaluations
       )}
    end
  end

  @doc """
  Fetch specific Evaluation Instance.

  Operation: `FetchTrustProductEvaluation` | Tags: TrusthubV1TrustProductsEvaluations
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Trusthub.V1.TrustProduct.TrustProductsEvaluations.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, trust_product_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/TrustProducts/#{trust_product_sid}/Evaluations/#{sid}",
             opts: opts,
             base_url: "https://trusthub.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Trusthub.V1.TrustProduct.TrustProductsEvaluations
       )}
    end
  end
end
