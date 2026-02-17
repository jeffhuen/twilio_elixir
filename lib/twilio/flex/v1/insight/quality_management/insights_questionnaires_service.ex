# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Flex.V1.Insight.QualityManagement.InsightsQuestionnairesService do
  @moduledoc """
  Service for InsightsQuestionnaires API operations.

  Operations: `list`, `create`, `fetch`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  To get all questionnaires with questions

  Operation: `ListInsightsQuestionnaires` | Tags: FlexV1InsightsQuestionnaires

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `IncludeInactive` | boolean | Flag indicating whether to include inactive questionnaires or not |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Insights/QualityManagement/Questionnaires",
           params: params,
           opts: opts,
           base_url: "https://flex-api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "questionnaires")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Flex.V1.Insight.QualityManagement.InsightsQuestionnaires
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: To get all questionnaires with questions (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "questionnaires"
    )
  end

  @doc """
  To create a Questionnaire

  Operation: `CreateInsightsQuestionnaires` | Tags: FlexV1InsightsQuestionnaires

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Name` | string | The name of this questionnaire |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Active` | boolean | The flag to enable or disable questionnaire |
  | `Description` | string | The description of this questionnaire |
  | `QuestionSids` | array | The list of questions sids under a questionnaire |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.Insight.QualityManagement.InsightsQuestionnaires.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Insights/QualityManagement/Questionnaires",
             params: params,
             opts: opts,
             base_url: "https://flex-api.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Flex.V1.Insight.QualityManagement.InsightsQuestionnaires
       )}
    end
  end

  @doc """
  To get the Questionnaire Detail

  Operation: `FetchInsightsQuestionnaires` | Tags: FlexV1InsightsQuestionnaires
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.Insight.QualityManagement.InsightsQuestionnaires.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Insights/QualityManagement/Questionnaires/#{sid}",
             opts: opts,
             base_url: "https://flex-api.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Flex.V1.Insight.QualityManagement.InsightsQuestionnaires
       )}
    end
  end

  @doc """
  To update the questionnaire

  Operation: `UpdateInsightsQuestionnaires` | Tags: FlexV1InsightsQuestionnaires

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Active` | boolean | The flag to enable or disable questionnaire |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Description` | string | The description of this questionnaire |
  | `Name` | string | The name of this questionnaire |
  | `QuestionSids` | array | The list of questions sids under a questionnaire |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.Insight.QualityManagement.InsightsQuestionnaires.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Insights/QualityManagement/Questionnaires/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://flex-api.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Flex.V1.Insight.QualityManagement.InsightsQuestionnaires
       )}
    end
  end

  @doc """
  To delete the questionnaire

  Operation: `DeleteInsightsQuestionnaires` | Tags: FlexV1InsightsQuestionnaires
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Insights/QualityManagement/Questionnaires/#{sid}",
      opts: opts,
      base_url: "https://flex-api.twilio.com"
    )
  end
end
