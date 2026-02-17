# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Knowledge.V1.Knowledge.StatusService do
  @moduledoc """
  Service for Status API operations.

  Operations: `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Get knowledge status

  Operation: `FetchKnowledgeStatus`
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Knowledge.V1.Knowledge.Status.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, id, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Knowledge/#{id}/Status",
             opts: opts,
             base_url: "https://knowledge.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Knowledge.V1.Knowledge.Status)}
    end
  end
end
