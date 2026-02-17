# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Studio.V1.Flow.Engagement.StepService do
  @moduledoc """
  Steps within a Studio flow

  Operations: `list`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all Steps for an Engagement.

  Operation: `ListStep` | Tags: StudioV1Step
  """
  @spec list(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, flow_sid, engagement_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Flows/#{flow_sid}/Engagements/#{engagement_sid}/Steps",
           params: params,
           opts: opts,
           base_url: "https://studio.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "steps")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Studio.V1.Flow.Engagement.Step
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all Steps for an Engagement. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, flow_sid, engagement_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, flow_sid, engagement_sid, Map.merge(params, page_opts), opts)
      end,
      "steps"
    )
  end

  @doc """
  Retrieve a Step.

  Operation: `FetchStep` | Tags: StudioV1Step
  """
  @spec fetch(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Studio.V1.Flow.Engagement.Step.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, flow_sid, engagement_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/Flows/#{flow_sid}/Engagements/#{engagement_sid}/Steps/#{sid}",
             opts: opts,
             base_url: "https://studio.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Studio.V1.Flow.Engagement.Step)}
    end
  end
end
