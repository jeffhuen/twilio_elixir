# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Flex.V1.Insight.Qualitymanagement.AssessmentsService do
  @moduledoc """
  Service for Assessments API operations.

  Operations: `list`, `create`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Get assessments done for a conversation by logged in user

  Operation: `ListInsightsAssessments` | Tags: FlexV1Assessments

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `SegmentId` | string | The id of the segment. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Insights/QualityManagement/Assessments",
           params: params,
           opts: opts,
           base_url: "https://flex-api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "assessments")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Flex.V1.Insight.Qualitymanagement.Assessments
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Get assessments done for a conversation by logged in user (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "assessments"
    )
  end

  @doc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Add assessments against conversation to dynamo db. Used in assessments screen by user. Users can select the questionnaire and pick up answers for each and every question.

  Operation: `CreateInsightsAssessments` | Tags: FlexV1Assessments

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `AgentId` | string | The id of the Agent |
  | `AnswerId` | string | The id of the answer selected by user |
  | `AnswerText` | string | The answer text selected by user |
  | `CategoryName` | string | The name of the category |
  | `CategorySid` | string | The SID of the category  |
  | `MetricId` | string | The question SID selected for assessment |
  | `MetricName` | string | The question name of the assessment |
  | `Offset` | number | The offset of the conversation. |
  | `QuestionnaireSid` | string | Questionnaire SID of the associated question |
  | `SegmentId` | string | Segment Id of the conversation |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.Insight.Qualitymanagement.Assessments.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Insights/QualityManagement/Assessments",
             params: params,
             opts: opts,
             base_url: "https://flex-api.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Flex.V1.Insight.Qualitymanagement.Assessments
       )}
    end
  end

  @doc """
  Update a specific Assessment assessed earlier

  Operation: `UpdateInsightsAssessments` | Tags: FlexV1Assessments

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `AnswerId` | string | The id of the answer selected by user |
  | `AnswerText` | string | The answer text selected by user |
  | `Offset` | number | The offset of the conversation |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.Insight.Qualitymanagement.Assessments.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Insights/QualityManagement/Assessments/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://flex-api.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Flex.V1.Insight.Qualitymanagement.Assessments
       )}
    end
  end
end
