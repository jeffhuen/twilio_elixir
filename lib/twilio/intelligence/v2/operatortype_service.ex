# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Intelligence.V2.OperatortypeService do
  @moduledoc """


  Operations: `list`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieves a list of all Operator Types for an Account.

  Operation: `ListOperatorType` | Tags: IntelligenceV2OperatorType
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v2/OperatorTypes",
           params: params,
           opts: opts,
           base_url: "https://intelligence.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "operator_types")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Intelligence.V2.Operatortype
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieves a list of all Operator Types for an Account. (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "operator_types"
    )
  end

  @doc """
  Fetch a specific Operator Type.

  Operation: `FetchOperatorType` | Tags: IntelligenceV2OperatorType
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Intelligence.V2.Operatortype.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v2/OperatorTypes/#{sid}",
             opts: opts,
             base_url: "https://intelligence.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Intelligence.V2.Operatortype)}
    end
  end
end
