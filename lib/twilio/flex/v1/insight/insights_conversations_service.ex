# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Flex.V1.Insight.InsightsConversationsService do
  @moduledoc """


  Operations: `list`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  To get conversation with segment id

  Operation: `ListInsightsConversations` | Tags: FlexV1InsightsConversations

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `SegmentId` | string | Unique Id of the segment for which conversation details needs to be fetched |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Insights/Conversations",
           params: params,
           opts: opts,
           base_url: "https://flex-api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "conversations")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Flex.V1.Insight.InsightsConversations
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: To get conversation with segment id (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "conversations"
    )
  end
end
