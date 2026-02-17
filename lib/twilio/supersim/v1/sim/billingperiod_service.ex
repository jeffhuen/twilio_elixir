# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Supersim.V1.Sim.BillingperiodService do
  @moduledoc """
  Billing Period for an IoT Super SIM

  Operations: `list`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of Billing Periods for a Super SIM.

  Operation: `ListBillingPeriod` | Tags: SupersimV1BillingPeriod
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, sim_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Sims/#{sim_sid}/BillingPeriods",
           params: params,
           opts: opts,
           base_url: "https://supersim.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "billing_periods")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Supersim.V1.Sim.Billingperiod
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of Billing Periods for a Super SIM. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, sim_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, sim_sid, Map.merge(params, page_opts), opts)
      end,
      "billing_periods"
    )
  end
end
