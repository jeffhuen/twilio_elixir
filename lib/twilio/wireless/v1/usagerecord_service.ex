# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Wireless.V1.UsagerecordService do
  @moduledoc """
  Aggregated Usage information for all SIMs on an Account

  Operations: `list`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListAccountUsageRecord` | Tags: WirelessV1UsageRecord

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `End` | string (date-time) | Only include usage that has occurred on or before this date. Format is [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html). |
  | `Start` | string (date-time) | Only include usage that has occurred on or after this date. Format is [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html). |
  | `Granularity` | string | How to summarize the usage by time. Can be: `daily`, `hourly`, or `all`. A value of `all` returns one Usage Record that describes the usage for the entire period. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/UsageRecords",
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
               Deserializer.deserialize_list(page.items, Twilio.Resources.Wireless.V1.Usagerecord)
         }}

      error ->
        error
    end
  end

  @doc "Stream:  (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "usage_records"
    )
  end
end
