# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Insights.V2.Voice.ReportService do
  @moduledoc """
  Service for Report API operations.

  Operations: `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Get Account Level Report for the given Report Id.

  Operation: `FetchAccountReport` | Tags: InsightsV1GetAccountReport
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Insights.V2.Voice.Report.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v2/Voice/Reports/#{sid}",
             opts: opts,
             base_url: "https://insights.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Insights.V2.Voice.Report)}
    end
  end
end
