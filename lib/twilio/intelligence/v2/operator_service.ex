# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Intelligence.V2.OperatorService do
  @moduledoc """


  Operations: `list`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieves a list of all Operators for an Account, both Custom and Pre-built.

  Operation: `ListOperator` | Tags: IntelligenceV2Operator

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Availability` | string | Returns Operators with the provided availability type. Possible values: internal, beta, public, retired. |
  | `LanguageCode` | string | Returns Operators that support the provided language code. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v2/Operators",
           params: params,
           opts: opts,
           base_url: "https://intelligence.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "operators")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Intelligence.V2.Operator
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieves a list of all Operators for an Account, both Custom and Pre-built. (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "operators"
    )
  end

  @doc """
  Fetch a specific Operator. Works for both Custom and Pre-built Operators.

  Operation: `FetchOperator` | Tags: IntelligenceV2Operator
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Intelligence.V2.Operator.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v2/Operators/#{sid}",
             opts: opts,
             base_url: "https://intelligence.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Intelligence.V2.Operator)}
    end
  end
end
