# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Conversations.V2.ControlPlane.OperationService do
  @moduledoc """
  Service for Operation API operations.

  Operations: `fetch`
  """

  alias Twilio.Client

  @doc """
  Retrieve the current status of a long-running operation.
  Operations progress through: PENDING -> RUNNING -> COMPLETED or FAILED.


  Operation: `FetchOperationStatus` | Tags: ConversationsV2Operation
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    Client.request(client, :get, "/v2/ControlPlane/Operations/#{sid}",
      opts: opts,
      base_url: "https://conversations.twilio.com"
    )
  end
end
