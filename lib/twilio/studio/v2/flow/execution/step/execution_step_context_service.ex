# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Studio.V2.Flow.Execution.Step.ExecutionStepContextService do
  @moduledoc """
  JSON context for an individual step within an execution

  Operations: `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve the context for an Execution Step.

  Operation: `FetchExecutionStepContext` | Tags: StudioV2ExecutionStepContext
  """
  @spec fetch(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Studio.V2.Flow.Execution.Step.ExecutionStepContext.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, flow_sid, execution_sid, step_sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v2/Flows/#{flow_sid}/Executions/#{execution_sid}/Steps/#{step_sid}/Context",
             opts: opts,
             base_url: "https://studio.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Studio.V2.Flow.Execution.Step.ExecutionStepContext
       )}
    end
  end
end
