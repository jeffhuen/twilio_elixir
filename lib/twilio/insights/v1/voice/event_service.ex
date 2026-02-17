# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Insights.V1.Voice.EventService do
  @moduledoc """
  Service for Event API operations.

  Operations: `list`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Get a list of Call Insight Events for a Call.

  Operation: `ListEvent` | Tags: InsightsV1Event

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Edge` | string | The Edge of this Event. One of `unknown_edge`, `carrier_edge`, `sip_edge`, `sdk_edge` or `client_edge`. |
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, call_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Voice/#{call_sid}/Events",
           params: params,
           opts: opts,
           base_url: "https://insights.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "events")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(page.items, Twilio.Resources.Insights.V1.Voice.Event)
         }}

      error ->
        error
    end
  end

  @doc "Stream: Get a list of Call Insight Events for a Call. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, call_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, call_sid, Map.merge(params, page_opts), opts)
      end,
      "events"
    )
  end
end
