# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Studio.V1.Flow.Engagement.Step.ContextService do
  @moduledoc """
  JSON context for individual steps

  Operations: `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve the context for an Engagement Step.

  Operation: `FetchStepContext` | Tags: StudioV1StepContext
  """
  @spec fetch(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Studio.V1.Flow.Engagement.Step.Context.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, flow_sid, engagement_sid, step_sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/Flows/#{flow_sid}/Engagements/#{engagement_sid}/Steps/#{step_sid}/Context",
             opts: opts,
             base_url: "https://studio.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Studio.V1.Flow.Engagement.Step.Context)}
    end
  end
end
