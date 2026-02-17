# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Studio.V1.Flow.Execution.Step.ExecutionStepContextService do
  @moduledoc """
  JSON context for an individual step within an execution

  Operations: `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve the context for an Execution Step.

  Operation: `FetchExecutionStepContext` | Tags: StudioV1ExecutionStepContext
  """
  @spec fetch(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Studio.V1.Flow.Execution.Step.ExecutionStepContext.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, flow_sid, execution_sid, step_sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/Flows/#{flow_sid}/Executions/#{execution_sid}/Steps/#{step_sid}/Context",
             opts: opts,
             base_url: "https://studio.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Studio.V1.Flow.Execution.Step.ExecutionStepContext
       )}
    end
  end
end
