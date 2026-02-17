# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Insights.V1.Voice.MetricService do
  @moduledoc """


  Operations: `list`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Get a list of Call Metrics for a Call.

  Operation: `ListMetric` | Tags: InsightsV1Metric

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Edge` | string | The Edge of this Metric. One of `unknown_edge`, `carrier_edge`, `sip_edge`, `sdk_edge` or `client_edge`. |
  | `Direction` | string | The Direction of this Metric. One of `unknown`, `inbound`, `outbound` or `both`. |
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, call_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Voice/#{call_sid}/Metrics",
           params: params,
           opts: opts,
           base_url: "https://insights.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "metrics")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Insights.V1.Voice.Metric
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Get a list of Call Metrics for a Call. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, call_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, call_sid, Map.merge(params, page_opts), opts)
      end,
      "metrics"
    )
  end
end
