# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Wireless.V1.Sim.UsageRecordService do
  @moduledoc """
  Usage information for SIMs

  Operations: `list`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListUsageRecord` | Tags: WirelessV1UsageRecord

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `End` | string (date-time) | Only include usage that occurred on or before this date, specified in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html). The default is the current time. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Start` | string (date-time) | Only include usage that has occurred on or after this date, specified in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html). The default is one month before the `end` parameter value. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Granularity` | string | How to summarize the usage by time. Can be: `daily`, `hourly`, or `all`. The default is `all`. A value of `all` returns one Usage Record that describes the usage for the entire period. |
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, sim_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Sims/#{sim_sid}/UsageRecords",
           params: params,
           opts: opts,
           base_url: "https://wireless.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "usage_records")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Wireless.V1.Sim.UsageRecord
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream:  (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, sim_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, sim_sid, Map.merge(params, page_opts), opts)
      end,
      "usage_records"
    )
  end
end
