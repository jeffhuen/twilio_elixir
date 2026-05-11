# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Knowledge.V2.ControlPlane.OperationService do
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
          {:ok, Twilio.Resources.Knowledge.V2.ControlPlane.Operation.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v2/ControlPlane/Operations/#{sid}",
             opts: opts,
             base_url: "https://knowledge.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Knowledge.V2.ControlPlane.Operation)}
    end
  end
end
