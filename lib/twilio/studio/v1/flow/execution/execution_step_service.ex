# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Studio.V1.Flow.Execution.ExecutionStepService do
  @moduledoc """
  Individual steps within an execution

  Operations: `list`, `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve a list of all Steps for an Execution.

  Operation: `ListExecutionStep` | Tags: StudioV1ExecutionStep
  """
  @spec list(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, flow_sid, execution_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Flows/#{flow_sid}/Executions/#{execution_sid}/Steps",
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
                 Twilio.Resources.Studio.V1.Flow.Execution.ExecutionStep
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream: Retrieve a list of all Steps for an Execution. (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, flow_sid, execution_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, flow_sid, execution_sid, Map.merge(params, page_opts), opts)
      end,
      "steps"
    )
  end

  @doc """
  Retrieve a Step.

  Operation: `FetchExecutionStep` | Tags: StudioV1ExecutionStep
  """
  @spec fetch(Client.t(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Studio.V1.Flow.Execution.ExecutionStep.t()}
          | {:error, Twilio.Error.t()}
  def fetch(client, flow_sid, execution_sid, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(
             client,
             :get,
             "/v1/Flows/#{flow_sid}/Executions/#{execution_sid}/Steps/#{sid}",
             opts: opts,
             base_url: "https://studio.twilio.com"
           ) do
      {:ok,
       Deserializer.deserialize(data, Twilio.Resources.Studio.V1.Flow.Execution.ExecutionStep)}
    end
  end
end
