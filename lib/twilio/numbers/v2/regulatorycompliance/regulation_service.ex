# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Numbers.V2.Regulatorycompliance.RegulationService do
  @moduledoc """
  Service for Regulation API operations.

  Operations: `list`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all Regulations.

  Operation: `ListRegulation` | Tags: NumbersV2Regulation

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `EndUserType` | string | The type of End User the regulation requires - can be `individual` or `business`. |
  | `IsoCountry` | string | The ISO country code of the phone number's country. |
  | `NumberType` | string | The type of phone number that the regulatory requiremnt is restricting. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `IncludeConstraints` | boolean | A boolean parameter indicating whether to include constraints or not for supporting end user, documents and their fields |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v2/RegulatoryCompliance/Regulations",
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
                 Twilio.Resources.Numbers.V2.Regulatorycompliance.Regulation
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all Regulations. (lazy auto-pagination)."
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
  Fetch specific Regulation Instance.

  Operation: `FetchRegulation` | Tags: NumbersV2Regulation

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `IncludeConstraints` | boolean | A boolean parameter indicating whether to include constraints or not for supporting end user, documents and their fields |
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Numbers.V2.Regulatorycompliance.Regulation.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v2/RegulatoryCompliance/Regulations/#{sid}",
             opts: opts,
             base_url: "https://numbers.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Numbers.V2.Regulatorycompliance.Regulation)}
    end
  end
end
