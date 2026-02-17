# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Assistants.V1.Assistant.FeedbackService do
  @moduledoc """
  Service for Feedback API operations.

  Operations: `list`, `create`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  List feedbacks

  Operation: `ListFeedback`
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, id, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Assistants/#{id}/Feedbacks",
           params: params,
           opts: opts,
           base_url: "https://assistants.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "feedbacks")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Assistants.V1.Assistant.Feedback
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: List feedbacks (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, id, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, id, Map.merge(params, page_opts), opts)
      end,
      "feedbacks"
    )
  end

  @doc """
  Create feedback

  Operation: `CreateFeedback`
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Assistants.V1.Assistant.Feedback.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def create(client, id, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Assistants/#{id}/Feedbacks",
             params: params,
             opts: opts,
             base_url: "https://assistants.twilio.com",
             content_type: :json
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Assistants.V1.Assistant.Feedback)}
    end
  end
end
