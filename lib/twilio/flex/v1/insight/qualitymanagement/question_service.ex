# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Flex.V1.Insight.Qualitymanagement.QuestionService do
  @moduledoc """
  Service for Question API operations.

  Operations: `list`, `create`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  To get all the question for the given categories

  Operation: `ListInsightsQuestionnairesQuestion` | Tags: FlexV1InsightsQuestionnairesQuestion

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `CategorySid` | array | The list of category SIDs |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Insights/QualityManagement/Questions",
           params: params,
           opts: opts,
           base_url: "https://flex-api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "questions")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Flex.V1.Insight.Qualitymanagement.Question
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: To get all the question for the given categories (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "questions"
    )
  end

  @doc """
  To create a question for a Category

  Operation: `CreateInsightsQuestionnairesQuestion` | Tags: FlexV1InsightsQuestionnairesQuestion

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `AllowNa` | boolean | The flag to enable for disable NA for answer. |
  | `AnswerSetId` | string | The answer_set for the question. |
  | `CategorySid` | string | The SID of the category |
  | `Question` | string | The question. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Description` | string | The description for the question. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.Insight.Qualitymanagement.Question.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Insights/QualityManagement/Questions",
             params: params,
             opts: opts,
             base_url: "https://flex-api.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Flex.V1.Insight.Qualitymanagement.Question)}
    end
  end

  @doc """
  To update the question

  Operation: `UpdateInsightsQuestionnairesQuestion` | Tags: FlexV1InsightsQuestionnairesQuestion

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `AllowNa` | boolean | The flag to enable for disable NA for answer. |
  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `AnswerSetId` | string | The answer_set for the question. |
  | `CategorySid` | string | The SID of the category |
  | `Description` | string | The description for the question. |
  | `Question` | string | The question. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.Insight.Qualitymanagement.Question.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Insights/QualityManagement/Questions/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://flex-api.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Flex.V1.Insight.Qualitymanagement.Question)}
    end
  end

  @doc """


  Operation: `DeleteInsightsQuestionnairesQuestion` | Tags: FlexV1InsightsQuestionnairesQuestion
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Insights/QualityManagement/Questions/#{sid}",
      opts: opts,
      base_url: "https://flex-api.twilio.com"
    )
  end
end
