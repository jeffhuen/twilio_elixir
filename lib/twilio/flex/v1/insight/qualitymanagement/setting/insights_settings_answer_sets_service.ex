# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Flex.V1.Insight.Qualitymanagement.Setting.InsightsSettingsAnswerSetsService do
  @moduledoc """
  Service for InsightsSettingsAnswerSets API operations.

  Operations: `list`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  To get the Answer Set Settings for an Account

  Operation: `FetchInsightsSettingsAnswersets` | Tags: FlexV1InsightsSettingsAnswerSets
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Insights/QualityManagement/Settings/AnswerSets",
           params: params,
           opts: opts,
           base_url: "https://flex-api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "answersets")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Flex.V1.Insight.Qualitymanagement.Setting.InsightsSettingsAnswerSets
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: To get the Answer Set Settings for an Account (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "answersets"
    )
  end
end
