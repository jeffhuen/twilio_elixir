# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Flex.V1.Insight.Qualitymanagement.Assessment.CommentService do
  @moduledoc """


  Operations: `list`, `create`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  To create a comment assessment for a conversation

  Operation: `ListInsightsAssessmentsComment` | Tags: FlexV1InsightsAssessmentsComment

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `SegmentId` | string | The id of the segment. |
  | `AgentId` | string | The id of the agent. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Insights/QualityManagement/Assessments/Comments",
           params: params,
           opts: opts,
           base_url: "https://flex-api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "comments")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Flex.V1.Insight.Qualitymanagement.Assessment.Comment
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: To create a comment assessment for a conversation (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "comments"
    )
  end

  @doc """
  To create a comment assessment for a conversation

  Operation: `CreateInsightsAssessmentsComment` | Tags: FlexV1InsightsAssessmentsComment

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `AgentId` | string | The id of the agent. |
  | `CategoryId` | string | The ID of the category |
  | `CategoryName` | string | The name of the category |
  | `Comment` | string | The Assessment comment. |
  | `Offset` | number | The offset |
  | `SegmentId` | string | The id of the segment. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.Insight.Qualitymanagement.Assessment.Comment.t()}
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Insights/QualityManagement/Assessments/Comments",
             params: params,
             opts: opts,
             base_url: "https://flex-api.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Flex.V1.Insight.Qualitymanagement.Assessment.Comment
       )}
    end
  end
end
