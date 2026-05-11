# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Intelligence.V3.ControlPlane.OperatorService do
  @moduledoc """
  Service for Operator API operations.

  Operations: `list`, `create`, `fetch`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Retrieve a list of Operators for the account, including those not attached to an Intelligence Configuration. This request returns both Twilio-authored and custom language operators.

  Operation: `ListOperators` | Tags: Operators

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `pageSize` | integer | The maximum number of resources to return |
  | `pageToken` | string | Token for pagination |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v3/ControlPlane/Operators",
           params: params,
           opts: opts,
           base_url: "https://intelligence.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "items")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Intelligence.V3.ControlPlane.Operator
               )
         }}

      error ->
        error
    end
  end

  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  @doc "Stream: Retrieve a list of Operators for the account, including those not attached to an Intelligence Configuration. This request returns both Twilio-authored and custom language operators. (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "items"
    )
  end

  @doc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Create a custom language operator. You can define a reusable, programmable conversational analysis task tailored to your business needs.

  Operation: `CreateOperator` | Tags: Operators
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Intelligence.V3.ControlPlane.Operator.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v3/ControlPlane/Operators",
             params: params,
             opts: opts,
             base_url: "https://intelligence.twilio.com",
             content_type: :json
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Intelligence.V3.ControlPlane.Operator)}
    end
  end

  @doc """
  Fetch a Operator.

  Operation: `FetchOperator` | Tags: Operators
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Intelligence.V3.ControlPlane.Operator.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v3/ControlPlane/Operators/#{sid}",
             opts: opts,
             base_url: "https://intelligence.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Intelligence.V3.ControlPlane.Operator)}
    end
  end

  @doc """
  Delete a Operator.

  Operation: `DeleteOperator` | Tags: Operators
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v3/ControlPlane/Operators/#{sid}",
      opts: opts,
      base_url: "https://intelligence.twilio.com"
    )
  end
end
