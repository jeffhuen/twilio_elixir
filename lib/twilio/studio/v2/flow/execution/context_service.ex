# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Studio.V2.Flow.Execution.ContextService do
  @moduledoc """
  JSON context for executions

  Operations: `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve the most recent context for an Execution.

  Operation: `FetchExecutionContext` | Tags: StudioV2ExecutionContext
  """
  @spec fetch(Client.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Studio.V2.Flow.Execution.Context.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, flow_sid, execution_sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v2/Flows/#{flow_sid}/Executions/#{execution_sid}/Context",
             opts: opts,
             base_url: "https://studio.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Studio.V2.Flow.Execution.Context)}
    end
  end
end
