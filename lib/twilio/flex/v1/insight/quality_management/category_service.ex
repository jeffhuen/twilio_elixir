# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Flex.V1.Insight.QualityManagement.CategoryService do
  @moduledoc """
  Service for Category API operations.

  Operations: `list`, `create`, `update`, `delete`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  To get all the categories

  Operation: `ListInsightsQuestionnairesCategory` | Tags: FlexV1InsightsQuestionnairesCategory
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Insights/QualityManagement/Categories",
           params: params,
           opts: opts,
           base_url: "https://flex-api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "categories")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Flex.V1.Insight.QualityManagement.Category
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: To get all the categories (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "categories"
    )
  end

  @doc """
  To create a category for Questions

  Operation: `CreateInsightsQuestionnairesCategory` | Tags: FlexV1InsightsQuestionnairesCategory

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Name` | string | The name of this category. |
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.Insight.QualityManagement.Category.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Insights/QualityManagement/Categories",
             params: params,
             opts: opts,
             base_url: "https://flex-api.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Flex.V1.Insight.QualityManagement.Category)}
    end
  end

  @doc """
  To update the category for Questions

  Operation: `UpdateInsightsQuestionnairesCategory` | Tags: FlexV1InsightsQuestionnairesCategory

  ## Required Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Name` | string | The name of this category. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.Insight.QualityManagement.Category.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Insights/QualityManagement/Categories/#{sid}",
             params: params,
             opts: opts,
             base_url: "https://flex-api.twilio.com",
             content_type: :form
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Flex.V1.Insight.QualityManagement.Category)}
    end
  end

  @doc """


  Operation: `DeleteInsightsQuestionnairesCategory` | Tags: FlexV1InsightsQuestionnairesCategory
  """
  @spec delete(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def delete(client, sid, opts \\ []) do
    Client.request(client, :delete, "/v1/Insights/QualityManagement/Categories/#{sid}",
      opts: opts,
      base_url: "https://flex-api.twilio.com"
    )
  end
end
