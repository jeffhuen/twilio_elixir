# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Memory.V1.ControlPlane.OperationService do
  @moduledoc """
  Service for Operation API operations.

  Operations: `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Retrieve the status and result of an asynchronous operation.

  Operation: `FetchOperation` | Tags: Operations
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Memory.V1.ControlPlane.Operation.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/ControlPlane/Operations/#{sid}",
             opts: opts,
             base_url: "https://memory.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Memory.V1.ControlPlane.Operation)}
    end
  end
end
