# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Monitor.V1.AlertService do
  @moduledoc """
  Debugger alerts

  Operations: `list`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListAlert` | Tags: MonitorV1Alert

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `LogLevel` | string | Only show alerts for this log-level.  Can be: `error`, `warning`, `notice`, or `debug`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `StartDate` | string (date-time) | Only include alerts that occurred on or after this date and time. Specify the date and time in GMT and format as `YYYY-MM-DD` or `YYYY-MM-DDThh:mm:ssZ`. Queries for alerts older than 30 days are not supported. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `EndDate` | string (date-time) | Only include alerts that occurred on or before this date and time. Specify the date and time in GMT and format as `YYYY-MM-DD` or `YYYY-MM-DDThh:mm:ssZ`. Queries for alerts older than 30 days are not supported. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Alerts",
           params: params,
           opts: opts,
           base_url: "https://monitor.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "alerts")

        {:ok,
         %{
           page
           | items: Deserializer.deserialize_list(page.items, Twilio.Resources.Monitor.V1.Alert)
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
      "alerts"
    )
  end

  @doc """


  Operation: `FetchAlert` | Tags: MonitorV1Alert
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Monitor.V1.Alert.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Alerts/#{sid}",
             opts: opts,
             base_url: "https://monitor.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Monitor.V1.Alert)}
    end
  end
end
