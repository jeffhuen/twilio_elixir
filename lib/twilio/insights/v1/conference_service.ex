# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Insights.V1.ConferenceService do
  @moduledoc """
  Service for Conference API operations.

  Operations: `list`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Get a list of Conference Summaries.

  Operation: `ListConference` | Tags: InsightsV1Conference

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `ConferenceSid` | string | The SID of the conference. |
  | `FriendlyName` | string | Custom label for the conference resource, up to 64 characters. |
  | `Status` | string | Conference status. |
  | `CreatedAfter` | string | Conferences created after the provided timestamp specified in ISO 8601 format |
  | `CreatedBefore` | string | Conferences created before the provided timestamp specified in ISO 8601 format. |
  | `MixerRegion` | string | Twilio region where the conference media was mixed. |
  | `Tags` | string | Tags applied by Twilio for common potential configuration, quality, or performance issues. |
  | `Subaccount` | string | Account SID for the subaccount whose resources you wish to retrieve. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `DetectedIssues` | string | Potential configuration, behavior, or performance issues detected during the conference. |
  | `EndReason` | string | Conference end reason; e.g. last participant left, modified by API, etc. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Conferences",
           params: params,
           opts: opts,
           base_url: "https://insights.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "conferences")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(page.items, Twilio.Resources.Insights.V1.Conference)
         }}

      error ->
        error
    end
  end

  @doc "Stream: Get a list of Conference Summaries. (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "conferences"
    )
  end

  @doc """
  Get a specific Conference Summary.

  Operation: `FetchConference` | Tags: InsightsV1Conference
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Insights.V1.Conference.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Conferences/#{sid}",
             opts: opts,
             base_url: "https://insights.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Insights.V1.Conference)}
    end
  end
end
