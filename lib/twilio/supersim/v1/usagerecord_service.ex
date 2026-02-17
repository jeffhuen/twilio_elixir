# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Supersim.V1.UsagerecordService do
  @moduledoc """
  Usage information for Sim resources

  Operations: `list`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  List UsageRecords

  Operation: `ListUsageRecord` | Tags: SupersimV1UsageRecord

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Sim` | string | SID or unique name of a Sim resource. Only show UsageRecords representing usage incurred by this Super SIM. |
  | `Fleet` | string | SID or unique name of a Fleet resource. Only show UsageRecords representing usage for Super SIMs belonging to this Fleet resource at the time the usage occurred. |
  | `Network` | string | SID of a Network resource. Only show UsageRecords representing usage on this network. |
  | `IsoCountry` | string (iso-country-code) | Alpha-2 ISO Country Code. Only show UsageRecords representing usage in this country. |
  | `Group` | string | Dimension over which to aggregate usage records. Can be: `sim`, `fleet`, `network`, `isoCountry`. Default is to not aggregate across any of these dimensions, UsageRecords will be aggregated into the time buckets described by the `Granularity` parameter. |
  | `Granularity` | string | Time-based grouping that UsageRecords should be aggregated by. Can be: `hour`, `day`, or `all`. Default is `all`. `all` returns one UsageRecord that describes the usage for the entire period. |
  | `StartTime` | string (date-time) | Only include usage that occurred at or after this time, specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format. Default is one month before the `end_time`. |
  | `EndTime` | string (date-time) | Only include usage that occurred before this time (exclusive), specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format. Default is the current time. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/UsageRecords",
           params: params,
           opts: opts,
           base_url: "https://supersim.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "usage_records")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(page.items, Twilio.Resources.Supersim.V1.Usagerecord)
         }}

      error ->
        error
    end
  end

  @doc "Stream: List UsageRecords (lazy auto-pagination)."
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
