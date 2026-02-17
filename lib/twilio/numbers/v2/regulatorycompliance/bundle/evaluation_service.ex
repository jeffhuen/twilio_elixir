# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Numbers.V2.Regulatorycompliance.Bundle.EvaluationService do
  @moduledoc """


  Operations: `list`, `create`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of Evaluations associated to the Bundle resource.

  Operation: `ListEvaluation` | Tags: NumbersV2Evaluation
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, bundle_sid, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/v2/RegulatoryCompliance/Bundles/#{bundle_sid}/Evaluations",
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
                 Twilio.Resources.Numbers.V2.Regulatorycompliance.Bundle.Evaluation
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of Evaluations associated to the Bundle resource. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, bundle_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, bundle_sid, Map.merge(params, page_opts), opts)
      end,
      "results"
    )
  end

  @doc """
  Creates an evaluation for a bundle

  Operation: `CreateEvaluation` | Tags: NumbersV2Evaluation
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Numbers.V2.Regulatorycompliance.Bundle.Evaluation.t()}
          | {:error, Twilio.Error.t()}
  def create(client, bundle_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :post,
             "/v2/RegulatoryCompliance/Bundles/#{bundle_sid}/Evaluations",
             params: params,
             opts: opts,
             base_url: "https://numbers.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Numbers.V2.Regulatorycompliance.Bundle.Evaluation
       )}
    end
  end

  @doc """
  Fetch specific Evaluation Instance.

  Operation: `FetchEvaluation` | Tags: NumbersV2Evaluation
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Numbers.V2.Regulatorycompliance.Bundle.Evaluation.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, bundle_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v2/RegulatoryCompliance/Bundles/#{bundle_sid}/Evaluations/#{sid}",
             opts: opts,
             base_url: "https://numbers.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Numbers.V2.Regulatorycompliance.Bundle.Evaluation
       )}
    end
  end
end
