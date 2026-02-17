# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Flex.V1.Insight.InsightsSegmentsService do
  @moduledoc """
  Service for InsightsSegments API operations.

  Operations: `list`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  To get segments for given reservation Ids

  Operation: `ListInsightsSegments` | Tags: FlexV1InsightsSegments

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `SegmentId` | string | To unique id of the segment |
  | `ReservationId` | array | The list of reservation Ids |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Insights/Segments",
           params: params,
           opts: opts,
           base_url: "https://flex-api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "segments")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Flex.V1.Insight.InsightsSegments
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: To get segments for given reservation Ids (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "segments"
    )
  end
end
