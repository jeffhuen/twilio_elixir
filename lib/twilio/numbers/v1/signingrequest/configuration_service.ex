# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Numbers.V1.Signingrequest.ConfigurationService do
  @moduledoc """
  Service for Configuration API operations.

  Operations: `list`, `create`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Synchronous operation to retrieve configurations for the customer.

  Operation: `ListSigningRequestConfiguration` | Tags: NumbersV1SigningRequestConfiguration

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Country` | string | The country ISO code to apply this configuration, this is an optional field, Example: US, MX |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Product` | string | The product or service for which is requesting the signature, this is an optional field, Example: Porting, Hosting |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/SigningRequest/Configuration",
           params: params,
           opts: opts,
           base_url: "https://numbers.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "configurations")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Numbers.V1.Signingrequest.Configuration
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Synchronous operation to retrieve configurations for the customer. (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "configurations"
    )
  end

  @doc """
  Synchronous operation to insert or update a configuration for the customer.

  Operation: `CreateSigningRequestConfiguration` | Tags: NumbersV1SigningRequestConfiguration
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Numbers.V1.Signingrequest.Configuration.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/SigningRequest/Configuration",
             params: params,
             opts: opts,
             base_url: "https://numbers.twilio.com",
             content_type: :json
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Numbers.V1.Signingrequest.Configuration)}
    end
  end
end
