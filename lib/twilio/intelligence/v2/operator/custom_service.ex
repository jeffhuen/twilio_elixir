# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Intelligence.V2.Operator.CustomService do
  @moduledoc """


  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieves a list of all Custom Operators for an Account.

  Operation: `ListCustomOperator` | Tags: IntelligenceV2CustomOperator

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Availability` | string | Returns Custom Operators with the provided availability type. Possible values: internal, beta, public, retired. |
  | `LanguageCode` | string | Returns Custom Operators that support the provided language code. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v2/Operators/Custom",
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
                 Twilio.Resources.Intelligence.V2.Operator.Custom
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieves a list of all Custom Operators for an Account. (lazy auto-pagination)."
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
  Create a new Custom Operator for the given Account

  Operation: `CreateCustomOperator` | Tags: IntelligenceV2CustomOperator

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Config` | string | Operator configuration, following the schema defined by the Operator Type. |
  | `FriendlyName` | string | A human readable description of the new Operator, up to 64 characters. |
  | `OperatorType` | string | Operator Type for this Operator. References an existing Operator Type resource. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Intelligence.V2.Operator.Custom.t()} | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/Operators/Custom",
             params: params,
             opts: opts,
             base_url: "https://intelligence.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Intelligence.V2.Operator.Custom)}
    end
  end

  @doc """
  Fetch a specific Custom Operator.

  Operation: `FetchCustomOperator` | Tags: IntelligenceV2CustomOperator
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Intelligence.V2.Operator.Custom.t()} | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v2/Operators/Custom/#{sid}",
             opts: opts,
             base_url: "https://intelligence.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Intelligence.V2.Operator.Custom)}
    end
  end

  @doc """
  Update a specific Custom Operator.

  Operation: `UpdateCustomOperator` | Tags: IntelligenceV2CustomOperator

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Config` | string | Operator configuration, following the schema defined by the Operator Type. |
  | `FriendlyName` | string | A human-readable name of this resource, up to 64 characters. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Intelligence.V2.Operator.Custom.t()} | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v2/Operators/Custom/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://intelligence.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Intelligence.V2.Operator.Custom)}
    end
  end

  @doc """
  Delete a specific Custom Operator.

  Operation: `DeleteCustomOperator` | Tags: IntelligenceV2CustomOperator
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v2/Operators/Custom/#{sid}",
      opts: opts,
      base_url: "https://intelligence.twilio.com"
    )
  end
end
